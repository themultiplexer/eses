LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY testbenchalu IS END testbenchalu;

ARCHITECTURE testdriver OF testbenchalu IS 
  SIGNAL reset, op1_ready, op2_ready, opID_ready: BIT;
  SIGNAL opID: BIT_VECTOR(1 downto 0);
  SIGNAL res_ready: BIT;
  SIGNAL data: STD_LOGIC_VECTOR(31 downto 0);

  SIGNAL clk: BIT := '0';

  COMPONENT ALU PORT(
	clk, reset, op1_ready, op2_ready, opID_ready: in bit;
	opID: IN BIT_VECTOR(1 downto 0);
	res_ready: out bit;
	data: INOUT STD_LOGIC_VECTOR(31 downto 0));
  END COMPONENT;

BEGIN
  DuT : ALU PORT MAP(clk, reset, op1_ready, op2_ready, opID_ready, opID, res_ready, data);
  clk <= NOT clk AFTER 20 ns;

  stimulus: PROCESS
    BEGIN
    -- Start with reset = 0 and latch it
    reset <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    reset <= '1';
    WAIT UNTIL clk'EVENT AND clk= '0';
    reset <= '0';

    -- Send Operand 1
    WAIT UNTIL clk'EVENT AND clk= '1';
    op1_ready <= '1';
    data <= std_logic_vector(to_signed(500,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op1_ready <= '0';

    -- Send Operand 2
    WAIT UNTIL clk'EVENT AND clk= '1';
    op2_ready <= '1';
    data <= std_logic_vector(to_signed(500,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op2_ready <= '0';

    -- Send Operand 3
    WAIT UNTIL clk'EVENT AND clk= '1';
    opID_ready <= '1';
    opID <= "00";
    WAIT UNTIL clk'EVENT AND clk= '0';
    opID_ready <= '0';

    -- Wait for res_ready
    WAIT UNTIL res_ready='1';
    assert data = std_logic_vector(to_signed(1000,32));

    WAIT UNTIL clk'EVENT AND clk= '1';
    reset <= '1';
    WAIT UNTIL clk'EVENT AND clk= '0';
    reset <= '0';

    -- Send Operand 1
    WAIT UNTIL clk'EVENT AND clk= '1';
    op1_ready <= '1';
    data <= std_logic_vector(to_unsigned(50000,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op1_ready <= '0';

    -- Send Operand 2
    WAIT UNTIL clk'EVENT AND clk= '1';
    op2_ready <= '1';
    data <= std_logic_vector(to_signed(50000,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op2_ready <= '0';

    -- Send Operand 3
    WAIT UNTIL clk'EVENT AND clk= '1';
    opID_ready <= '1';
    opID <= "00";
    WAIT UNTIL clk'EVENT AND clk= '0';
    opID_ready <= '0';

    -- Wait for res_ready
    WAIT UNTIL res_ready='1';
    assert data = std_logic_vector(to_signed(10000000,32));





    WAIT UNTIL clk'EVENT AND clk= '1';
    reset <= '1';
    WAIT UNTIL clk'EVENT AND clk= '0';
    reset <= '0';

    -- Send Operand 1
    WAIT UNTIL clk'EVENT AND clk= '1';
    op1_ready <= '1';
    data <= std_logic_vector(to_signed(500,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op1_ready <= '0';

    -- Send Operand 2
    WAIT UNTIL clk'EVENT AND clk= '1';
    op2_ready <= '1';
    data <= std_logic_vector(to_signed(500,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op2_ready <= '0';

    -- Send Operand 3
    WAIT UNTIL clk'EVENT AND clk= '1';
    opID_ready <= '1';
    opID <= "01";
    WAIT UNTIL clk'EVENT AND clk= '0';
    opID_ready <= '0';

    -- Wait for res_ready
    WAIT UNTIL res_ready='1';
    assert data = std_logic_vector(to_signed(0,32));

    WAIT UNTIL clk'EVENT AND clk= '1';
    reset <= '1';
    WAIT UNTIL clk'EVENT AND clk= '0';
    reset <= '0';

    -- Send Operand 1
    WAIT UNTIL clk'EVENT AND clk= '1';
    op1_ready <= '1';
    data <= std_logic_vector(to_signed(10000,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op1_ready <= '0';

    -- Send Operand 2
    WAIT UNTIL clk'EVENT AND clk= '1';
    op2_ready <= '1';
    data <= std_logic_vector(to_signed(5000,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op2_ready <= '0';

    -- Send Operand 3
    WAIT UNTIL clk'EVENT AND clk= '1';
    opID_ready <= '1';
    opID <= "10";
    WAIT UNTIL clk'EVENT AND clk= '0';
    opID_ready <= '0';

    -- Wait for res_ready
    WAIT UNTIL res_ready='1';
    assert data = std_logic_vector(to_signed(5000,32));





    WAIT UNTIL clk'EVENT AND clk= '1';
    reset <= '1';
    WAIT UNTIL clk'EVENT AND clk= '0';
    reset <= '0';

    -- Send Operand 1
    WAIT UNTIL clk'EVENT AND clk= '1';
    op1_ready <= '1';
    data <= std_logic_vector(to_signed(500,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op1_ready <= '0';

    -- Send Operand 2
    WAIT UNTIL clk'EVENT AND clk= '1';
    op2_ready <= '1';
    data <= std_logic_vector(to_signed(500,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op2_ready <= '0';

    -- Send Operand 3
    WAIT UNTIL clk'EVENT AND clk= '1';
    opID_ready <= '1';
    opID <= "11";
    WAIT UNTIL clk'EVENT AND clk= '0';
    opID_ready <= '0';

    -- Wait for res_ready
    WAIT UNTIL res_ready='1';
    assert data = std_logic_vector(to_signed(250000,32));

    WAIT UNTIL clk'EVENT AND clk= '1';
    reset <= '1';
    WAIT UNTIL clk'EVENT AND clk= '0';
    reset <= '0';

    -- Send Operand 1
    WAIT UNTIL clk'EVENT AND clk= '1';
    op1_ready <= '1';
    data <= std_logic_vector(to_signed(20000,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op1_ready <= '0';

    -- Send Operand 2
    WAIT UNTIL clk'EVENT AND clk= '1';
    op2_ready <= '1';
    data <= std_logic_vector(to_signed(20000,32));
    WAIT UNTIL clk'EVENT AND clk= '0';
    op2_ready <= '0';

    -- Send Operand 3
    WAIT UNTIL clk'EVENT AND clk= '1';
    opID_ready <= '1';
    opID <= "11";
    WAIT UNTIL clk'EVENT AND clk= '0';
    opID_ready <= '0';

    -- Wait for res_ready
    WAIT UNTIL res_ready='1';
    assert data = std_logic_vector(to_signed(400000000,32));

  END PROCESS;

END testdriver;
