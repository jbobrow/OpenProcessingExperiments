
import processing.opengl.*;
linea L;
ejes E;
cono C;
cola cl;
PVector med;
float ang, Inc;

float rotx, roty, anX, anY;
//PImage imagenfondo;


void setup()
{
  size (700, 500, OPENGL);
  //imagenfondo = loadImage("1.jpg");
  background(0);
  smooth();

  L = new linea(180, 0, 0);
  E = new ejes();
  C = new cono();
  cl = new cola(200);
  med = new PVector();
  translate(350, 250, 0);
  rotx = 0;
  roty = 0;
  ang=0;
  Inc=0.22*180/PI;
}

void draw()
{ 
  //background(imagenfondo);
  println (med);
  background (0);
  anX=map(mouseX, 0, width, -PI, PI);
  anY=map(mouseY, 0, height, -PI, PI);  
  translate (350, 250, 0);

  pushMatrix(); 
  rotateX(rotx);
  rotateY(roty);

  strokeWeight(1);
  stroke (234, 232, 232);

  line(0, 150, 0, 200, 150, 0);

  //Definimos el vector leido a dibujar
  //  med.x = 150+60*sin(ang);
  //  med.y = 150+60*cos(ang);
  //  med.z = 150-60*sin(ang);
  med.x = 180*cos(anY)*cos(anX);
  med.y = 180*sin(anY)*cos(anX);
  med.z = -180*sin(anX);

  cl.insertar(med);
  stroke(255, 255, 0);
  cl.dibujar();

  E.dibuja(); 
  popMatrix();

  pushMatrix();
  smooth();    
  rotateY(anX);
  rotateZ(anY);
  L.dibuja();
  popMatrix();

  ang=ang+Inc;
}

void mouseDragged() 
{

  float rate = 0.001;
  smooth();
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
  //  rotx = map(mouseX, 0, width, -PI, PI);
  //  roty = map(mouseY, 0, width, -PI, PI);
}


