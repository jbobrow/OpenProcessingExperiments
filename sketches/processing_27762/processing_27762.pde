



class Line
{
 int numpoints = 160;
float[] xs = new float[numpoints];
float[] ys = new float[numpoints];
float[] vx = new float[numpoints];
float[] vy = new float[numpoints];
float[] x = new float[101];
float[] y = new float[101];




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
      vx[i] = 3;
      vy[i] = 3;
  
     }
  }
  
  void update()
{
for(int i = 0; i < xs.length;i++)
{
  vx[i] += (noise(xs[i]*.01,ys[i]*.01,frameCount*.02)-.5)*.9;
   vy[i] += (noise(-ys[i]*.01,xs[i]*.01,frameCount*.02)-.5)*.9;
   vx[i]*=drag;
   vy[i]*=drag;
  if( dist(xs[i],ys[i],cx,cy) < thresh)
{
vx[i]*=1;
vy[i]*=-1;
}
  xs[i]+=vx[i];
  ys[i]+=vy[i];
  noiseDetail(44);
}
}
 
 
    void display()
    {
fill(R1,G1,B1,30);
      strokeWeight(.8);
      stroke(R1, G1, B1,30);
      beginShape();
      for(int i =0; i < numpoints;i++)
      {
        vertex(xs[i],ys[i]);
      }
      endShape();
 colorMode(RGB);
 
  fill(255,50);
  noStroke();
  smooth();
 
 
     }
}
 
Line l;

 float x;
 float y;
 float vx;
 float vy;
 int alpha;
 
  void setup()
{

  size (800,350, P3D);
  smooth();
  colorMode(RGB);

  background(255);

 
  strokeWeight(50);
  alpha=500;
    l = new Line();


}

float R1 = random(0, 255);
float R2 = random(0, 255);
float G1 = random(0, 255);
float G2 = random(0, 255);
float B1 = random(0, 255);
float B2 = random(0, 255);


void draw()
{  
 
 fill(255,20);
 rect (0,0,width,height);

 
  l.update();
  l.display();
  

}

void mouseMoved(){
  smooth();
  R1 = random(0, 255);
  R2 = random(0, 255);
  G1 = random(0, 255);
  G2 = random(0, 255);
  B1 = random(0, 255);
  B2 = random(0, 255);} 
 

 
  void mouseReleased()
{
  setup();
}

