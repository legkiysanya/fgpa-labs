library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity encoder8_3 is
port ( 
	   r : in std_logic_vector (7 downto 0);
	   G: out std_logic;
	   EI: in std_logic;
	   EO: out std_logic;
	   a : out std_logic_vector (2 downto 0));
end encoder8_3 ;
architecture behav of encoder8_3 is
  SIGNAL q: std_logic;
  begin
    process (r)
    variable j: integer;
    begin
    a <= "000";
    EO <= '0';
    G <= '0';
    q <= '0';
    if EI = '1' then
      for j in 0 to 7 loop
        if r(j) = '1' then
          a <= conv_std_logic_vector(j,3);
          G <= '1';
          q <= '1';
        end if;
      end loop;
      EO <= not q;
    end if;
  end process;
end behav;
