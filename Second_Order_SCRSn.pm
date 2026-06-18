// ======================================================
// Second-Order DTMC (SCRSn Weather Model)
// ======================================================

dtmc

// ==============================
// Transition Probabilities
// ==============================

// (S,S)
const double Psc = 34/100;
const double Psc1 = 66/100;

// (S,C)
const double Pcc = 86/100;
const double Pcc1 = 14/100;

// (C,C)
const double Pccs = 44/100;
const double Pccc = 36/100;
const double Pccr = 20/100;

// (C,S)
const double Pssc = 56/100;
const double Psss = 44/100;

// (C,R)
const double Prr = 59/100;
const double Prrc = 30/100;
const double Prrsn = 11/100;

// (R,R)
const double Prc = 60/100;
const double Prrr = 30/100;
const double Prrsn = 10/100;

// (R,C)
const double Pcrc = 73/100;
const double Pcrr = 27/100;

// (R,Sn)
const double Psnsn = 50/100;
const double Psnr = 50/100;

// (Sn,Sn)
const double Psnsnsn = 61/100;
const double Psnsnr = 39/100;

// (Sn,R)
const double Psnrr = 44/100;
const double Psnrsn = 36/100;
const double Psnrc = 20/100;


// ==============================
// DTMC Module
// ==============================

module WFMSCRSNO2

    x : [0..9] init 0;

    // State encoding:
    // 0 = (S,S)
    // 1 = (S,C)
    // 2 = (C,C)
    // 3 = (C,S)
    // 4 = (C,R)
    // 5 = (R,R)
    // 6 = (R,C)
    // 7 = (R,Sn)
    // 8 = (Sn,Sn)
    // 9 = (Sn,R)

    [] x = 0 -> Psc:(x'=0) + Psc1:(x'=1);

    [] x = 1 -> Pcc:(x'=2) + Pcc1:(x'=3);

    [] x = 2 -> Pccs:(x'=3) + Pccc:(x'=2) + Pccr:(x'=4);

    [] x = 3 -> Psss:(x'=0) + Pssc:(x'=1);

    [] x = 4 -> Prr:(x'=5) + Prrc:(x'=6) + Prrsn:(x'=7);

    [] x = 5 -> Prc:(x'=6) + Prrr:(x'=5) + Prrsn:(x'=7);

    [] x = 6 -> Pcrc:(x'=2) + Pcrr:(x'=4);

    [] x = 7 -> Psnsn:(x'=8) + Psnr:(x'=9);

    [] x = 8 -> Psnsnsn:(x'=8) + Psnsnr:(x'=9);

    [] x = 9 -> Psnrr:(x'=5) + Psnrc:(x'=6) + Psnrsn:(x'=7);

endmodule
