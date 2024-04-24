library IEEE;
use IEEE.std_logic_1164.all;

-- two bit comparator
entity comparator2 is
port (
 X, Y: in std_logic_vector(1 downto 0); 
 XMY0, XLY0, XEY0 : in std_logic;
 X_less_Y: out std_logic; 
 X_equal_Y: out std_logic;
 X_more_Y: out std_logic);
end comparator2 ;
architecture behav of comparator2 is
signal XEY_tmp1, XEY_tmp2, XMY_tmp1, XMY_tmp2,
       XMY_tmp3, XLY_tmp1, XLY_tmp2, XLY_tmp3: std_logic; 

begin
 -- XEY logic
 XEY_tmp1 <= not (X(1) xor Y(1));
 XEY_tmp2 <= not (X(0) xor Y(0));
 X_equal_Y <= not (not (XEY_tmp1 and XEY_tmp2 and XEY0));

 -- XMY logic
 XMY_tmp1 <= not (XEY_tmp1 and not Y(0) and X(0));
 XMY_tmp2 <= not (X(1) and not Y(1));
 XMY_tmp3 <= not (XEY_tmp2 and XEY_tmp1 and XMY0);
 X_more_Y <= not (XMY_tmp1 and XMY_tmp2 and XMY_tmp3);

 -- XLY logic
 XLY_tmp1 <= not (XEY_tmp1 and Y(0) and not X(0));
 XLY_tmp2 <= not (not X(1) and Y(1));
 XLY_tmp3 <= not (XEY_tmp2 and XEY_tmp1 and XLY0);
 X_less_Y <= not (XLY_tmp1 and XLY_tmp2 and XLY_tmp3);
end behav;
