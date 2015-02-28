
size(500,500);
String lines[] = loadStrings("durhamdata.txt"); //loads the data into an array
lines = subset(lines, 7); //will get rid of the header (everything from line 7 upwards
lines = trim(lines); //trims the line spacing
float rain[] = new float[lines.length]; //allocates memory to store the array in
float Tmin[] = new float[lines.length];
float Tmax[] = new float[lines.length];

for(int i=0 ; i<lines.length ; i++)
{
  //body of loop
  String fields[] = splitTokens(lines[i]);//splits the lines into fields

  float values[] =float(fields);//converts the string  into numbers

  rain[i] = values[5]; //store the value from column 5 into an array
  Tmin[i] = values[3];
  Tmax[i] = values[2];
  
 
}
int data_start = 500; //extracts a portion of the data so we can plot a graph
int data_length = 60;//
int l=10, r=90; // ints to help positioning
int b=90, t=10;
float plotset[] = subset(rain, data_start, data_length);//""
  
  for ( int i=0 ; i<plotset.length ; i++ )//iterates over the list
  {
    
    float point_x = map(i,0,plotset.length,l,r);//scaling the data
    float Pmax = max(plotset);
    float Pmin = min(plotset);
    float point_y = map(plotset[i],Pmin,Pmax,b,t);
    line( point_x, point_y, point_x, b); //plots the data
  }







