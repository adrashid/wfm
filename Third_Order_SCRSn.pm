

// PRISM Model (Third-order DTMC) for the S-C-R-Sn weather forecating model

dtmc

const double P1 = 428/10000;
const double P2 = 1 - P1;

const double P3 = 921/10000;
const double P4 = 8158/10000;
const double P5 = 1 - P3 - P4;

const double P6 = 9167/10000;
const double P7 = 1 - P6;

const double P8 = 1127/10000;
const double P9 = 8169/10000;
const double P10 = 1 - (P8 + P9);

const double P11 = 5/10;
const double P12 = 345/1000;
const double P44 = 1 - P11 - P12;

const double P13 = 8235/10000;
const double P14 = 1 - P13;

const double P15 = 5333/10000;
const double P16 = 2667/10000;
const double P17 = 1 - (P15 + P16);

const double P18 = 1556/10000;
const double P19 = 1 - P18;

const double P20 = 512/10000;
const double P21 = 879/10000;
const double P22 = 1 - (P20 + P21);

const double P23 = 5792/10000;
const double P24 = 325/1000;
const double P42 = 1 - (P23 + P24);

const double P25 = 45/100;
const double P26 = 25/100;
const double P47 = 1 - (P25 + P26);

const double P27 = 2792/10000;
const double P28 = 7143/10000;
const double P29 = 1 - (P27 + P28);


const double P30 = 541/1000;
const double P31 = 25/100;
const double P48 = 1 - (P30 + P31);

const double P32 = 6143/10000;
const double P33 = 2857/10000;
const double P34 = 1 - (P32 + P33);

const double P35 = 45/100;
const double P36 = 25/100;
const double P43 = 1 - (P35 + P36);

const double P37 = 7971/10000;
const double P38 = 145/10000;
const double P39 = 1 - (P37 + P38);

const double P40 = 456/1000;
const double P41 = 1 - P40;

const double P45 = 576/1000;
const double P46 = 1 - P45;

const double P50 = 45/100;
const double P51 = 1 - P50;

const double P52 = 455/1000;
const double P53 = 1 - P52;

const double P54 = 35/100;
const double P55 = 4/10;
const double P56 = 1 - (P54 + P55);

const double P57 = 325/1000;
const double P58 = 1 - P57;

const double P59 = 4/10;
const double P60 = 345/1000;
const double P61 = 1 - (P59 + P60);

const double P62 = 42/100;
const double P63 = 355/1000;
const double P64 = 1 - (P62 + P63);

const double P68 = 568/1000;
const double P65 = 1 - P68;

const double P66 = 365/1000;
const double P67 = 2/10;
const double P49 = 1 - (P66 + P67);


module WFMSCRSNO3

    x : [0..25] init 0;

// x = 0 <-> (S,S,S), 
// x = 1 <-> (S,S,C), 
// x = 2 <-> (S,C,S), 
// x = 3 <-> (S,C,C), 
// x = 4 <-> (S,C,R), 
// x = 5 <-> (C,S,S), 
// x = 6 <-> (C,S,C), 
// x = 7 <-> (C,C,S), 
// x = 8 <-> (C,C,C), 
// x = 9 <-> (C,C,R),
// x = 10 <-> (C,R,R),
// x = 11 <-> (C,R,C),
// x = 12 <-> (R,R,R),
// x = 13 <-> (R,R,C),
// x = 14 <-> (R,C,R),
// x = 15 <-> (R,C,S),
// x = 16 <-> (R,C,C),
// x = 17 <-> (C,R,Sn),
// x = 18 <-> (R,R,Sn),
// x = 19 <-> (R,Sn,Sn),
// x = 20 <-> (R,Sn,R),
// x = 21 <-> (Sn,Sn,R),
// x = 22 <-> (Sn,Sn,Sn),
// x = 23 <-> (Sn,R,Sn),
// x = 24 <-> (Sn,R,C),
// x = 25 <-> (Sn,R,R)

   
// S <-> Sunny, C <-> Cloudy, R <-> Rainy, Sn <-> Snowy

    [] x = 0 -> P2:(x' = 0) + P1:(x' = 1);
    [] x = 1 -> P3:(x' = 2) + P4:(x' = 3) + P5:(x' = 4);    
    [] x = 2 -> P6:(x' = 5) + P7:(x' = 6);
    [] x = 3 -> P8:(x' = 7) + P9:(x' = 8) + P10:(x' = 9);
    [] x = 4 -> P11:(x' = 10) + P12:(x' = 11) + P44:(x' = 17);
    [] x = 5 -> P13:(x' = 0) + P14:(x' = 1);
    [] x = 6 -> P15:(x' = 3) + P16:(x' = 2) + P17:(x' = 4);
    [] x = 7 -> P18:(x' = 6) + P19:(x' = 5);
    [] x = 8 -> P20:(x' = 7) + P21:(x' = 9) + P22:(x' = 8);
    [] x = 9 -> P23:(x' = 11) + P24:(x' = 10) + P42:(x' = 17);
    [] x = 10 -> P25:(x' = 12) + P26:(x' = 13) + P47:(x' = 18);
    [] x = 11 -> P27:(x' = 14) + P28:(x' = 16) + P29:(x' = 15);
    [] x = 12 -> P30:(x' = 12) + P31:(x' = 13) + P48:(x' = 18);
    [] x = 13 -> P32:(x' = 16) + P33:(x' = 14) + P34:(x' = 15);
    [] x = 14 -> P35:(x' = 10) + P36:(x' = 11) + P43:(x' = 17);
    [] x = 15 -> P40:(x' = 5) + P41:(x' = 6);
    [] x = 16 -> P37:(x' = 8) + P38:(x' = 7) + P39:(x' = 9);
    [] x = 17 -> P45:(x' = 19) + P46:(x' = 20);
    [] x = 18 -> P50:(x' = 20) + P51:(x' = 19);
    [] x = 19 -> P52:(x' = 22) + P53:(x' = 21);
    [] x = 20 -> P54:(x' = 25) + P55:(x' = 24) + P56:(x' = 23);
    [] x = 21 -> P62:(x' = 23) + P63:(x' = 24) + P64:(x' = 25);
    [] x = 22 -> P65:(x' = 22) + P68:(x' = 21);
    [] x = 23 -> P57:(x' = 20) + P58:(x' = 19);
    [] x = 24 -> P59:(x' = 16) + P60:(x' = 15) + P61:(x' = 14);
    [] x = 25 -> P49:(x' = 18) + P66:(x' = 12) + P67:(x' = 13);


endmodule
