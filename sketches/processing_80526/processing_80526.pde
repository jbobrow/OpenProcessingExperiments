
Cuadrado b,c,d,e,f,g,h,i,j; //declarar objeto
 
 
void setup () {
  background (255);
size (1000,700);
b = new Cuadrado (200, 100, 15,15, 0,255,255);
c= new Cuadrado (300,50,15,15,0,255,255);
d= new Cuadrado (20,400,15,15,255,255,0);
e= new Cuadrado (20,20,15,15,255,0,0);
f= new Cuadrado (600,600,15,15,255,0,0);
g= new Cuadrado (400,800,15,15,0,255,255);
h= new Cuadrado (800,200,15,15,255,255,0);
i= new Cuadrado (800,600,15,15,0,255,0); 
j= new Cuadrado (300,600,15,15,255,0,0);
 
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
 
 j.update();
 j.display();
 
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
     
     
    if (ypos >= 700) {
      ypos = random (1,999);
    }
     
    if (ypos <= 0) {
      ypos = random(1,999);
    }
     
     //teclas y colores, los colores estan en ingles porque en spanish se repiten mucho las iniciales
     
     //cian
if(keyPressed) {
  if(key == 'c' || key == 'C' ){
    rojo=0;
verde=255;
azul=255;
  }
}

//amarillo (yellow)
if(keyPressed) {
  if(key == 'y' || key == 'Y' ){
    rojo=255;
verde=255;
azul=0;
  }
}

//azul (blue)
if(keyPressed) {
  if(key == 'b' || key == 'B' ){
    rojo=0;
verde=0;
azul=255;
  }
}
     
     //blanco (white)
if(keyPressed) {
  if(key == 'w' || key == 'W' ){
    rojo=255;
verde=255;
azul=255;
  }
}

     //magenta
if(keyPressed) {
  if(key == 'm' || key == 'M' ){
    rojo=255;
verde=0;
azul=255;
  }
}
     
          //naranjo (orange)
if(keyPressed) {
  if(key == 'o' || key == 'O' ){
    rojo=232;
verde=97;
azul=0;
  }
}
     
               //negro 
if(keyPressed) {
  if(key == 'k' || key == 'K' ){
    rojo=0;
verde=0;
azul=0;
  }
}
     
     //rojo
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
