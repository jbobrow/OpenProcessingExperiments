
int speed = 1;  
int state = 0;  
int x = 0; 
int y = 0;  
void setup() {
  size(100,100);
}
void draw() {
  background(0);
  noStroke();
  fill(255);
  rect(x,y,45,45);
  if (state == 0) {
    x = x + speed;
    if (x > width-45) {
      x = width-45;
      state = 1;
    }
  } else if (state == 1) {
    y = y + speed;
    if (y > height-45) {
      y = height-45;
      state = 2;
    }
  } else if (state == 2) {
    x = x - speed;
    if (x < 0) {
      x = 0;
      state = 3;
    }
  } else if (state == 3) {
    y = y - speed;
    if (y < 0) {
      y = 0;
      state=0;
    }
  }
}
void mousePressed() {
   speed = 0;
}
void mouseReleased() {
   speed = 1;
}


