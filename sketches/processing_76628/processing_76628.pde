
String lines []=loadStrings("temperature.txt");

for (int i = 0; i<lines.length; i++)
{
  int farenheit = int(lines[i]);
  float celsius = (farenheit-32)*5/9;
  print(lines[i]);
  println(" degrees farenheit is " + celsius + " degrees celsius");
}
