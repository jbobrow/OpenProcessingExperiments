
  PImage img ;

 
float angle; 
int state; 
float r = 180;
Quas [] quas; 

void setup() {
  size(500, 500);
  background(255);
  imageMode(CENTER);
      img = loadImage("croco boy.png");
  quas = new Quas[12];
  for (int i=0;i<12;i++) {
    quas[i]=new Quas(i*TWO_PI/12);
  }
}

void draw() {
  float ang = atan2(mouseY-height/2, mouseX-width/2);
  float ang2 = atan2(mouseY-height/2, mouseX-width/2);
  background(255);
  pushMatrix();
  translate(width/2,height/2);
  rotate(ang);
  for (int i=0;i<12;i++) {
    quas[i].draw();
  }
  rotate(ang2);
  image(img, 0, 0, 300, 300);  
  popMatrix();
}

class Quas {
  float angle;
  float r = 180;

  Quas(float a) {
    angle = a;
  }

  void draw() {
 
   
    pushMatrix();
    rotate(angle);
    translate(r, 0);
    rotate(PI/2);
     
     
     
    quad(-10, -20, -20, 20, 20, 20, 10, -20);
    popMatrix();
  }
}


