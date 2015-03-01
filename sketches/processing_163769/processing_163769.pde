
float[] y = new float[100];
float[] x = new float[100];
float v = random(20,30);
float a = 0;
float l = random(10,15);
int log = 0;

void setup()
{
 size(800,600);
 frameRate(60); 
 for(int i=0;i<100;i++)
 {
 x[i] = random(800);
 y[i] = random(-400,600);
 }
}

void draw()
{ 
  background(200,200,255,200);
  noStroke();
  fill(170);
  rect(0,590,800,20);
 for(int i=0;i<100;i++)
 {
  stroke(255,255,255,255);
  strokeWeight(2);
  line(x[i],y[i],x[i],y[i]+l);
  v=v+a;
  y[i]=y[i]+v;
 
  if(y[i]>580)
{
  stroke(255,255,255,400);
  ellipse(x[i],590,2,3);
  y[i]=0;
  v=random(20,30);

 }
}

log ++;
if(log%40==0)
{for(int i=0;i<50;i++)
 {
 x[i] = random(800);
}}
}
