
String lines[] = loadStrings("temps.txt");
println("there are "+lines.length+" lines");
for (int i=0; i<lines.length; i++) 
{
  int f = int(lines[i]);
  println(lines[i]+" degrees fahrenheit is "+ ((f-32)*5)/9 +" degrees celcius");
}
