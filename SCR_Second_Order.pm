

// PRISM Model (DTMC) for the S-C-R weather forecating model

dtmc

// Transition probabilities

const double Psc = 34/100;
const double Psc1 = 1 - Psc;

const double Pcc = 41/100;
const double Pcc1 = 1 - Pcc;

const double Pss = 66/100;
const double Pss1 = 1 - Pss;

const double Pcr = 92/1000;
const double Pcs = 54/100;
const double Pcr1 = 1 - (Pcr + Pcs);

const double Prr = 70/100;
const double Prr1 = 1 - Prr;

const double Prc = 30/100;
const double Prc1 = 1 - Prc;

const double Pcrr = 20/100;
const double Pcrr1 = 1 - Pcrr;


module WFM1

    x : [0..6] init 0;
	
// S <-> Sunny, C <-> Cloudy, R <-> Rainy

// x = 0 <-> (S,S), 
// x = 1 <-> (S,C), 
// x = 2 <-> (C,C), 
// x = 3 <-> (C,R), 
// x = 4 <-> (R,R), 
// x = 5 <-> (R,C), 
// x = 6 <-> (C,S)
    
    [] x = 0 -> Psc1:(x' = 0) + Psc:(x' = 1);
    [] x = 1 -> Pcc:(x' = 2) + Pcc1:(x' = 6);    
    [] x = 2 -> Pcr1:(x' = 2) + Pcr:(x' = 3) + Pcs:(x' = 6);
    [] x = 3 -> Prr1:(x' = 5) + Prr:(x' = 4);
    [] x = 4 -> Prc1:(x' = 4) + Prc:(x' = 5);
    [] x = 5 -> Pcrr:(x' = 3) + Pcrr1:(x' = 2);
    [] x = 6 -> Pss:(x' = 0) + Pss1:(x' = 1);

endmodule
