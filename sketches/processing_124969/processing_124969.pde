
PImage F1,F2,F3;
Boto b1, b2;
int pantalla=1;

void setup(){
  size(640,480);
  F1 = loadImage("P1.png");
  F2 = loadImage("P2.png");
  F3 = loadImage("P3.png");
  b1 = new Boto();
  b2 = new Boto(40, 48, color(255), 168,10,2,3);

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: canvipan();break;
    case 2: establecer();break;
    case 3: escritoritux();break;
  }
}
void mousePressed(){
  if(mouseButton==RIGHT){
  b1.apreta();
  }
  b2.apreta();
}
class Boto{
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti;
  
  Boto(){
    xPos = 2;
    yPos = 15;
    c = color(0);
    widthB = 50;
    heightB = 32;
    pantallaActual = 1;
    pantallaDesti = 2;

  }
   Boto(float x, float y, color col, float w, float h, int Segona, int Tercera){
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = Segona;
    pantallaDesti = Tercera;
  }
  
  void dibuixa(){
    noStroke();
    noFill();
    rect(xPos, yPos, widthB, heightB, 5);
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void canvipan(){
  image(F1, 0, 0);
  b1.dibuixa();
}
void establecer(){
  image(F2, 0, 0);
  b2.dibuixa();
}
void escritoritux(){
  image(F3, 0, 0);
}


