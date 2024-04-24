use IEEE.std_logic_1164.all;

-- 6 to 64 decoder 
entity decoder6_64 is
    port (
        a : in std_logic_vector (5 downto 0);
        q : out std_logic_vector (63 downto 0);
        en: in std_logic
    );
end decoder6_64;

architecture behav of decoder6_64 is
    component decoder3_8
        port (
          a : in std_logic_vector (2 downto 0);
          en: in std_logic;
          q : out std_logic_vector (7 downto 0)
        );
    end component;

	signal q1s : std_logic_vector (7 downto 0);

begin
    u: decoder3_8
          port map (a(5 downto 3), en, q1s);
    u0: decoder3_8
          port map (a(2 downto 0), q1s(0), (q(7 downto 0)));
    u1: decoder3_8
          port map (a(2 downto 0), q1s(1), (q(15 downto 8)));
    u2: decoder3_8
          port map (a(2 downto 0), q1s(2), (q(23 downto 16)));
    u3: decoder3_8
          port map (a(2 downto 0), q1s(3), (q(31 downto 24)));
    u4: decoder3_8
          port map (a(2 downto 0), q1s(4), (q(39 downto 32)));
    u5: decoder3_8
          port map (a(2 downto 0), q1s(5), (q(47 downto 40)));
    u6: decoder3_8
          port map (a(2 downto 0), q1s(6), (q(55 downto 48)));
    u7: decoder3_8
        port map (a(2 downto 0), q1s(7), (q(63 downto 56)));
end behav;
