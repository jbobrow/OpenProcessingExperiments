
Plane[] avions = new Plane[10];

void setup(){
  size (400, 400);
  for (int i = 0; i < avions.length;i++){
    avions[i] = new Plane(0, random(height), random (1,4), color (random(255),random(255),random(255)));
  }
}
void draw(){
  background(#60FFFF);
  for (int i = 0; i < avions.length;i++){
    avions[i].dibuixa();
   avions[i].moure();
  }
 }
class Plane {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  Plane(){
    c = color(255,0,0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
   Plane(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
    xSpeed = vel;
  }
  void dibuixa(){
    fill(c);
    rect (xPos -35, yPos -35, 40, 20);
    fill(0);
    triangle(xPos -5, yPos -25, xPos -20 ,yPos +15,xPos -25,yPos -50);     
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
  }
}


