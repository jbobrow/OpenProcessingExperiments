
Cuadrado b,c,d,e,f, g,h,i; //declarar objeto


void setup () {
  background (255);
size (792,612);
b = new Cuadrado (100, 100,20 ,20, 255,0,0);
c= new Cuadrado (250, 450,20 ,20, 255,0,0);
d= new Cuadrado (300, 300,20 ,20, 255,0,0);
e = new Cuadrado (500,250,20, 20, 255,0,0);
f = new Cuadrado (500,600, 15,15, 255,0,0);
g = new Cuadrado (200,600,15,15,255,0,0);
h= new Cuadrado (200,100,20,20,255,0,0);
i= new Cuadrado (300,100,20,20,255,0,0);


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
  
   i.update();
  i.display();
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
    xpos = xpos + random (-40,40);
    ypos = ypos +random (-40,40);
    
    
    verde = verde + 1;
    if (verde > 250) {
     rojo= 0;
      azul = 255;
      
    }
    
    
  }
  
  void display (){
    fill (rojo, verde, azul, 125);
    rect (xpos, ypos, ancho, alto);
  }
}
