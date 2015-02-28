
int x = 10;
int y = 10;
int l = 10;
int b = 10;  
int speedX = 3;
int speedY = 3;
  
void setup() {
  size(400, 400);
  smooth();
  rect(0, 0, width, height);
}
  
void draw() {
  fill(144, 204, 255);
  noStroke ();
  rect (0, 0, width, height);  
  fill(100, 100, 150);
  
  if (mousePressed) {   
  
    if (x > width || x < 0) {
      x=0;
    }
    else if (l > width || l < 100) {
      l=width;
    }
    rect(x, y, 100, 100);
    rect(l, b, 100, 100);
  
    speedX = 1;
    x = x - speedX;
    y = y - speedY;
    l = l + speedX;
    b = b + speedY;
  }
  
  else {
    if (x > width || x < 0) {
      x=0;
    }
    else if (l > width || l < 0) {
      l=width;
    }
    fill(255,249,100);
    rect(x, y, 100, 100);
    rect(l, b, 100, 100);
  
    x = x + speedX;
    l = l - speedY;
    speedX= 5;
    y=0;
    b=300;
  }
}

                
                
