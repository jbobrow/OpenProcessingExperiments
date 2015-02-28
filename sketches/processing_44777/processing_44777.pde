
PImage img;
float angle =70.0;

 
void setup(){
size(800,400);
img = loadImage("DSC00001_01.jpg"); 
smooth();
}
 
void draw(){
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(000);
  textSize(16);
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(#333555);
  textSize(6);
  angle -= 0.5;
  image (img, 0,0);
}
 
 
 //My inspiration:http://www.openprocessing.org/visuals/?visualID=25414


