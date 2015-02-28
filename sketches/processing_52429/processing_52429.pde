
void setup() {
  //window size
  size(500,500);
}

void draw() {
  background(134,238,255);
  frameRate(30);
  smooth();
  
  //center mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //body 100,130,70,70
  stroke(0);
  fill(mouseX,100,mouseY);
  rect(mouseX,mouseY,70,70);
  
  //head 100,55,60,60
  stroke(0);
  fill(mouseX,100,mouseY);
  ellipse(mouseX,mouseY-75,60,60);
  
  //eyes 83/117,50,12,18
  fill(0);
  ellipse(mouseX-17,mouseY-80,12,18);
  ellipse(mouseX+17,mouseY-80,12,18);
  
  //legs 80/120,165,80/120,185
  stroke(0);
  line(mouseX-20,mouseY+35,mouseX-20,mouseY+55);
  line(mouseX+20,mouseY+35,mouseX+20,mouseY+55);
  
  //arms 40/135,110/120,65/160,120/110
  stroke(0);
  line(mouseX-60,mouseY-20,mouseX-35,mouseY-10);
  line(mouseX+35,mouseY-10,mouseX+60,mouseY-20);
  
  //neck 100,85,100,95
  stroke(0);
  line(mouseX,mouseY-45,mouseX,mouseY-35);
  
  //mouth
  stroke(0);
  fill(mouseX,100,mouseY);
  arc(mouseX,mouseY-65,26,22,0,PI);
  
}
void keyPressed() {

if(key=='s'){ 
    saveImage();}
}

