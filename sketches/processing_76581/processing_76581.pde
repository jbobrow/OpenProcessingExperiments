
//Michelle Z, CP1 4-5, Temperature Conversion

int y = 0;
int c;
size(500, 300);

background(255);
fill(0);
String lines[] = loadStrings("temps.txt");
for (int i = 0 ; i < lines.length; i++)
{
  c = (int(lines[i])-32)*5/9;
  textSize(15);
  textAlign(CENTER);
  text(lines[i]+ " degrees fahrenheit is " +c+ " degrees celsius", 250, 100+y);
  y = y + 50;
}


