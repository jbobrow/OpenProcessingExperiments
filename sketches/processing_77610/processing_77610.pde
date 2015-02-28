
String lines[] = loadStrings("temps.txt");
println("there are " + lines.length + " lines");
for (int i=0; i < lines.length; i++) 
{
  int t = int(lines[i]);
  int cel = (t-32)*5/9; 
  println(lines[i] + " degrees fahrenheit is " + cel + " degrees celsius.");
}


