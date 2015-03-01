
//color

/*
for (int i=0; i >100; i++) {
stroke(i, 255,255);
noFill();
strokeWeight(mouseX-pmouseX);
ellipse(width/2, height/2, mouseX, mouseY);
}
*/

//version2 tracy's make the circle grow with movement of mouse
int circleSizeX = 0;
int circleY = circleSizeX;
  
  // color excercises 9-21
void setup () {
size (255,255);

}
  
void draw () {
  stroke(230,mouseX, 80);
strokeWeight(4);
noFill ();
ellipse (mouseX, mouseY, circleSizeX, circleSizeX);
circleSizeX = circleSizeX+abs(mouseX-pmouseX)/10;
circleSizeX = circleSizeX+abs(mouseY-pmouseY)/10;
}



