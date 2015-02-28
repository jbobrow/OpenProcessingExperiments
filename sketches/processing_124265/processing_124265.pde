
Bola1[] b1=new Bola1[100];
BolaUsuario[] bu=new BolaUsuario[1];
float[] xB1=new float[100];
float[] yB1=new float[100];
float xBu=width/2;;
float yBu=height/2;
boolean fin = false;

void setup(){
  
  size (800,400);
  
    bu[0]=new BolaUsuario(random(width),random (height),15,color(255));
    
  for (int i=0;i<b1.length;i++){
    b1[i]=new Bola1(random(width),random(height));
  }
}

void draw(){
  
  if (fin==false){
    
  background(0);
  
  for (int i=0;i<bu.length;i++){
    bu[i].dibuja();
    bu[i].movimientoX();
    bu[i].movimientoY();
    xBu=bu[i].movimientoX();
    xBu=bu[i].movimientoY();
  }
  }else if (fin=true){  
    background(0);
    textSize(50);
    fill (255);
    text ("GAME OVER", 250,200);     
  }
  for (int i=0;i<b1.length;i++){
    b1[i].dibuja();
    b1[i].movimientoX();
    b1[i].movimientoY();
    xB1[i]=b1[i].movimientoX();
    yB1[i]=b1[i].movimientoY();
    
    if (dist(xB1[i],yB1[i],xBu,yBu)<15){
      fin=true;
  }
  }
}

public class Bola1 {
  float xPos;
  float yPos;

  Bola1(float x, float y) {
    xPos=x;
    yPos=y;
  }
  void dibuja() {
    fill(255, 127, 127);
    ellipse(xPos, yPos, 15, 15);  
  }
  float movimientoX(){
    xPos=xPos +random(-4,0);
    if (xPos<0) xPos=width;
    return xPos;
  }
  float movimientoY(){
    yPos=yPos +random(-4,4);
    if (yPos>height) yPos=0;
    return yPos;
  }  
}

public class BolaUsuario {
  
float xPos;
float yPos;
float radio;
color c;

  BolaUsuario(){
    xPos=width/2;
    yPos=height/2;
    radio=15;
    c=color(255);
  }
  
  BolaUsuario(float x, float y, float r, color col) {
    xPos=x;
    yPos=y;
    radio=r;
    c=col;
  }
  void dibuja() {
    fill(c);
    ellipse(xPos, yPos, radio, radio);
  }
  float movimientoX(){
    xPos=xPos+(mouseX-xPos)/radio;
    return xPos;
  }
  float movimientoY(){
    yPos=yPos+(mouseY-yPos)/radio;
    return yPos;
  }
}
