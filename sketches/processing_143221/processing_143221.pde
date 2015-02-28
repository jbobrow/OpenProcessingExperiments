
String lines[] = loadStrings("durhamdata.txt");
lines = subset(lines, 8);

float rain[] = new float[ lines.length ];

for( int i=0 ; i<lines.length ; i++)
{
  String data = trim(lines[i]);
  String field[] = splitTokens(data);
  float value[] = float(field);
  rain[i] = value[5];
}

int first = 26;
int points = 40;

float plots[] = subset(rain, first, points);
size(200,200);

for(int i=0 ; i<plots.length ; i++)
{
  float x = map(i, 0,plots.length, 10,width-10);
  float y = map(plots[i], min(plots),max(plots), height-10,10);
  line(x,y,x,height-10);
}


