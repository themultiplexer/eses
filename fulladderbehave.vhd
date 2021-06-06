ARCHITECTURE behavioral_seq OF FULLADD IS
BEGIN PROCESS( A, B, CIN)
BEGIN
IF(A='1' AND B='1') THEN
    SUM <= CIN;
    CARRY <= '1';
ELSE
    IF(A='1' OR B='1') THEN 
        IF(CIN='1') THEN
            SUM <= '0';
            CARRY <= '1';
        ELSE 
            SUM  <= '1';
        END IF;
    ELSE
        SUM <= CIN;
	CARRY <= '0';
    END IF;
END IF;
END PROCESS;
END behavioral_seq;
