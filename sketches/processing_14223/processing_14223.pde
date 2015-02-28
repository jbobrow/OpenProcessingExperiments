
void setup()
{
  size(600,600);
  background(255,255,255,100);
  smooth();
}

void draw()
{
  frameRate(25);
  stroke(random(255));
  
  fill(255,50);
  
  float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed = dist(0,0,100,200);
  speed =random(0,50);
  

  strokeWeight(1.0);
  if (mousePressed) {
    fill(random(255),random(220),random(255),random(100));
  ellipse(mouseX, mouseY, speed*2, speed*2);
  
  }
}

