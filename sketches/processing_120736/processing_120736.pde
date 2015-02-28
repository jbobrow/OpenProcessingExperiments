
Metor metor1;
Metor metor2;
Metor metor3;
Metor metor4;
Metor metor5;

void setup() {
  metor1 = new Metor();
  metor2 = new Metor();
  metor3 = new Metor();
  metor4 = new Metor();
  metor5 = new Metor();
  size(500,500);
  frameRate(60);
}

void draw() {
  background(255);
  metor1.fall();
  metor1.display();
  
  metor2.fall();
  metor2.display();
  
  metor3.fall();
  metor3.display();
  
  metor4.fall();
  metor4.display();
  
  metor5.fall();
  metor5.display();
}

class Metor {
  color c;
  float xPos;
  float yPos; 
  float ySpeed;
  float metorWidth;
  float metorHeight;
  
  Metor() {
    c = color(106,40,10);
    xPos = random(width);
    yPos = random(-25,-1);
    ySpeed = random(1,5);
    metorWidth = random(5,15);
    metorHeight = random(5,15);
  }
  
  void display() {
    fill(c);
    rect(xPos,yPos,metorWidth,metorHeight);
  }
  
  void fall() {
    yPos = yPos + ySpeed;
    if (yPos > height) {
      xPos = random(width);
      yPos = random(-25,-1);
      ySpeed = random(1,5);
      metorWidth = random(5,10);
      metorHeight = random(5,10);
    }
  }
}


