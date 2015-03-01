

PImage Fondo;
float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
int mida;
int midaY;

color c1 = color(2,183,151);
color c2 = color(0,247,204);
color c3 = color(115,175,180);
color c4 = color(115,175,180);

void setup() {
size (600,400);
Fondo = loadImage ("fondo_espacio.jpg");
   posicioX = width/2;
  posicioY = height/2;
  velocitatX = random(2);
  velocitatY = random(2);
  mida = 120;
  midaY = 40;
  }
  
    
  void draw() {
 image (Fondo, 0, 0, width, height);
  
     posicioX = posicioX + velocitatX;
posicioY = posicioY + velocitatY;

  if (posicioX-mida/2 < 0 || posicioX+mida/2 > width) {
    velocitatX = -velocitatX; 
  }
  
  if (posicioY-midaY/2 < 0 || posicioY+midaY/2 > height) {
    velocitatY = -velocitatY;
  }
  

  
    fill (c1);
  ellipse(posicioX, posicioY+10, mida, midaY);
  fill (c2);
    ellipse(posicioX, posicioY, mida, midaY);
    
    fill (c3);
    bezier (posicioX-40, posicioY, posicioX-25, posicioY-45, posicioX+25, posicioY-45, posicioX+40, posicioY);
    bezier (posicioX-40, posicioY-1, posicioX-20, posicioY+10, posicioX+20, posicioY+10, posicioX+40, posicioY-1);
   // line (posicioX-40, posicioY, posicioX+40, posicioY);
    
    fill (c4);
    ellipse (posicioX-40, posicioY+20, 5,5);
    ellipse (posicioX-30, posicioY+23, 5,5);
    ellipse (posicioX-20, posicioY+24, 5,5);
    ellipse (posicioX-10, posicioY+25, 5,5);
    ellipse (posicioX, posicioY+25, 5,5);
    
    ellipse (posicioX+40, posicioY+20, 5,5);
    ellipse (posicioX+30, posicioY+23, 5,5);
    ellipse (posicioX+20, posicioY+24, 5,5);
    ellipse (posicioX+10, posicioY+25, 5,5);
  
   
   }
   
   void mousePressed() {
    velocitatX = random (-8,8);
    velocitatY = random (-8,8);
    posicioX = pmouseX;
    posicioY = pmouseY;
  c1 = color(0, random(100,180), random(100,255));
  c2 = color(0, random(100), random(100));
  c3 = color(0, random(150,255), random(150,255));
  
  c4 = color(250,255,(3));

   

  }


