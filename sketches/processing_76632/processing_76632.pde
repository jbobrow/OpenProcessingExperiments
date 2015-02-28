
String lines[]=loadStrings("temps.txt");
//println("there are " + lines.length + " lines");
for (int i=0; i<lines.length;i++)
{
  //println(lines[i]);
  println("lines[i]"+" degrees fahrenheit is "+"(lines[i]-32)+(5/9)"+" degrees celsius.");
}
