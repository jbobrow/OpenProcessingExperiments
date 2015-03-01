
int o=0;
int s=20;
int a=100;
int b=200;
int c=300;
int d=400;
int e=500;
int f=600;

void setup()
{
frameRate(10);
size(450,450);
background(255);
smooth();
noStroke();
}

void draw()
{
  background(255); 
  fill(0,255,255);
  o +=1;   
  for(int i=0;i<=o;++i)
  {
   ellipse(width/2+a/2*cos(i*2*PI/o)+random(-15,15),height/2+a/2*sin(i*2*PI/o)+random(-10,10),s,s);
   ellipse(width/2+b/2*cos(i*2*PI/o)+random(-15,15),height/2+b/2*sin(i*2*PI/o)+random(-10,10),s,s);
   ellipse(width/2+c/2*cos(i*2*PI/o)+random(-15,15),height/2+c/2*sin(i*2*PI/o)+random(-10,10),s,s);
   ellipse(width/2+d/2*cos(i*2*PI/o)+random(-15,15),height/2+d/2*sin(i*2*PI/o)+random(-10,10),s,s);
   ellipse(width/2+e/2*cos(i*2*PI/o)+random(-15,15),height/2+e/2*sin(i*2*PI/o)+random(-10,10),s,s);
   ellipse(width/2+f/2*cos(i*2*PI/o)+random(-15,15),height/2+f/2*sin(i*2*PI/o)+random(-10,10),s,s);
  }
}
