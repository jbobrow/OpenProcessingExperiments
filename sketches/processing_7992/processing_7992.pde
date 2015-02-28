
//jouons avec: line (xl, yl, x2, y2);


void setup() {
  size (500, 500);
  background(#FFFFFF);
}




void draw() {

if (mousePressed == true) {
 //argument
 //line(250, 250, mouseX, mouseY);
 //line(200, 150, mouseX+100, mouseY-250);
 //line(mouseX+55, mouseY+23, 20, -30);
 //line(mouseX-300, mouseY, 0, 0);
 //line(mouseX, mouseY, 0, 0);
 line(mouseX, mouseY, mouseX, mouseY);
 line(mouseX, mouseY, mouseY, mouseX);
 line(mouseY, mouseX, mouseX, mouseY);
 line(mouseX, mouseX, mouseX, mouseX);
 line(mouseY, mouseY, mouseY, mouseY);
 line(mouseX, mouseX, mouseY, mouseY);
 line(mouseY, mouseY, mouseX, mouseX);
 line(mouseX, mouseX, mouseX, mouseY);
 line(mouseX, mouseY, mouseY, mouseY);
 line(mouseY, mouseY, mouseY, mouseX);
};
if (keyPressed == true) { 

  saveFrame();
  background(#FFFFFF);
}
  
//line(250, 250, mouseX, mouseY);
//line(7, 200, mouseX, mouseY);
//line(mouseX, mouseY, 0, 0);

}

