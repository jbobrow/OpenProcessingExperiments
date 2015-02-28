
float a;
float b;
int count;
int space;
int halfW;
int halfH;



import peasy.*;
PeasyCam cam;

import controlP5.*;
ControlP5 controlP5;

import processing.opengl.*;
PMatrix3D currCameraMatrix;
PGraphics3D g3;

int theCount=75;
int Space=7;
int Weight=1;



void setup()
{
  size(500,500,OPENGL);
  
  g3=(PGraphics3D)g;
  
  colorMode(HSB,100,100,15);


  a=0.0;
  b=PI/25;
  halfW=width/2;
  halfH=height/2;
  count=50;
  space=20;

  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(500);

  controlP5 = new ControlP5(this);
  controlP5.addSlider("Weight",0,10,Weight,10,10,10,100);
  controlP5.addSlider("Space",5,15,Space,50,10,10,100);
  controlP5.setAutoDraw(false);
}



void draw()
{

 if (keyPressed == true)
  {
    rotateY(radians(a*5)); //adds spin 
  }
  
  a-=b;
  background(0,100,0);


  pushMatrix();

  float magnitude=(float)mouseX*.25;
  for (int z=0;z< theCount;z++)
  {
    for (int x=0;x< theCount;x++)
    {
      float dotX= x*Space;
      float dotZ= z*Space;

      float dotDistance= sqrt(sq(x)+sq(z));//distance formula (dots distance from center)

      float dotY= cos(a+dotDistance)*magnitude/Space;//creates the wave or ripple

      float H=dotDistance*2; 
      float S= 100;
      float B= (dotY+15)/(dotDistance*0.15);
      
      


      stroke(H,S,B);
      strokeWeight(Weight);

      point(dotX, -dotY, dotZ);
      point(-dotX, -dotY, dotZ);
      point(dotX, -dotY, -dotZ);
      point(-dotX, -dotY, -dotZ);
    }
  }

 

  popMatrix();

  gui();
}

void gui()
{
  currCameraMatrix= new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera=currCameraMatrix;
}



  
  






