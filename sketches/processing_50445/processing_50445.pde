
void setup(){
  size(screen.width, screen.height);
  smooth();
  background(0);
  mouseX=width/2; mouseY=height/2;
  
}
void draw(){
  float r=random(200);
  fill(0,random(255), random(255), 20);
  if (mouseButton == LEFT){
    ellipse(mouseX, mouseY, r, r);
  noStroke();
  }
}

