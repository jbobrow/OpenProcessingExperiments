
// Will Slotterback CP1 16/17 Temperature Conversion
int far = 0;
int cel = 0;
String lines[] = loadStrings("temps.txt");
for (int i=0; i<lines.length; i++)
{
  far=int(lines[i]);
  cel = far;
  cel = 5*(cel-32)/9;
  println(far+ " degrees fahrenheit is " + cel + " degrees celsius.");
}
