-- 1. **Opprett en rolle `program_ansvarlig` som kan lese og oppdatere programmer-tabellen, men ikke slette**

-- //Koble til som admin
docker-compose exec postgres psql -U admin -d data1500_db

-- //Opprett rolle, output: CREATE ROLE
CREATE ROLE program_ansvarlig LOGIN PASSWORD 'program_pass';

-- //Gir SELECT, UPDATE på programmer til program_ansvarlig
GRANT SELECT, UPDATE ON programmer TO program_ansvarlig;

-- Kobler til som program_ansvarlig
 docker-compose exec postgres psql -U program_ansvarlig -d data1500_db

-- Tester om program_ansvalrig har tilgang til å lese og oppdatere på programmtabellen
SELECT * FROM programmer;
UPDATE programmer SET program_navn = 'Sykepleier'
WHERE program_id = 1;



--
-- 2. **Opprett en rolle `student_self_view` som bare kan se sitt eget studentdata (hint: bruk en VIEW)**

-- //Kobler til som admin
docker-compose exec postgres psql -U admin -d data1500_db

-- //Opprett rolle
CREATE ROLE student_self_view LOGIN PASSWORD 'student_pass';

-- //Før du lager viewet, må du legge til kolonnen brukernavn i tabellen:
-- //Nå har tabellen en kolonne som kan lage hvilken rolle som eier raden
ALTER TABLE studenter ADD COLUMN brukernavn TEXT;

-- //Sett verdien for en student
-- //For eksempel, hvis du vil teste med en student:
-- //Dette kobler raden til rollen student_self_view
UPDATE studenter
SET brukernavn = 'student_self_view'
WHERE student_id = 5;

-- //Opprett et view som kun studentenes egne data, Current_user sørger for at studenten kun ser din egen rad. (du kan legge til flere kolonner om nødvendig) (f.eks. program, smester).
CREATE VIEW student_self AS SELECT * FROM studenter WHERE brukernavn = current_user;
--
-- //Gi SELECT-tilgang på VIEW-et. Rollen kan nå lese data via viewet. Rollen har ikke tilgang til hele tabellen, bare til viewet
GRANT SELECT ON student_self TO student_self_view;

-- //Test at det fungerer. Studenten ser kun sin egen rad.
SET ROLE student_self_view;
SELECT * FROM student_self;


--
-- 3. **Gi `foreleser_role` tilgang til å lese fra `student_view` (som allerede er opprettet)**
--
-- Koble til som admin
docker-compose exec postgres psql -U admin -d data1500_db

-- Gir tilgang til foreleser til å lese fra student_view
GRANT SELECT ON student_view TO foreleser_role;

-- Går og tester om foreleser_roler har tilgang til å lese fra student_view
docker-compose exec postgres psql -U foreleser_role -d data1500_db


SELECT * FROM student_view;





-- 4. **Opprett en rolle `backup_bruker` som bare har SELECT-rettighet på alle tabeller**
--

-- //Kobler til som admin
docker-compose exec postgres psql -U admin -d data1500_db

-- //Oppretter en rolle 'backup_bruker'
CREATE ROLE backup_bruker LOGIN PASSWORD 'backup_pass'

-- //Gir tilgang til alle eksisterende tabeller i et schema (schema er som en mappe inne i databasen)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO backup_bruker;

-- //Viser alle tabeller og hvilke roller som har rettigheter. Ser om backup_bruker har r (read/SELECT) på alle tabeller
\z

-- //Test om backup_bruker har tilgang til alle tabeller
-- //Henter alle tabeller manuelt ved bruk av SELECT * FROM ......
docker-compose exec postgres psql -U backup_bruker -d data1500_db



-- 5. **Lag en oversikt over alle roller og deres rettigheter**

-- //Viser alle tabeller og hvilke roller som har rettighetene (SELECT, INSERT; UPDATE; DELETE)
\z


-- //Viser alle roller og deres globale rettigheter (SUperuser, Create DB, Create Role)
\du

-- //Sammen gir dette en full oversikt over roller og deres rettigheter

