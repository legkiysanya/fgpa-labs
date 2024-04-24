library ieee;
use ieee.std_logic_1164.all;

-- trs trigger
entity trs is
  port (clk, t, s, r : in std_logic;
        q: out std_logic;
        qi : out std_logic);
 end trs ;

architecture behavior of trs is  
  signal qs: std_logic;
  begin
    process(r, s, clk, t) 
     begin
      if (r='0') then
        qs <= '0';
      elsif (s='0') then
        qs <= '1';
      elsif (clk'event and clk='1') then
		if t = '1' then
			qs <= not qs;
		end if;
      end if;
    q <= qs;
    qi <= not qs; 
     end process;
end behavior;


