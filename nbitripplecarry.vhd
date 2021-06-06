LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;

-- Neues Verhalten mit Verzögerung
ARCHITECTURE delayedbehavior OF FULLADD IS
BEGIN PROCESS(A, B, CIN)
BEGIN
IF(A='1' AND B='1') THEN
    SUM <= CIN after 2 ns;
    CARRY <= '1' after 2 ns;
ELSE
    IF(A='1' OR B='1') THEN 
        IF(CIN='1') THEN
            SUM <= '0' after 2 ns;
            CARRY <= '1' after 2 ns;
        ELSE
            CARRY <= '0' after 2 ns;
            SUM  <= '1' after 2 ns;
        END IF;
    ELSE
        SUM <= CIN after 2 ns;
	CARRY <= '0' after 2 ns;
    END IF;
END IF;
END PROCESS;
END delayedbehavior;


ENTITY NBITADDER IS
GENERIC(wortbreite: positive := 64);
  PORT(A,B: IN BIT_VECTOR(wortbreite-1 DOWNTO 0);
  CIN: IN BIT;
  S: OUT BIT_VECTOR(wortbreite-1 DOWNTO 0);
  COUT: OUT BIT);
END NBITADDER;


architecture struct of NBITADDER is
	SIGNAL carry : bit_vector(0 TO wortbreite-1);
	component FULLADD
	  port(A,B,CIN: in bit;
	       SUM,CARRY: out bit);
	end component;
begin
  FA_1: FULLADD PORT MAP(A(0),B(0), CIN, S(0), carry(0));

  HMM:
    FOR n IN 1 TO wortbreite-2 GENERATE 
      FA_N: FULLADD PORT MAP(A(n),B(n), carry(n-1), S(n), carry(n));
    END GENERATE;

  FA_LAST: FULLADD PORT MAP(A(wortbreite-1),B(wortbreite-1), carry(wortbreite-2), S(wortbreite-1), COUT);
end struct;