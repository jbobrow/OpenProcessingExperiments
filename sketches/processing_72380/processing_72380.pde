
int x=0;
int y=0;

void setup(){
  size(500,500);
  frameRate(5);
  smooth();
}
 
void draw(){
  background(0,0,0);
  strokeWeight(10);
  line(100,0,mouseX,mouseY);
  line(0,100,mouseX,mouseY);
  line(mouseX,mouseY,20,20);
  line(400,500,mouseX,mouseY);
  line(500,400,mouseX,mouseY);
  line(mouseX,mouseY,499,499);
  
  fill(random(0,mouseX - 150),random(0,mouseY - 150),random(mouseX,mouseY));
    rect(500-mouseX,500-mouseY,-mouseX,-mouseY);
  rect(0,0,mouseX,mouseY);
  rect(mouseX,mouseY,500,500);
   
  //frameRate(10);
  fill(random(0,mouseX),random(0,mouseY),5);
  ellipse(random(0,mouseX),random(0,mouseY),20,20);
}
 void keyPressed() {
  if(key=='s'){
    saveImage();}
 }
