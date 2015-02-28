
//Stephanie Wong mods: 14-15 converting temperatures
String lines[]=loadStrings("converting.txt");
println("there are "+ lines.length + " lines");
for(int f=0; f<lines.length; f++){
  print(lines[f]);
  print(" degrees fahrenheiht is ");
  int c=int(lines[f]);
  print(5*(c-32)/9);
  println(" degrees celcius");
}
