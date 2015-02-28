
//
PImage b;
void setup(){
  size (800,800);
  background(255);
  smooth();
}


void draw(){
  imageMode(CENTER);
  frameRate(15);
  noStroke();
rect(40, 0, 20, height);
rect(60, 0, 20, height/2);
  ellipse(mouseX,mouseY,pmouseX,pmouseY);
filter(BLUR, 1);
  fill(mouseX,random(255),random(255),50);
    ellipse(mouseX*602,mouseY/602,3200,210);
    fill(mouseX,mouseY,212,60);
quad(pmouseX,pmouseY,60,60,60,60,60,60);
quad(mouseX+mouseY,100,mouseX,500,mouseY,500,100,100);
quad(random(500)+mouseY,100,mouseX,500,mouseY,500,100,100);
}

