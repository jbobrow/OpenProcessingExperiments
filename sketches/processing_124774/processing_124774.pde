
void setup() {
    size(500, 500);
    x = 50
    y = 250
    dx = 10;
    dy = 0.1;
}

void draw() {
    background(225);  
    ellipse(x%width, y%height, 20, 20);
    x+=dx;
    if(x<0) x=x+width;
    y+=dy;
    if(y<0) y=y+height;
}
void mousePressed() {
  if (mouseButton == LEFT) {
    dx=random(0,20);
  } else  {
    dx=--random(0,20);
 }
}
