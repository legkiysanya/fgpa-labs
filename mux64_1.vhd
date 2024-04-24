library IEEE;
use IEEE.std_logic_1164.all;

-- mux 64 to 1
entity mux64_1 is
    port (a : in std_logic_vector (5 downto 0);
		  en: in std_logic;
		  x : in std_logic_vector (63 downto 0);
          f : out std_logic);
end mux64_1 ;

architecture behav of mux64_1 is
    component mux16_1
        port (  a : in std_logic_vector (3 downto 0);
		  		en: in std_logic;
		  		x : in std_logic_vector (15 downto 0);
          		f : out std_logic);
    end component;

    component mux4_1
        port (a : in std_logic_vector (1 downto 0);
	   		  en : in std_logic;
	   		  x : in std_logic_vector (3 downto 0);
	   		  f : out std_logic);
    end component;

	signal x_tmp : std_logic_vector (3 downto 0);

begin
   	u0: mux16_1
        port map (a(3 downto 0), en, x(15 downto 0),  x_tmp(0));
    u1: mux16_1
        port map (a(3 downto 0), en, x(31 downto 16),  x_tmp(1));
    u2: mux16_1
        port map (a(3 downto 0), en, x(47 downto 32),  x_tmp(2));
 	u3: mux16_1
        port map (a(3 downto 0), en, x(63 downto 48),  x_tmp(3));
    u4: mux4_1
        port map (a(5 downto 4), en, x_tmp, f);
end behav;

CONFIGURATION con OF mux64_1 IS
	FOR behav

		FOR u0, u1, u2, u3: mux16_1
			USE ENTITY work.mux4_1(behavior); 
		END FOR;
		FOR u4: mux4_1
			USE ENTITY work.mux4_1(behavior); 
		END FOR;
	END FOR;
END con;
