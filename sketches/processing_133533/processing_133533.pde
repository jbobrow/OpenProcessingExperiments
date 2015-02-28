
int i=0;
void setup (){
  size (400,400);
  background (0);
  smooth ();
}
void draw (){
  float x = random (300);
  float y = random (300);
  float z = random (255);
  frameRate (10);
  stroke (x*5,215,y+60);
  for (int i=0; i<200; i=i+1);
{
 line (40,40,x,y);
}
  float a = random (200,500);
  float d = random (200,500);
  float c = random (255);
  stroke (c*5,100,c+60);
  for (int i=0; i>200; i=i+1);
{
 line (i+380,i+380,a,d);
}
float r = random (10,100);
float g = random (40,150);
float b = random (100,200);
int speed = 2;
int red = 1;
int green = 1; 
fill (r,g,b);
noStroke ();
smooth();
r= r+red;
g=g+green;
b=b+speed;
triangle (40,350,100,230,160,350);
triangle (360,50,300,180,240,50);
}
