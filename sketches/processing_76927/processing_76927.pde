
// Victor Murillo, CP1, mods 16-17, Temperature Conversion
String lines[] = loadStrings("temps.txt");
for (int i =0 ; i < lines.length; i++) 
{
  int f = int(lines[i]);
  int cel = (f-32)*5/9; 
  println(lines[i] + " degrees fahrenheit is " + cel + " degrees celsius.");
}
