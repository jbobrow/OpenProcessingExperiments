
float speed = 1.0;//speed object is moving
float x;
float y;

void setup() {
  size(250, 250);
  smooth();
  fill(0,102);
  x = width/2;
  y = height/2;
}

void draw() {
  fill(mouseX,mouseY,random(100,255),255);//rectangle random colours depending on mouse position
  x += random(-speed*2, speed*2);
  y += random(-speed*2, speed*2);//how it moves on the x&y axis
  rect(x, y, 25, 25);
}


