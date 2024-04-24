library IEEE;
use IEEE.std_logic_1164.all;

-- 64 to 6 encoder
entity encoder64_6 is
    port (
     r : in std_logic_vector (63 downto 0);
	   EI: in std_logic;
	   a : out std_logic_vector (5 downto 0)
    );
end encoder64_6 ;

architecture behav of encoder64_6 is
    component encoder8_3
        port (
           r : in std_logic_vector (7 downto 0);
           G: out std_logic;
           EI: in std_logic;
           EO: out std_logic;
           a : out std_logic_vector (2 downto 0)
        );
    end component;

    signal Gs : std_logic_vector (7 downto 0);
    signal EIs : std_logic_vector (7 downto 0);
    signal EOs : std_logic_vector (7 downto 0);
    signal as0, as1, as2, as3, as4, as5, as6, as7 : std_logic_vector (2 downto 0);
    signal tmp1, tmp2, tmp3: std_logic;

    begin
        u: encoder8_3 port map (r(63 downto 56), Gs(7), EI, EOs(0), as0);
        u0: encoder8_3 port map (r(55 downto 48), Gs(6), EOs(0), EOs(1), as1);
        u1: encoder8_3 port map (r(47 downto 40), Gs(5), EOs(1), EOs(2), as2);
        u2: encoder8_3 port map (r(39 downto 32), Gs(4), EOs(2), EOs(3), as3);
        u3: encoder8_3 port map (r(31 downto 24), Gs(3), EOs(3), EOs(4), as4);
        u4: encoder8_3 port map (r(23 downto 16), Gs(2), EOs(4), EOs(5), as5);
        u5: encoder8_3 port map (r(15 downto 8), Gs(1), EOs(5), EOs(6), as6);
        u6: encoder8_3 port map (r(7 downto 0), Gs(0), EOs(6), EOs(7), as7);

		a(0) <= as0(0) or as1(0) or as2(0) or as3(0) or as4(0) or as5(0) or as6(0) or as7(0);
		a(1) <= as0(1) or as1(1) or as2(1) or as3(1) or as4(1) or as5(1) or as6(1) or as7(1);
		a(2) <= as0(2) or as1(2) or as2(2) or as3(2) or as4(2) or as5(2) or as6(2) or as7(2);

		tmp2 <= '1';
		u16: encoder8_3 port map (Gs(7 downto 0), tmp1, tmp2, tmp3, a(5 downto 3));

end behav;




