
// P04_Var1_IntroToVariables
// Barton Poulson uvu.edu/profpages/bart
// 15 January 2013

size(800, 400);

int int_var = 10;
println("int_var = " + int_var);

float float_var = 2.71828;
println("float_var = " + float_var);

boolean boolean_var = true;
println("boolean_var = " + boolean_var);

char char_var = 'c';
println("char_var = " + char_var);

byte byte_var = 8;
println("byte_var = " + byte_var);

color color_var = #355E3B;
println("color_var = #" + hex(color_var, 6));
println();
println("Note: To print hex colors, you need to take the name of \nthe color variable and put it in this: hex(var_name, 6).\nThe hex part tells Processing it's a hex code and the 6 \nat the end truncates it to a standard 6 character hex code.\n(Otherwise it puts 8 characters to include the alpha value)");
