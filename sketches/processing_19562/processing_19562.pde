
PFont font;

void setup(){
  size(250 ,250);
  smooth();
  font = loadFont("RosewoodStd-Regular-48.vlw");
  //the exact file name of your VLW font
  background(125, 183, 170);
  textFont(font);
}


void draw(){
  fill(63, 25, 122);
  background(125, 183, 170);
  textSize(30);
 
for(int i=0; i<width; i+=20){
text("L4G0C8", mouseX-i, mouseY-i);
}
for(int i=0; i<width; i+=20){
text("L4G0C8", mouseX+i, mouseY+i);
}
for(int i=0; i<width; i+=20){
text("L4G0C8", mouseX-i, mouseY+i);
}
for(int i=0; i<width; i+=20){
text("L4G0C8", mouseX+i, mouseY-i);
}
//all four "lines" extend outward from centre to the 4 corners
}



