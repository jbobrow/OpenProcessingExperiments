
String lines[] = loadStrings("durhamdata.txt");
lines = subset(lines, 12);
float <span class="w2m426f" id="w2m426f_7">rain</span>[] = new float[lines.length];
for( int i=0 ; i<lines.length ; i++)
 
{
  <span class="w2m426f" id="w2m426f_2">String data</span> = trim(lines[i]);
  String field[] = splitTokens(data);
  float value[] = float(field);
  rain[i] = value[5];
}
int first = 23;
int points = 60;
float plots[] = subset(rain, first, points);
size(500,400);
background(332, 24);
 
for(int i=0 ; i<plots.length ;i++)
 
{
  float x = map(i, 0,plots.length, 9,width-10);
  float y = map(plots[i], min(plots), max(plots), height-10,10);
  strokeWeight(5);
  stroke(250,130,99);
  line(x,y,x,height-10);
 }

