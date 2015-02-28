
int strokeWidth;
int strokeColor;

void setup() {
size(2000, 2000);  
  background(255, 255, 255);

  
}


void draw() {
  background(random(255));
  fill(255, random(255), random(255));
  ellipse(width/2, height/2,500,500);
  if (mousePressed = true)
  ellipse( random(800), random(800), random(400), random(400));
  quad(random(255),random(300),39,27,790,45,800,21);
  
  strokeWeight(strokeWidth++);
  stroke(strokeColor++);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
