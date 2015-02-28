
int x,y = 0;
int xspeed = 2;
int yspeed = 1;

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(255);
  hareket();
  carparsa(); 
  display();
}

void hareket() {
  x = x + xspeed;
  y = y + yspeed;
}

void carparsa() {
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * - 1;
  }
  
    if ((y > height) || (y < 0)) {
    yspeed = yspeed * - 1;
  }
  
  
}

void display() {
  stroke(0);
  fill(200,90,190);
  ellipse (x, y, 50, 50);
}

