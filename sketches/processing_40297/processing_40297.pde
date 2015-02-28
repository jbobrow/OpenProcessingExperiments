

int xMin=-10, yMin=-10, xMax=10, yMax=10;
float x=5,y=5,outx,outy;
int i=0,j=0;

void setup(){
size(400,400);
strokeWeight(5);
}
float xpointToScreen(float inx){
return (inx-xMin)*width/(xMax-xMin);
}
float ypointToScreen(float iny){
return (iny-yMax)*height/(yMin-yMax);
}
void grafica(){
line(0, 200, 400, 200);
line(200, 0, 200, 400);
while(i<=400){
line(i, 195, i, 205);
i=i+20;
}
while(j<=400){
line(195, j, 205, j);
j=j+20;
}
}
void draw(){
outx=xpointToScreen(x);
outy=ypointToScreen(y);
strokeWeight(2);
grafica();
strokeWeight(5);
point(outx,outy);

float[]p0=new float[2];
float[]p1=new float[2];
float[]p=new float[2];
float A0;
int Npts;
p0[0]=5; p0[1]=3;
p1[0]=-1; p1[1]=-7;
Npts=10; 
xx=xpointToScreen(x);
yy=ypointToScreen(y);
point (xx, yy);

for (int i=1;1<=Npts;i++){
A0=i/(Npts+1.0);
p[0]=A0*p0[0]+(1-A0)*p1[0]; 
p[1]=A0*p0[1]+(1-A0)*p1[1];

point (p[0],p[1]);
float xpointToScreen (float x){ //aqui es donde me marca el error
return(x-xMin)*5/(xMax-xMin);
}
float ypointToScreen (float y){
return(y-yMax)*5/(yMin-yMax);
}
void pointToScreen (float[]int)
int[0]=xpointToScreen(int[0]);
int[0]=xpointToScreen(int[1]);
}
}
}          
                
