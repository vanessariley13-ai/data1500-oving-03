# Besvarelse av refleksjonsspørsmål - DATA1500 Oppgavesett 1.3

Skriv dine svar på refleksjonsspørsmålene fra hver oppgave her.

---

## Oppgave 1: Docker-oppsett og PostgreSQL-tilkobling

### Spørsmål 1: Hva er fordelen med å bruke Docker i stedet for å installere PostgreSQL direkte på maskinen?

**Ditt svar:**

[Skriv ditt svar her]

---Docker gjør PostgreSQL-portabelt, isoler, enkelt å statte/stopp, og holder masinen din ren

### Spørsmål 2: Hva betyr "persistent volum" i docker-compose.yml? Hvorfor er det viktig?

**Ditt svar:**

[Skriv ditt svar her]

---Et persistent volum er databasen sin sin "harddisk" utenfor containeren. Det er viktig fordi det gjør at dataene dine ikke forsviner når du stopper, oppdaterer eller sletter containeren.

### Spørsmål 3: Hva skjer når du kjører `docker-compose down`? Mister du dataene?

**Ditt svar:**

[Skriv ditt svar her]

---Når du kjører docker-compose down, stopper og sletter containeren definert i docker-compose.yml. som standard sletter den ikke volumene, med mindre du spesifiderer -v. Altså kun docker-compose down sletter container, volumer beholdes og data er trygg. 

### Spørsmål 4: Forklar hva som skjer når du kjører `docker-compose up -d` første gang vs. andre gang.

**Ditt svar:**

[Skriv ditt svar her]

---Første gang du kjører docker-compose up -d
-Dosker sjekker docker-compose.yml og ser hvilke services som skal kjøres
-For hver service:
1.Hvis bildet ikke finnes lokalt, laser Docker det ned fra Docker Hub
2.Docker lager en ny container basert på bildet
3.Hvis du har definert et volum, opprettes det og kobles til containeren
4.Containeren startes i bakgrunnen

---Andre gang du kjører docker-compose up -d
-Docker sjekker docker-compose.yml igjen
-Containeren finnes allerede (fra første gang), så:
1.Hvis det ikke er endringer i docker-compose.yml eller bildet, gjenbrukes eksisterende containere -> de startes på nytt
2.Hvis bildet er oppdatert, kan Docker oppgradere containeren
3.Volumene er allerede opprettet -> dataene dine beholdes 

### Spørsmål 5: Hvordan ville du delt docker-compose.yml-filen med en annen student? Hvilke sikkerhetshensyn må du ta?

**Ditt svar:**

[Skriv ditt svar her]

---Del docker-compose.yml via Git eller annen deling, men aldri med ekte passord eller hemmelige nøkler. Bruk .env-filer og eksempelfiler for sikker deling.

## Oppgave 2: SQL-spørringer og databaseskjema

### Spørsmål 1: Hva er forskjellen mellom INNER JOIN og LEFT JOIN? Når bruker du hver av dem?

**Ditt svar:**

[Skriv ditt svar her]

INNER JOIN - returnerer kun de radene hvor det finnes en match i begge tabellene
LEFT JOUN - Returnerer alle rader fra ventstre tabell, selv om det ikke finnes match i høyre tabell

---


### Spørsmål 2: Hvorfor bruker vi fremmednøkler? Hva skjer hvis du prøver å slette et program som har studenter?


**Ditt svar:**

[Skriv ditt svar her]

En fremmednøkkel er en kolonne i en tabell som refererer til primærnøkkelen i en annen tabell.
Fremmednøkler brukes for å sikre referanseintegritet i databasen. de sørger for at en kolonne i en tabell kun kan referere til eksisterende verdier i en annen tabell, og hindrer at det oppstår "løse" eller inkonsistente data.
Hvis man prøver å slette et program som det finnes studenter til, vil databasen som standard blokkere slettingen og gi en feilmelding, fordi det finnes referanser fra studenter til programmet. (Med mindre fremmednøkkkelen er definert med ON DELETE CASCADE eller ON DELETE SET NULL)

---

### Spørsmål 3: Forklar hva `GROUP BY` gjør og hvorfor det er nødvendig når du bruker aggregatfunksjoner.

**Ditt svar:**

[Skriv ditt svar her]
---
GROUP BY - grupperer rader i en tabell etter en eller flere kolonner, slik at aggregatfunksjoner som COUNT; SUM, AVG; MAX, MIN kan begrenses for hver gruppe.
Det er nødvendig fordi aggregatfunksjoner ellers ville beregnet en samlet verdi for hele tabellen, og GROUP BY lar deg få resultat per gruppe, for eksempel antall studenter per program eller gjennomsnittskarakter per emne. 


### Spørsmål 4: Hva er en indeks og hvorfor er den viktig for ytelse?

**Ditt svar:**

[Skriv ditt svar her]
En indeks er en datastruktur som gjør det raskere å finne rader i en tabell basert på en eller flere kolonner, omtrent som et innholdsregister i en bok. 
Den er viktig for ytelse fordi søk, filtrering og join-operasjoner kan gå mye raskere, spesielt i store tabeller, uten å måtte lese alle radene sekvensielt. 

---

### Spørsmål 5: Hvordan ville du optimalisert en spørring som er veldig treg?

**Ditt svar:**

[Skriv ditt svar her]

---
For å optimalisere en treg spørring kan man:
1. Bruke indekser på kolonner som brukes i WHERE, JOIN eller ORDER BY
2. Redusere antall rader som behandles, f.eks med WHERE-filtre eller LIMIT
3. Unngå unødvendig JOINS eller subqueries
4. Velge bare nødvendige kolonner i stedet for SELECT *
5. Se på spørringsplanen (EXPLAIN) for å identifisere flaskehalser
6. Kort sagt: Fokus på å minimere datamengde og gjøre søk raskere

## Oppgave 3: Brukeradministrasjon og GRANT

### Spørsmål 1: Hva er prinsippet om minste rettighet? Hvorfor er det viktig?

**Ditt svar:**

[Skriv ditt svar her]

---

### Spørsmål 2: Hva er forskjellen mellom en bruker og en rolle i PostgreSQL?

**Ditt svar:**

[Skriv ditt svar her]

---

### Spørsmål 3: Hvorfor er det bedre å bruke roller enn å gi rettigheter direkte til brukere?

**Ditt svar:**

[Skriv ditt svar her]

---

### Spørsmål 4: Hva skjer hvis du gir en bruker `DROP` rettighet? Hvilke sikkerhetsproblemer kan det skape?

**Ditt svar:**

[Skriv ditt svar her]

---

### Spørsmål 5: Hvordan ville du implementert at en student bare kan se sine egne karakterer, ikke andres?

**Ditt svar:**

[Skriv ditt svar her]

---

## Notater og observasjoner

Bruk denne delen til å dokumentere interessante funn, problemer du møtte, eller andre observasjoner:

[Skriv dine notater her]


## Oppgave 4: Brukeradministrasjon og GRANT

1. **Hva er Row-Level Security og hvorfor er det viktig?**
   - Svar her...

2. **Hva er forskjellen mellom RLS og kolonnebegrenset tilgang?**
   - Svar her...

3. **Hvordan ville du implementert at en student bare kan se karakterer for sitt eget program?**
   - Svar her...

4. **Hva er sikkerhetsproblemene ved å bruke views i stedet for RLS?**
   - Svar her...

5. **Hvordan ville du testet at RLS-policyer fungerer korrekt?**
   - Svar her...

---

## Referanser

- PostgreSQL dokumentasjon: https://www.postgresql.org/docs/
- Docker dokumentasjon: https://docs.docker.com/

