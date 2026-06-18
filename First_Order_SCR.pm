

// ======================================================
// First-Order DTMC for SCR Weather Model
// ======================================================

dtmc

// --------------------
// Transition Probabilities
// --------------------

// Sunny
const double P1 = 67/100;   // S -> S
const double P2 = 33/100;   // S -> C

// Cloudy
const double P3 = 45/100;   // C -> S
const double P4 = 37/100;   // C -> C
const double P5 = 18/100;   // C -> R

// Rainy
const double P6 = 44/100;   // R -> C
const double P7 = 56/100;   // R -> R


// --------------------
// DTMC Module
// --------------------

module WFM1

    // 0 = Sunny
    // 1 = Cloudy
    // 2 = Rainy

    x : [0..2] init 0;

    [] x = 0 -> P1:(x'=0) + P2:(x'=1);

    [] x = 1 -> P3:(x'=0) + P4:(x'=1) + P5:(x'=2);

    [] x = 2 -> P6:(x'=1) + P7:(x'=2);

endmodule
