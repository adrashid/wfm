// ======================================================
// First-Order DTMC (SCRSn)
// ======================================================

dtmc

// ==============================
// Transition Probabilities
// ==============================

// Sunny
const double Pss  = 23/50;
const double Psc  = 27/50;

// Cloudy
const double Pcs  = 44/100;
const double Pcc  = 34/100;
const double Pcr  = 22/100;

// Rainy
const double Prc  = 31/100;
const double Prr  = 58/100;
const double Prsn = 11/100;

// Snowy
const double Psn_c  = 21/100;
const double Psn_r  = 31/100;
const double Psn_sn = 33/100;


// ==============================
// DTMC MODULE
// ==============================

module WFMSCRSNO1

    x : [0..3] init 0;

    // 0 = S
    // 1 = C
    // 2 = R
    // 3 = Sn

    [] x = 0 -> Pss:(x'=0) + Psc:(x'=1);

    [] x = 1 -> Pcs:(x'=0) + Pcc:(x'=1) + Pcr:(x'=2) + Pcsn:(x'=3);

    [] x = 2 -> Prs:(x'=0) + Prc:(x'=1) + Prr:(x'=2) + Prsn:(x'=3);

    [] x = 3 -> Psn_s:(x'=0) + Psn_c:(x'=1) + Psn_r:(x'=2) + Psn_sn:(x'=3);

endmodule
