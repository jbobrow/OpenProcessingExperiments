
PImage revolver;
PImage computer;
PImage topsecret;
float pmillis = 0;
float x,y,a,b,d;
float angle, inc;
   
void setup() {
  size(600, 700);
  smooth();
  revolver = loadImage("revolver1.png");
  computer = loadImage("computer.png");
  topsecret = loadImage("topsecret.png");
  imageMode(CENTER);
}
   
void draw() {

  if (millis() - pmillis >= 3000) {
    x = random(width);
    y = random(height);
    a = random(10,400);
    b = random(50,800);
    d = random(10,300);
    inc = random(-0.3,0.3);
    
    pmillis = millis();
  }
 
  angle+= inc;
  
  pushMatrix();
  translate (0,0);
  image(computer, 300,400,600,600);
  popMatrix();
  
  pushMatrix();
  rotate(angle);
  image(revolver, x, y/2, 400,160);
  popMatrix();
  
  pushMatrix();
  image(revolver, x, y, 200,100);
  popMatrix();
  
  pushMatrix();
  image(topsecret, b,d, 294,168);
  popMatrix();
}


