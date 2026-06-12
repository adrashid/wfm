

// PRISM Model (DTMC) for the S-C-R-Sn weather forecating model

dtmc

const double Psc = 56/100;
const double Psc1 = 1 - Psc;

const double Pcc = 86/100;
const double Pcc1 = 1 - Pcc;

const double Pss = 44/100;
const double Pss1 = 1 - Pss;

const double Pcr = 156/1000;
const double Pcs = 73/100;
const double Pcr1 = 1 - (Pcr + Pcs);

const double Prr = 594/1000;
const double Prr1 = 1 - Prr;

const double Prc = 295/1000;
const double Prsn = 273/1000;
const double Prc1 = 1 - (Prc + Prsn);

const double Pcrr = 57/100;
const double Pcrr1 = 1 - Pcrr;

const double Psnsn = 50/100;
const double Psnsn1 = 1 - Psnsn;

const double Psnr = 50/100;
const double Psnr1 = 1 - Psnr;

const double Prsnsn = 39/100;
const double Prsnsn1 = 1 - Prsnsn;


module WFM2

    x : [0..9] init 0;

// S <-> Sunny, C <-> Cloudy, R <-> Rainy, Sn <-> Snowy

// x = 0 <-> (S,S), 
// x = 1 <-> (S,C), 
// x = 2 <-> (C,C), 
// x = 3 <-> (C,S), 
// x = 4 <-> (C,R), 
// x = 5 <-> (R,R), 
// x = 6 <-> (R,C), 
// x = 7 <-> (R,Sn), 
// x = 8 <-> (Sn,Sn), 
// x = 9 <-> (Sn,R)
   

    [] x = 0 -> Psc1:(x' = 0) + Psc:(x' = 1);
    [] x = 1 -> Pcc:(x' = 2) + Pcc1:(x' = 3);    
    [] x = 2 -> Pcr1:(x' = 2) + Pcr:(x' = 4) + Pcs:(x' = 3);
    [] x = 3 -> Pss1:(x' = 1) + Pss:(x' = 0);
    [] x = 4 -> Prr1:(x' = 6) + Prr:(x' = 5);
    [] x = 5 -> Prc1:(x' = 5) + Prsn:(x' = 7) + Prc:(x' = 6);
    [] x = 6 -> Pcrr:(x' = 4) + Pcrr1:(x' = 2);
    [] x = 7 -> Psnsn:(x' = 8) + Psnsn1:(x' = 9);
    [] x = 8 -> Psnr1:(x' = 8) + Psnr:(x' = 9);
    [] x = 9 -> Prsnsn:(x' = 7) + Prsnsn1:(x' = 5);

endmodule
