
int speed = 1;
int globalX = 0;
int globalY = 100;

void setup() {
  size(640,480);
  fill(255, 170);
  noStroke();
  smooth();
  }

void draw() {
 background(190, 235, 256);
 fill(255);
 move();
 cloud(globalX, 75, 100);
 cloud(globalX+250, 150, 75);
 }
  
  // move cloud
  void move() {
    // let the cloud move 
    globalX = globalX + speed;
  }
  
   // display cloud
  void cloud  (float x, float y, float s) {
  for(int i = 0; i < 20; i++){
    ellipse(x+random(s)-s/2, y+random(s/5)-s/10, s, s*.8);
  }
  }


