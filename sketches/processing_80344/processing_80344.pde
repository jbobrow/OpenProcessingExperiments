
Cuadrado b,c,d,e,f,g,h; //declarar objeto


void setup () {
  background (255);
size (1000,1000);
b = new Cuadrado (random (0, 500), random (0,500), 40,40, int (random (102,132)),int (random (133,163)),int (random (142,175)));
c= new Cuadrado (300,50,20,20,0,255,255);
d= new Cuadrado (20,400,30,30,255,255,0);
e= new Cuadrado (20,20,40,40,255,0,0);
f= new Cuadrado (600,600,20,20,255,0,0);
g= new Cuadrado (400,800,30,30,0,255,255);
h= new Cuadrado (800,200,30,30,255,255,0);

noStroke();
}

void draw (){
  
  b. update();
  b.display();
  
  c.update();
  c.display();
  
  d.update();
  d.display();
  
e.update();
e.display();

f.update();
f.display();

g.update();
g.display();

h.update();
h.display();

}

//clase

class Cuadrado {
  
  float xpos;
  float ypos;
  float ancho;
  float alto;
  int rojo;
 int verde;
int azul;
  
  Cuadrado (float x, float y, float w, float h, int ro, int ve, int az) { //constructor
 
xpos = x;
ypos = y;
ancho = w;
alto = h;
rojo = ro;
verde = ve;
az = az;

  }
  
  void update (){
    xpos = xpos + random (-20,20);
    ypos = ypos +random (-20,20);
    rojo = rojo + int (random (-5,5));
    verde = verde + int (random (-5,5));
    azul =azul + int (random (-5,5));
    
    if (xpos >= 1000) {
      xpos = random (1,999);
    }
    
    if (xpos <=0) {
      xpos = random (1,999);
    }
    
    
    if (ypos >= 1000) {
      ypos = random (1,999);
    }
    
    if (ypos <= 0) {
      ypos = random(1,999);
    }
    
    if (mousePressed) {
      rojo = 255;
      verde = 0;
      azul = 0;
    }
    
  }
  
  void display (){
    fill (rojo, verde, azul);
    rect (xpos, ypos, ancho, alto);
  }
}
