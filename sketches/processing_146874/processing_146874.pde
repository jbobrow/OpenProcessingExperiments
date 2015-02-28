
String lines[ ] = loadStrings("http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/durhamdata.txt");
lines = subset(lines,8);

float rain[ ] = new float[ lines.length ];

for( int i=0 ; i<lines.length ; i++)
{
  String data = trim(lines[i]);
  String field[ ] = splitTokens(data);
  float value[ ] = float(field);
  rain[i] = value[5];
}

int first = 26;
int points = 40;

float plots[] = subset(rain, first, points);
size(900,700);

for(int i=0 ; i<plots.length ;i++)
{
  float x = map(i, 0,plots.length, 15,width-15);
  float y = map(plots[i], min(plots),max(plots), height-15,15);
 line(x,y,x, height-15); 
}



