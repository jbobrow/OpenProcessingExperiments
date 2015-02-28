
void setup() {
  size(200,200);
  frameRate(30);
}

void draw() {
  background(255);
  
  float w = random(width/4);
  float h = random(height/4);
  
  rectMode(CENTER);
  fill(mouseX, random(255), mouseY);
  rect(mouseX,mouseY,w,h);
  
  if(mousePressed)
  {
      background(0);
      stroke(255);
      fill(mouseX,random(255),mouseY);
      ellipse(mouseX,mouseY,random(width/4),random(height/4));
  }
  
}




