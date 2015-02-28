
int circleX = 0;
int circleY = 100;

void setup () {
  
 size(300,300);
}

void draw () {
  float r = random(255);
  float g = random(255);
  float b = random(255);

  strokeWeight(0);
  fill(r,g,b);
  ellipse(mouseX, mouseY,20,60);
  
}
  


