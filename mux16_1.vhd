library IEEE;
use IEEE.std_logic_1164.all;

-- mux 16 to 1
entity mux16_1 is
    port (a : in std_logic_vector (3 downto 0);
		  en: in std_logic;
		  x : in std_logic_vector (15 downto 0);
          f : out std_logic);
end mux16_1 ;

architecture behav of mux16_1 is
    component mux4_1
        port (a : in std_logic_vector (1 downto 0);
	   		  en : in std_logic;
	   		  x : in std_logic_vector (3 downto 0);
	   		  f : out std_logic);
    end component;

	signal x_tmp : std_logic_vector (3 downto 0);

begin
   	u0: mux4_1
        port map (a(1 downto 0), en, x(3 downto 0),  x_tmp(0));
    u1: mux4_1
        port map (a(1 downto 0), en, x(7 downto 4),  x_tmp(1));
    u2: mux4_1
        port map (a(1 downto 0), en, x(11 downto 8),  x_tmp(2));
 	u3: mux4_1
        port map (a(1 downto 0), en, x(15 downto 12), x_tmp(3));
    u4: mux4_1
        port map (a(3 downto 2), en, x_tmp, f);
end behav;

CONFIGURATION con OF mux16_1 IS
	FOR behav

		FOR u0, u1, u2, u3, u4: mux4_1
			USE ENTITY work.mux4_1(behavior); 
		END FOR;

	END FOR;
END con;
