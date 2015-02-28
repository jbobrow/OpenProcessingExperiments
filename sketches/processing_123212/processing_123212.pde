
PImage fons1;
Peces[] pez = new Peces[10];
Burbujas[] burbus = new Burbujas[50];


void setup(){
  size (600, 450);
  fons1= loadImage("plants.jpeg");
  //Peces
  for (int i = 0; i < pez.length;i++){
    pez[i] = new Peces(0, random(height), random (0.2,1.5), color (random(255),random(255),random(255)));
  }
  //Burbujas
   for (int i = 0; i < burbus.length;i++){
    burbus[i] = new Burbujas(random(210,230), random(0, height/2), random (-1,1), color (random(255),random(69),random(0)));
  }
  
}
void draw(){
  background(100);
  image(fons1,0,0);
  //peces
  for (int i = 0; i < pez.length;i++){
    pez[i].dibuixa();
    pez[i].moure();
  }
  //Burbujas
  for (int i = 0; i < burbus.length;i++){
    burbus[i].dibuixa();
    burbus[i].moure();
  }
 
 }
class Burbujas {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  Burbujas(){
    c = color(255,0,0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
  Burbujas(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
  
  }
  void dibuixa(){
    fill(255);
   ellipse(xPos, yPos, random(1,5),random(1,5));
    
  }
  void moure(){
   xPos = xPos +random(-1,1);
   yPos = yPos +random(-1,1);
   //yPos =  (yPos + xSpeed)%height;
   if (xPos <0) xPos = 0;
   if (yPos <0) yPos = 0;
   if (xPos >width) xPos = width;
   if (yPos >height) yPos = height;
  }
}
class Peces {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  Peces(){
    c = color(255,0,0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
  Peces(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
    xSpeed = vel;
  }
  void dibuixa(){
    fill(c);
    ellipse (xPos -10, yPos -10, 40, 20);
    fill(0);
    ellipse(xPos -1, yPos-10, 3,3);
    triangle(xPos -30, yPos -10 , xPos -40, yPos +0, xPos -40, yPos -20);
    
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
    yPos = (yPos + xSpeed)%height;
  }
}


