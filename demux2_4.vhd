library IEEE;
use IEEE.std_logic_1164.all;

--demultiplexer 2 to 4
entity demux2_4 is
port ( X : in std_logic_vector (1 downto 0);
	   E : in std_logic;
	   F : out std_logic_vector (3 downto 0));
end demux2_4;
architecture behav of demux2_4 is
begin
	process (X, E)
	begin
	if (E = '1') then
		case X is
			when "00" => F <= "0001";
			when "01" => F <= "0010";
			when "10" => F <= "0100";
			when "11" => F <= "1000";
			when others => F <= "0000";
		end case;
	else 
		F <= "0000";
	end if;
	end process;
end behav;
