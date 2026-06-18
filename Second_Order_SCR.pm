


// Second-Order DTMC for SCR Weather Model


dtmc

// --------------------
// Transition Probabilities
// --------------------

// (S,S)
const double P1 = 674/1000;   // (S,S) -> (S,S)
const double P2 = 326/1000;   // (S,S) -> (S,C)

// (S,C)
const double P3 = 421/1000;  // (S,C) -> (C,S)
const double P4 = 402/1000;  // (S,C) -> (C,C)
const double P5 = 177/1000;  // (S,C) -> (C,R)

// (C,S)
const double P6 = 66/100;    // (C,S) -> (S,S)
const double P7 = 34/100;    // (C,S) -> (S,C)

// (C,C)
const double P8 = 39/100;    // (C,C) -> (C,S)
const double P9 = 40/100;    // (C,C) -> (C,C)
const double P10 = 21/100;   // (C,C) -> (C,R)

// (C,R)
const double P11 = 31/100;   // (C,R) -> (R,R)
const double P12 = 69/100;   // (C,R) -> (R,C)

// (R,R)
const double P13 = 56/100;   // (R,R) -> (R,R)
const double P14 = 44/100;   // (R,R) -> (R,C)

// (R,C)
const double P15 = 32/100;   // (R,C) -> (C,C)
const double P16 = 18/100;   // (R,C) -> (C,S)
const double P17 = 50/100;   // (R,C) -> (C,R)


// --------------------
// DTMC Module
// --------------------

module WFMSCRO2

    // State encoding:
    // 0 = (S,S)
    // 1 = (S,C)
    // 2 = (C,S)
    // 3 = (C,C)
    // 4 = (C,R)
    // 5 = (R,R)
    // 6 = (R,C)

    x : [0..6] init 0;

    [] x = 0 -> P1:(x'=0) + P2:(x'=1);

    [] x = 1 -> P3:(x'=2) + P4:(x'=3) + P5:(x'=4);

    [] x = 2 -> P6:(x'=0) + P7:(x'=1);

    [] x = 3 -> P8:(x'=2) + P9:(x'=3) + P10:(x'=4);

    [] x = 4 -> P11:(x'=5) + P12:(x'=6);

    [] x = 5 -> P13:(x'=5) + P14:(x'=6);

    [] x = 6 -> P15:(x'=3) + P16:(x'=2) + P17:(x'=4);

endmodule
