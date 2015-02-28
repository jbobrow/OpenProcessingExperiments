
 
int num = 50;
bubbles[] mybubbles = new bubbles [num];
 
 
void setup() {
  size(320, 240);
  smooth();
   
  for (int x=0; x<mybubbles.length; x++) {
    mybubbles[x] = new bubbles();
  }
}
 
 
void draw() {
 
  for (int x=0; x < mybubbles.length; x++) {
 
 
    mybubbles[x].update();
    mybubbles[x].display();
  }
}
 
 
class bubbles {
 
 
  int x = int(random(width));
  int y = int(random (height));
 
  bubbles() {
  }
 
  void update() {
    x = x + int( random (-5,5));
    y = y + int(random (-5, 5));
  }
 
 
  void display() {
//noStroke();
    scrubby (x, y);
  }
}

 
    void scrubby(float x, float y) {
  pushMatrix();
  translate(x, y);

rectMode(CENTER);
fill(255,255,255);
arc(50,50,50,50,PI,2*PI);
rect(50,53,53,6);
rect(50,56,53,6);

ellipse (40,38,8,18);
ellipse (60,38,8,18);
fill(0,40,120);
ellipse (40,41,6,10);
ellipse (60,41,6,10);
fill(255,210,65);
rect(50,62,50,8);
line(30,58,30,66);
line(40,58,40,66);
line(50,58,50,66);
line(60,58,60,66);
line(70,58,70,66);

  popMatrix(); // reset the matrix
}


