-- 1. **Hent alle studenter som ikke har noen emneregistreringer**
    SELECT
        s.fornavn,
        s.etternavn
    FROM studenter s
             JOIN emneregistreringer em
                  ON s.student_id = em.student_id
    WHERE em.student_id IS NULL
    ORDER BY s.etternavn, s.fornavn;



-- 2. **Hent alle emner som ingen studenter er registrert på**
    SELECT fornavn, etternavn, emne_navn AS emne, registrert_dato
    FROM emneregistreringer em
        JOIN studenter s
            ON em.student_id=s.student_id
        JOIN emner e
            ON em.emne_id = e.emne_id
    WHERE registrert_dato IS NULL;




-- 3. **Hent studentene med høyeste karakter per emne**
    SELECT fornavn, etternavn, emne_navn, emne_kode, karakter
    FROM emneregistreringer em
        JOIN studenter s
            ON em.student_id =s.student_id
        JOIN emner e
            ON em.emne_id = e.emne_id;




-- 4. **Lag en rapport som viser hver student, deres program, og antall emner de er registrert på**
    SELECT fornavn, etternavn, emne_kode,emne_navn,program_navn
    FROM emneregistreringer em
        JOIN studenter s
            ON em.student_id=s.student_id
        JOIN emner e
            ON em.emne_id=e.emne_id
        JOIN programmer p
            ON s.program_id = p.program_id;




-- 5. **Hent alle studenter som er registrert på både DATA1500 og DATA1100**
    SELECT
        s.fornavn,
        s.etternavn,
        e.emne_kode
    FROM studenter s
             JOIN emneregistreringer er
                  ON s.student_id = er.student_id
             JOIN emner e
                  ON er.emne_id = e.emne_id
    WHERE e.emne_kode IN ('DATA1500', 'DATA1100')
    ORDER BY s.etternavn;