
/* @pjs preload= "birds2.jpg"; */
PImage peach;
float angle = 0;
 
void setup() {
  size(1071, 745);
  peach = loadImage("birds2.jpg");
  noStroke();
  smooth();
  background(0);
}
 
void draw() {
  float r =(10);
  

if (mousePressed){
  color c = peach.get(mouseX, mouseY);
    translate(mouseX, mouseY);
rotate(angle);
  rect(-1,-1,2,10); 
  fill(c, 102); 
angle += 0.5;
}
}
void keyPressed(){
if (key == 's'){
    saveFrame(peach+".jpg"); //save image as .jpg
  } }



