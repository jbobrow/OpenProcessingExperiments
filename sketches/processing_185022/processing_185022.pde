
int x=10;// x position
int y=10;// y position

void setup(){
  background(255,255,0);
  size(640,480);
  frameRate(10);
}

void draw(){
  rectMode(CENTER);
  fill(255,100,0);
  rect(mouseX,mouseY,50,50);
  fill(mouseX/3,mouseY/3,255);
  rect(mouseX,mouseY+15,30,5);
  fill(mouseX/3, mouseY/3, 255);
  rect(mouseX+10,mouseY-5,10,10);
  fill(mouseX/3, mouseY/3, 255);
  rect(mouseX-10,mouseY-5,10,10);
}
