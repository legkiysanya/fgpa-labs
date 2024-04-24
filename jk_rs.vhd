library ieee;
use ieee.std_logic_1164.all;

-- jk-rs trigger
entity jk_rs is
  port (clk,j,k,s,r : in std_logic;
        q: out std_logic;
        qi : out std_logic);
 end jk_rs ;

architecture behavior of jk_rs is  
  signal qs: std_logic;
  signal input: std_logic_vector(1 downto 0);
  begin
   input <= j & k;
    process(r, s, clk) 
     begin
      if (r='0') then
        qs <= '0';
      elsif (s='0') then
        qs <= '1';
      elsif (clk'event and clk='1') then
       case (input) is
        when "10"=> qs <= '1';
        when "01"=> qs <= '0';
        when "11"=> qs <= not qs;
        when others => qs <= qs;
       end case;
      end if;
     end process;
    q <= qs;
    qi <= not qs;   
end behavior;
