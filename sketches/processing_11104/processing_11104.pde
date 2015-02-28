
//   
//  Creates a creature using noise
//
//  Click mouse to add tentacle
//  move mouse left to move faster
//  move up to grow larger
//

PGraphics bg;
void createWaterBgImage() 
{
  bg.beginDraw();
  bg.smooth();
  bg.background(10,20,50);
  
  // add plankton
  float t = 1.2;
   for (int i = 0; i<2048; i++)
  {
    float x = random(0,1.);
    float y = random(0,1.);
    float b = min(x-y,1);
    b = 100+155*b;
    bg.stroke( b,b,b,255);
    bg.point( x*width, y* height);
  }
  // add god rays
  bg.noStroke();
  bg.beginShape(QUADS);
  bg.fill(180,220,255,5);
  for (int i = 0; i<255; i++)
  {
    float ang = random(PI/2,PI*0.9);
    float l = random(width/2, width*1.5);
    float xs =cos(ang)*l; 
    float ys =sin(ang)*l; 
    float xo = width+60; 
    float yo = -40;
     bg.vertex(xo +xs,yo + ys);
     bg.vertex(xo +xs +ys*0.1 ,yo + ys +xs*0.1);
     bg.vertex(xo -xs ,yo -ys);
     bg.vertex(xo -xs -ys*0.1 ,yo -ys-xs*0.1);   
  }
   bg.endShape();
  bg.filter(BLUR,1);
  bg.endDraw();
} 
void setup()
{
  size(640,480);
  smooth();
  noStroke();
  noiseDetail(3,0.7);
  bg = createGraphics(width,height,P2D);
  createWaterBgImage();
}
void DrawCreature( float t, float r, float space, int numtents)
{
  int dv = (int)floor(sqrt(numtents));  // reduce amt depending on numtents
  int waterSnake = 512/dv;
  for (int i = waterSnake-1; i>=0; i--)
  {  
    float v = (float) i/(float)waterSnake;
    float b =1.-v;
    b*=b;
    b*=b;
    fill( 0+120*b,80 + 180*b,40 + 210*b,80);
    float radius = (sqrt((1.-v)) * 1 + b*b*2.)*r ;

    for (int j =0 ;j < numtents;j++)
    {
      float ang = (float)j/(float)numtents;  
      float xang = sin(ang)*v; // rotate from zero in noise space
      float yang = cos(ang)*v; // so all have same starting value

      float x = noise(xang- t*.5,yang-t*.5 )*2.-1.;
      float y = noise(xang- t + 127.45, yang -t + 127.45)*2.-1;
      ellipse( x*width/2*space + width/2, y * height/2*space + height/2, radius, radius);
    }
  }
}
float g_speedT = 0;
float g_PrevT = 0;
int numTenticales=1;

void mousePressed() {      
  numTenticales++;
}
void draw()
{
  float t = (float)millis()/1000.0f;
  float dt = t -g_PrevT;
  float spd =  0.05+ (float)mouseX/(float)width*0.5;
  g_speedT += dt * spd;
  g_PrevT = t;
  tint(sin(t)*25+225,sin(t)*25+225,sin(t)*25+225);
  image(bg,0,0);
  DrawCreature(g_speedT, 16 + (float)mouseY/(float)height * 16.,1.5,numTenticales);
}


