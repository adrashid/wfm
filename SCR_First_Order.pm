// First-Order DTMC Weather Forecasting Model
// States: Sunny (S), Cloudy (C), Rainy (R)

dtmc

// Transition probabilities

const double Pss = 66/100;
const double Psc = 34/100;

const double Pcs = 54/100;
const double Pcr = 92/1000;
const double Pcc = 1 - (Pcs + Pcr);

const double Prr = 70/100;
const double Prc = 30/100;

module WFM1

    // 0 = Sunny
    // 1 = Cloudy
    // 2 = Rainy

    x : [0..2] init 0;

    // Sunny
    [] x = 0 ->
          Pss:(x' = 0)
        + Psc:(x' = 1);

    // Cloudy
    [] x = 1 ->
          Pcs:(x' = 0)
        + Pcc:(x' = 1)
        + Pcr:(x' = 2);

    // Rainy
    [] x = 2 ->
          Prc:(x' = 1)
        + Prr:(x' = 2);

endmodule
