
import processing.opengl.*;

color start=color(0,0,0);
color finish;
float amt=0.0;
class Line
{
 int numpoints = 4160;
float[] xs = new float[numpoints];
float[] ys = new float[numpoints];
float[] vx = new float[numpoints];
float[] vy = new float[numpoints];
float[] x = new float[101];
float[] y = new float[101];

float R1 = random(0, 255);
float R2 = random(0, 255);
float G1 = random(0, 255);
float G2 = random(0, 255);
float B1 = random(0, 255);
float B2 = random(0, 255);
 float thresh;
 float cx = width/2;
 float cy = height/2;
  float drag;
  boolean dead= true;

   Line()
  {
  drag = .99;

   thresh = 199;
    for(int i = 0; i < xs.length;i++)
    {
     xs[i] = (radians(i))*cx;
     ys[i] = (radians(i))*cy;
      vx[i] = 0;
      vy[i] = 0;

     }
  }
   
  void update()
{
for(int i = 0; i < xs.length;i++)
{
  vx[i] *= (noise(xs[i]*.01,ys[i]*.01,frameCount*.02)-.5)*.1;
   vy[i] *= (noise(-ys[i]*.01,xs[i]*.01,frameCount*.02)-.5)*.1;
   vx[i]+=drag;
   vy[i]+=drag;
      noiseDetail(5);
  if( dist(xs[i],ys[i],cx,cy) > thresh)
{
vx[i]*=1;
vy[i]*=-1;
}
  xs[i]+=vx[i];
  ys[i]+=vy[i];
}
}


    void display()
    {
noFill();
      strokeWeight(5.1);
      stroke(start);
      finish = color(random(200),random(200),random(200));
      beginShape();
      for(int i =0; i < numpoints;i++)
      {
        vertex(xs[i],ys[i]);
      }
      endShape();
 colorMode(RGB);
  
      }
}
 
Line l;

void setup()
{
     background(255);
 
  size (800,350,OPENGL);
  smooth();
    
      l = new Line();
    

}
void draw()
{     amt+=.01;
 if (amt <= 1) {
   amt = 0.0;
   start = finish;
   finish = color(random(255),random(255),random(255));
 }
 strokeWeight(lerpColor(start,finish,amt));
  
  
  l.update();
  l.display();


}



  


//reset
void mouseReleased()
{
  setup();
}
