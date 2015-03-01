
float x;
float y;
float easing = 0.05;

void setup() {
  size(500, 500); 
  noStroke();  
}

void draw() { 
  fill(51,51,51,50);
  rect(0,0,500,500);
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  fill(255);
  ellipse(x, y, 66, 66);
if (mousePressed){ 
  fill(random(255), random(255), (255));
  ellipse(x,y,66,66); 
  fill(random(255), (255), random(255));
  ellipse(x+45,y+45,30,30);
  ellipse(x-45,y+45,30,30);
  ellipse(x+45,y-45,30,30);
  ellipse(x-45,y-45,30,30);
  fill((255), random(255), random(255));
  ellipse(x,y+80,30,30);
  ellipse(x,y-80,30,30);
  ellipse(x+80,y,30,30);
  ellipse(x-80,y,30,30);
}
}
