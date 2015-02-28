
String[] temps = loadStrings("temps.txt");
for (int i =0; i < temps.length; i++) {
  println (temps[i] + " degrees fahrenheit is " + (int(((int(temps[i]))-32)*(5.0/9.0))) + " degrees celsius" );
}
