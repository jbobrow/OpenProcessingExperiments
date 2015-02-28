

boolean mouseClicked=true;
void setup(){
  size(400,500);
  background(0);
  frameRate(200);
}

void draw(){
  smooth();
  noStroke();
  fill(200);
  ellipse(mouseX,mouseY,4,4);
}

void mouseClicked(){
  if(mouseClicked){
    noStroke();
    fill(255);
    ellipse(mouseX,mouseY,30,30);
  }}

