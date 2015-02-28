
void setup(){
  size(500, 500);
  smooth();
  background(0);
  noStroke();
  rectMode(CENTER);
  noCursor();
  frameRate(70);
}

void draw() {

if (mousePressed == false) {

    stroke(100, 80);

    line(mouseX, mouseY, 50, mouseX);
  
     }   

 if (mousePressed) {

    stroke(210, 210);

    line(mouseX, mouseY, 200, mouseX);
    line(mouseX, mouseY, 200, mouseX);

     } 

}
