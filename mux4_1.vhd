library IEEE;
use IEEE.std_logic_1164.all;

-- mux 4 to 1 
entity mux4_1 is
port ( a : in std_logic_vector (1 downto 0);
	   en : in std_logic;
	   x : in std_logic_vector (3 downto 0);
	   f : out std_logic);
end mux4_1;
architecture behav of mux4_1 is
begin
	process (a, en) begin
		if (en = '1') then
			case a is
				when "00" => f <= x(0);
				when "01" => f <= x(1);
				when "10" => f <= x(2);
				when "11" => f <= x(3);
				when others => f <= '0';
			end case;
		else 
			f <= '0';
		end if;
	end process;
end behav;
