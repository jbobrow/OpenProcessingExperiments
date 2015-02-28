

boolean mouseClicked=true;
void setup(){
  size(400,500);
  background(255);
}

void draw(){
  smooth();
  noStroke();
  fill(150,200,150);
  //point(mouseX,mouseY);
  ellipse(mouseX,mouseY,4,4);
}

void mouseClicked(){
  if(mouseClicked){
    noStroke();
    fill(random(0,256),random(0,256),random(0,256),150);
    ellipse(mouseX,mouseY,30,30);
  }}

