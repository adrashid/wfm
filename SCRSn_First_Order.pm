// First-Order DTMC Weather Forecasting Model
// States: Sunny (S), Cloudy (C), Rainy (R), Snowy (Sn)

dtmc

// Sunny transitions
const double Pss = 44/100;
const double Psc = 56/100;

// Cloudy transitions
const double Pcs = 73/100;
const double Pcr = 156/1000;
const double Pcc = 1 - (Pcs + Pcr);

// Rainy transitions
const double Prc  = 295/1000;
const double Prsn = 273/1000;
const double Prr  = 1 - (Prc + Prsn);

// Snowy transitions
const double Psnsn = 50/100;
const double Psnr  = 50/100;

module WFM2

    // 0 = Sunny
    // 1 = Cloudy
    // 2 = Rainy
    // 3 = Snowy

    x : [0..3] init 0;

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
        + Prr:(x' = 2)
        + Prsn:(x' = 3);

    // Snowy
    [] x = 3 ->
          Psnsn:(x' = 3)
        + Psnr:(x' = 2);

endmodule
