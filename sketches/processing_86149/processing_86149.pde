
// P04_Var7_ModifyingStrings
// Barton Poulson uvu.edu/profpages/bart
// 18 January 2013

size(600, 200);

int int1 = 19315;
float float1 = 19315.67;

String nf1 = nf(int1, 6);
println("The String nf1 has this value: " + nf1);

String nf2 = nf(float1, 6, 4);
println("The String nf2 has this value: " + nf2);

String nfc1 = nfc(int1);
println("The String nfc1 has this value: " + nfc1);

String nfp1 = nfp(float1, 8, 1);
println("The String nfp1 has this value: " + nfp1);
