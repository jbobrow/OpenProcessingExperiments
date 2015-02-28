
//Samyukta Madhu
//Creative Computing
//March 18, 2013
//Objects - Fireworks
int expoding = 100;
Firework[] pieces = new Firework[expoding];
Boolean isSetup = false;

void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {

  noStroke();
fill(random(0,255),random(0,255),random(0,255),150);
  if (mousePressed == true) {
    
    for (int i = 0; i<expoding; i++) {
      pieces[i] = new Firework(mouseX, mouseY);
    }
isSetup = true;
  }
  if (isSetup == true) { 
    for (int i = 0; i<expoding; i++) {
      pieces[i].boom();
      pieces[i].display();
    }
  }
}
 
class Firework {
  
  float Xposition;
  float Yposition;
  float Xspeed;
  float Yspeed;
  
 
  Firework (int isX, int isY) {
    Xposition = isX;
    Yposition = isY;
    Xspeed = random(-10, 10);
    Yspeed = random(-10, 10);
    
  }
  void boom() {
    Xposition = Xposition + Xspeed;
    Yposition = Yposition + Yspeed;
   
  }
  void display() {
    ellipse(Xposition, Yposition, 5,5);
  }
}
