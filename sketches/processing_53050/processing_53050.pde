
PImage eyeBG;
PImage iris;
PImage blood;
float jitter;
float angle;
float x;
float y;


void setup () {
  size(550,450);
  smooth();
  frameRate(30);
  eyeBG = loadImage ("background.png");
  iris = loadImage ("iris.png");
  blood = loadImage("blood.png");
  imageMode(CENTER);
  }
  
  void draw () {
    background(eyeBG);
  
  if (mousePressed == true) {
    cutEye();
    pushMatrix(); 
    translate(x,y);
  drawIris();
  x = random(220, 240);
  y = random(240, 260);
  popMatrix();
   }
   else {
     unCutEye();
   }
  }
  
  void drawIris () {
     if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  pushMatrix();
  translate(0, 0);
  rotate(c);
  image(iris,0,0); 
  popMatrix();
  }
  
  void unCutEye () {
   pushMatrix(); 
    translate(x,y);
    drawIris();
    x = random(150, 170);
    y = random(200, 220);
  popMatrix();
    
  }
  
  void cutEye () {
    background(eyeBG);
    imageMode(CENTER);
    alpha(50);
    image(blood,250,345);
  }
  
  

  

