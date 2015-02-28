

size(200, 200);

String lines[] = loadStrings("durhamdata.txt");

lines = subset(lines, 7); //starts from line 7
lines = trim(lines);  //trims spaces out

float rain[] = new float[lines.length];     //Starts new arrays
float Tempmin[] = new float[lines.length];
float Tempmax[] = new float[lines.length];


for(int i=0 ; i<lines.length ; i++)      //Loops the length of the lines
{

String fields[] = splitTokens(lines[i]);
float values[] = float(fields);
rain[i] = values[5];
Tempmin[i] = values[3];
Tempmax[i] = values[2];

}

int data_start = 500;  //Where the data plotting starts 
int data_length = 25;  //How long the data is

//Rain
int l=10, r=190;      //Places of the Screen
int b=50, t=0;
//Temp Min
int lmin=10, rmin=190;
int bmin=100, tmin=50;
//Temp Max
int lmax=10, rmax=190;
int bmax=150, tmax=100;

//Plots the Rain in blue
float plotset[] = subset(rain, data_start, data_length);
for ( int i=0 ; i<plotset.length ; i++ )
{
  stroke(0, 0, 255);
float point_x = map(i,0,plotset.length,l,r);
float Pmax = max(plotset);
float Pmin = min(plotset);
float point_y = map(plotset[i],Pmin,Pmax,b,t);
line( point_x, point_y, point_x, b);
}

//Plots the Temp Min in Red
float plotsetTmin[] = subset(Tempmin, data_start, data_length);
for ( int i=0 ; i<plotsetTmin.length ; i++ )
{
    stroke(255, 0, 0);
float point_x = map(i,0,plotsetTmin.length,lmin,rmin);
float Pmax = max(plotsetTmin);
float Pmin = min(plotsetTmin);
float point_y = map(plotsetTmin[i],Pmin,Pmax,bmin,tmin);
line( point_x, point_y, point_x, bmin);
}

//Plots the Temp Max in Green
float plotsetTmax[] = subset(Tempmax, data_start, data_length);
for ( int i=0 ; i<plotsetTmax.length ; i++ )
{
    stroke(0, 255, 0);
float point_x = map(i,0,plotsetTmax.length,lmax,rmax);
float Pmax = max(plotsetTmax);
float Pmin = min(plotsetTmax);
float point_y = map(plotsetTmax[i],Pmin,Pmax,bmax,tmax);
line( point_x, point_y, point_x, bmax);
}



