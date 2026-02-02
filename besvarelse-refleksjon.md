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

---

### Spørsmål 2: Hvorfor bruker vi fremmednøkler? Hva skjer hvis du prøver å slette et program som har studenter?

**Ditt svar:**

[Skriv ditt svar her]

---

### Spørsmål 3: Forklar hva `GROUP BY` gjør og hvorfor det er nødvendig når du bruker aggregatfunksjoner.

**Ditt svar:**

[Skriv ditt svar her]

---

### Spørsmål 4: Hva er en indeks og hvorfor er den viktig for ytelse?

**Ditt svar:**

[Skriv ditt svar her]

---

### Spørsmål 5: Hvordan ville du optimalisert en spørring som er veldig treg?

**Ditt svar:**

[Skriv ditt svar her]

---

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

