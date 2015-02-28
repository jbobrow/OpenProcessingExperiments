
PImage revolver;
PImage computer;
PImage topsecret;
   
void setup() {
  size(600, 700);
  smooth();
  revolver = loadImage("revolver1.png");
  computer = loadImage("computer.png");
  topsecret = loadImage("topsecret.png");
  frameRate(2);
  imageMode(CENTER);
}
   
void draw() {
  background(255);
  
  
  float x = random(width);
  float y = random(height);
  float a = random(10,400);
  float b = random(50,800);
  float d = random(10,300);


  image(computer, 300,400,600,600);
  image(revolver, x, y/2, 400,160);
  image(revolver, x, y, 200,100);
  image(topsecret, a, d, 294,168);
  
 
}



