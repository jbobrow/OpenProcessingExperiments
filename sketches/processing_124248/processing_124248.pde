
Atoms[] atomos = new Atoms[300];

void setup(){
  size (300, 300);
  for (int i = 0; i < atomos.length;i++){
    atomos[i] = new Atoms(0, random(height), random (3,11), color (random(255),random(0),random(255)));
  }
}
void draw(){
  background(113);
  for (int i = 0; i < atomos.length;i++){
    atomos[i].dibuixa();
    atomos[i].moure();
  }

 }
class Atoms {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  Atoms(){
    c = color(255,0,0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
  Atoms(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
    xSpeed = vel;
  }
  void dibuixa(){
    fill(c);
    ellipse(xPos - 5, yPos-10, 10,10);

    
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
  }
}


