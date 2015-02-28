
String lines[] = loadStrings("temps.txt");
println("there are " + lines.length + " lines");
for(int j=0; j<lines.length; j++)
{
  int F = int(lines[j]);
  F = F - 32;
  F = F*5/9;
  println(lines[j] + " in Fahrenheit is " + F + " in Celcsius");  
}
