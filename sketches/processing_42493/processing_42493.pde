
float x;
float y;
int radius=12;

void setup(){
  size(500,500);
  background(255);
  smooth();
  ellipseMode(RADIUS);
}

void draw(){
    if(mousePressed){
    fill(0,30);
    rect(0,0,width,height);
    stroke(255);
    strokeWeight(2);
    line (250,250,mouseX*5,mouseY*5);
    line (250,250,-mouseX*5,-mouseY*5);
  }
  else{
  stroke(0);
  strokeWeight(1);
  fill(255,3);
  rect(0,0,width,height);
  
  if (mouseX > radius) {
  radius++;
  }
  if (mouseX < radius) {
  radius--;
  }
  
  if (mouseY >radius) {
  radius++;
  }
  if (mouseY <radius){
  radius--;
  }
  
  ellipse(250,250, mouseY,mouseY);
  }
}

