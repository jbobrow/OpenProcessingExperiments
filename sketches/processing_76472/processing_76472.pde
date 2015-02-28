
//Gregory Taxerman, Temperature Conversion, CP1 16-17

String lines[] = loadStrings("temps.txt");
for (int i =0 ; i < lines.length; i++)
{ 
  int fahrenheit = int(lines[i]);
  fahrenheit = fahrenheit - 32;
  fahrenheit = (fahrenheit*5)/9; 
  println(lines[i] + " degrees fahrenheit is " + fahrenheit + " degrees celsius");
}

