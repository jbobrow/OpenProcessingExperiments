
int int1 = 19315;
String nf1 = nf(int1,6);
float float1=19315.67;
String nf2= nf(float1,6,4);
String nfc1= nfc(int1);
Strong nfp1= nfp(float1,8,1);


println("Integer String; nf1 = "+nf1);
println("Floating-point String; nf2 = " +nf2);
println("Integer with commas added; nfc1 = "+nfc1);
println("Floating-point with sign added; nfp1 = "+nfp1);
