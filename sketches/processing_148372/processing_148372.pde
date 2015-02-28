
void setup() {
  size(600, 1000);
}

void draw(){
String lines[] = loadStrings("data.txt");
lines = subset(lines,7);
lines = trim(lines);
float rain[] = new float[lines.length];

for(int i=0 ; i<lines.length ; i++)
{
String fields[] = splitTokens(lines[i]);
float values[] = float(fields);
rain[i] = values[5];

  }
  
int data_start = 0;
int data_length = 1600;
float plotset[] = subset(rain, data_start, data_length);

for ( int i=0 ; i<plotset.length; i++ )
{
  float point_x = map(i,0,plotset.length,0,600);
  float Pmax = max(plotset);
  float Pmin = min(plotset);
  float point_y = map(plotset[i],Pmin,Pmax,200,50);
  line( point_x, point_y, point_x, 200);
}

}



