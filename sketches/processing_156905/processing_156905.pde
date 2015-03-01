
int value = 0;
PVector origin;
PVector target = new PVector(25, 25);
float alpha = 0;
PVector mouse;
float d, a, c;
float theta, beta;

void setup() {
  size(600, 600);
  smooth();
  rectMode(CENTER);
  a = 50;
  c = 200;
}
void draw() {
  background(0);
  fill(255, alpha);
  mouse = new PVector(mouseX, mouseY);
  d = mouse.dist(target);
  rect(target.x, target.y, a, a);
  
}

void mousePressed() {
  alpha = 255;
  theta = 0;
}

void mouseDragged() 
{
  value +=5;
  theta += 0.05;
  alpha  = 127 * sin(theta) + 127;
  beta = 127 * cos(theta) + 127;
  stroke(255);
  strokeWeight(2);
  fill(255, beta);
  
  if (a < width/4) {
  line(target.x - a/2, target.y - a/2, mouseX - d/4, mouseY - d/4);
  line(target.x + a/2, target.y - a/2, mouseX + d/4 , mouseY - d/4);
  line(target.x - a/2, target.y + a/2, mouseX - d/4, mouseY + d/4);
  line(target.x + a/2, target.y + a/2, mouseX + d/4, mouseY + d/4);
  
  rect(mouseX, mouseY, d/2, d/2);
  } else {
  line(target.x - a/2, target.y - a/2, mouseX - c/2 + d/4, mouseY - c/2 + d/4);
  line(target.x + a/2, target.y - a/2, mouseX + c/2 - d/4 , mouseY - c/2 + d/4);
  line(target.x - a/2, target.y + a/2, mouseX - c/2 + d/4, mouseY + c/2 - d/4);
  line(target.x + a/2, target.y + a/2, mouseX + c/2 - d/4, mouseY + c/2 - d/4);
    rect(mouseX, mouseY, c - d/2, c -d/2);
  }
}

void mouseReleased() {
  target = new PVector(mouseX, mouseY);
  origin = target;
  alpha = 255;
  value = 0;
  a = d/2;
}

