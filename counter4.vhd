library ieee;
use ieee.std_logic_1164.all;

-- 4 bit counter
entity counter4 is
  port (clk, jk, r: in std_logic;
        q : out std_logic_vector(3 downto 0) := (others => '0'));
 end counter4 ;

architecture behavior of counter4 is  
  SIGNAL qs : std_logic_vector(3 downto 0) := (others => '0');
  begin
  process(r, clk, jk) 
	begin	
      if (r='0') then
		qs <= (others => '0');
      elsif (clk'event and clk='1') then
		if (jk = '1') then
			if qs(0) = '0' then
				qs(0) <= '1';
			elsif (qs(1) = '0') then
				qs(0) <= '0';
				qs(1) <= '1';
			elsif (qs(2) = '0') then
				qs(0) <= '0';
				qs(1) <= '0';
				qs(2) <= '1';
			elsif (qs(3) = '0') then
				qs(0) <= '0';
				qs(1) <= '0';
				qs(2) <= '0';
				qs(3) <= '1';
			end if;
	  	end if;
	 end if;
	q <= qs;
  end process;
end behavior;

