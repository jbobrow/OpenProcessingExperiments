
//Laura R., temperature Conversion, CP1, 14-15
String lines[] = loadStrings ("temps.txt");
for(int i = 0; i < lines.length; i++)
{
  println(lines[i] + " degrees Farhenheit is " + ((5*(int(lines[i]) - 32)/9) + " degrees Celsius"));
}



