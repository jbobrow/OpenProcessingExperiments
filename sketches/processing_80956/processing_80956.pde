
import processing.opengl.*;

Esferas [] esferas;
Triangulo [] triangulo;
Ball b;
Ball2 c;


float theta = 0;

void setup() {
  size (1000,600,P3D);
  background (0);
  smooth();
  frameRate(30);
  
  
  b=new Ball (1,0,40);
  ellipseMode (RADIUS);
  
  c = new Ball2(10,160);
  ellipseMode(RADIUS);
   if (mousePressed) {
    c.speed += 0.1;
  }
  
  esferas = new Esferas [15];
  for (int i=0; i<esferas.length; i++)
  {
    esferas[i]=new Esferas ();
  }
   triangulo = new Triangulo [5];
  for (int i=0; i<triangulo.length; i++)
  {
    triangulo[i]=new Triangulo ();
  }
  
}
  
void draw () {
  background(0);
  
  c.dibujar(); // b el objeto q vamos a usar y que comportamiento? update.
  c.flotar(); //b es el objeto y el comportamiento es display
  
  b.dibujar();
  b.flotar();

  for (int i=0; i<esferas.length; i++)
  {
    esferas[i].dibujar();
    esferas[i].flotar();
  }
  
   for (int i=0; i<triangulo.length; i++)
  {
    triangulo[i].dibujar();
    triangulo[i].flotar();
  }
  
    stroke (255); 
    translate(width/2,height/2);
    for (float i=0;  i < TWO_PI; i+=0.2) {
    pushMatrix();
    rotateX(theta+i);
    for(float j = 0; j < PI; j+=0.5){
    rotateY(-theta-j);
    rotateZ(-theta-j);
    stroke(0,250,250,80);
    noFill();
    ellipse(0,0,250,250);
  }
   popMatrix();
   endShape();
  }
  theta+= 0.01;
}


class Ball2 {   
  
  float xpos; 
  float ypos; 
  float radius = 80; 
  float direction = 1; 
  float speed; 

 
  Ball2 (float s, float x) {
    speed = s;
    xpos = x;
  }
  
  void flotar() {
    xpos += speed*direction; 
    if ((xpos>width-radius) || (xpos < radius)) { 
      direction*=-1;
    }
  }
    void dibujar() {
      fill(255,30,30,50);
      ellipse(xpos, 80, radius, radius);
    }
  }

class Ball {
  
  float xpos;      
  float ypos;
  float radius;
  float speed;
  float direction = 1;
  
  Ball (float s, float x, float r) {
    speed = s;
    xpos = x;
    radius = r;
  }
  
  void dibujar () {
    smooth();
    fill (255, 125,90,40);
    triangle(xpos, ypos, height/2,width/2,height,width);
  }
  
 void flotar () {
   
   xpos +=speed*direction;
   if ((xpos > width - radius) || (xpos < radius)) {
     direction *= 1;
   }

}

}


class Esferas{
  
  float x;
  float y ;
  float vel;
  float diametro;
  float acel;
  float alfa;
  
Esferas () {
    y=height+random (800);
    x=random (width);
    vel=-0.5;
    diametro=random(15,80);
    acel=-0.02;
    alfa =random(50,200);
  }
  
  void dibujar () {
    
    noStroke();
    fill (175,244,228,alfa);
    stroke (93,242,80,200);
    ellipse (x,y,diametro,diametro);
  }
  
 void flotar () {
   
   y=y+vel; 
    if (random(1)<0.6)
    {
      vel=vel+acel;
    }
        if (y<=0)
    {
      y=height;
      vel=-0.5;
 }
 
 }
 
}

class Triangulo{
 
float angle = 0.5;
float offset = 30;
float scalar =40;
float incremento = 1;
int p = 0;
  
Triangulo () {

    
  }
  
  void dibujar () {
    
  stroke(255,0,0);
  //fill (255);
  float x = offset + cos(angle) *scalar;
  float y = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle) *scalar;
  float y3 = offset + sin(angle) *scalar;
  
  stroke(100,50,50);
 
  p=p+1;
  

 ellipse (x+300, y2+500, 20,20);
 ellipse (-x+95, -y2+533, 20,20);
 ellipse (x+160, y2+348, 20,20);
 ellipse (-x+600, y2+400, 20,20);
 ellipse (x+640, y2+367, 20,20);
 ellipse (-x+570, y2+600, 20,20);
 ellipse (x+700, y2+523, 20,20);
 ellipse (-x+854, y2+413, 20,20);
 ellipse (x+857, y2+550, 20,20);
 ellipse (-x+924, y2+365, 20,20);
 ellipse (x+351, y2+352, 20,20);
 ellipse (-x+89, y2+640, 20,20);
 
 scalar+=0.05;
 
 angle += incremento;
    
  }
  
 void flotar () {
   
    scalar+=0.05;
    angle += incremento;
 
 }
 
}
