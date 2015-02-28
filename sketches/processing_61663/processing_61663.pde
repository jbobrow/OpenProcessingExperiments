
//Joshua Chang jmc1
//Project 2-PLAYING WITH MORE SOUND
//The spheres make bump sounds when hitting the walls, and noise picked up 
//from external microphone will make them change diameter. 
//Make some loud sounds!

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
AudioSample bump;


float px, py, pz;

final int MAX = 3;

   
float [] x;
float [] y;
float [] z;
float [] wd;
float [] sx;
float [] sy;
float [] sz;
color [] colors;
 
//color col = color(random(245), random(255), random(253));
   
void setup()
{
   size (800, 400,P3D);
  
         
   x = new float [MAX];
   initArray(x, 50, width);  
   y = new float [MAX];
   initArray(y, 50, height);
   z = new float [MAX];
   initArray(z, -300, -350);
     
   wd = new float [MAX];
   initArray(wd, 50, width*.25);  
     
   sx = new float [MAX];
   initArray(sx, 1, 10);  
   sy = new float [MAX];
   initArray(sy, 1, 10); 
   sz = new float [MAX];
   initArray(sz, 1, 10); 
     
   colors = new color [MAX];
initColorArray(colors);
    
   translate(width*.5, height*.5, 0);
    minim = new Minim(this);
  minim.debugOn();
   in = minim.getLineIn(Minim.STEREO, 512);
   bump= minim.loadSample("bump.wav");
}
   
void draw()
{
  background(255);
 moveCamera();
  
  for (int i = 0; i < MAX; i++)
  {
    shapes(x[i], y[i], z[i], wd[i], colors[i]);
  }
  shapemove();
    boxy();
    //saveFrame("proj1.jpg");

}
void initColorArray(color [] c)
{
  for (int i=0; i < c.length; i++)
  {
    c[i] = color(random(10, 255), random(10, 255), random(10,255),90);
  }
}

void boxy()
   {
   fill(90,230,200,20);
      translate(width/2, height/2,0); 
 
    box(width/2,height/2,400); 
   }
   
void initArray(float [ ] dud, float low, float high)
{
  for (int i=0; i < dud.length; i++)
  {
    dud[i] = int(random(low,high));
  }
}


void keyPressed() {
 
  if (keyCode == UP) {
    py = py + 7.5;
  }
  if (keyCode == DOWN) {
    py = py - 7.5;
   
  }
  if (keyCode == RIGHT) {
   
    px = px + 7.5;
  }
  if (keyCode == LEFT) {

    px = px - 7.5;
  }
  if (key == 'x'||key == 'X') {
    pz = pz + 5;
  }
  if (key == 'z'||key == 'Z') {
    pz = pz - 5;
  }
 
  if (key == ' ') {
    pz=0;
    px = 0;
    py = 0; 
  }
}
 


void moveCamera() {
camera(width/2.0+px, height/2.0+py, (height/2.0) / tan(PI*60.0 / 360.0)+pz, 
width/2.0+px, height/2.0+py, 0+pz, 0, 1, 0);
  
}


  
void shapes(float x, float y, float z, float dia,color c)
{
  pushMatrix();
  pushMatrix();
  pushMatrix();
  
  for (int i=0; i < MAX; i++){
  fill(c);
  translate(x, y, z);
  rotateX(10);
  rotateY(10);
  rotateZ(10);
  sphere(dia+in.right.get(i)*100);
  popMatrix();
  }
}
  
void shapemove()
{
  for (int i=0; i < MAX; i++)
  {
    x[i] = x[i] + sx[i];
    y[i] = y[i] + sy[i];
    z[i] = z[i] + sz[i];


    if(x[i] < 0 || x[i] > width)
    {
      sx[i] = -sx[i];
     bump.trigger();
   
    }
    else if(y[i] < 0 || y[i]> height)
    {
      sy[i] = -sy[i];
      bump.trigger();
    
    }
    else if(z[i] > -100 || z[i] < -800)
    {
      sz[i] = -sz[i];
      bump.trigger();
      
    }
  
  }}


