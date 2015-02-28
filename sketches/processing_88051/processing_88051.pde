
void setup() {
  size(480, 480);
  strokeWeight(20);
  smooth();
}

void draw() {
  background(0);
  stroke(255,102,102);
  line(0, 0, width, 350);
  stroke(64,64,64);
  line(550, 0, 0, 200);
  if (mousePressed) {
    if (mouseButton == LEFT) {
  stroke(102,204,0);
  } else {
    stroke(255,255,102);
  }
  line(0, 0, width, 350);
  }
  
  // Text
  textSize(22);
  fill(255,255,255);
text("Right/Left Click For Color Change", 80, 30); 
fill(178,102,255);
text("Move Arrrow Up/Down &", 20, 350);
fill(178,102,255);
text("Left/Right For Size Change", 70, 380);



{
  float x;
float y;
float px;
float py;
float easing = 0.08;
stroke(255);
int offset = 10;
}

{
float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight);
  py = y;
  px = x;
  
  
  if (mouseX > x) {
  x += 0.5;
  offset = -10;
  }
  if (mouseX < x) {
  x += 0.5;
  offset = -10;
  }
  line(mouseX, mouseY, mouseX + offset, mouseY - 10);
  line(mouseX, mouseY, mouseX + offset, mouseY + 10);
  line(mouseX, mouseY, mouseX + offset*3, mouseY);
}
}










