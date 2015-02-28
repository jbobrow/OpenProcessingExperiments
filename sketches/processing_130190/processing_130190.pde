
//copyright Leslie Bloomfield lbloomfi 2014 HW#4
//mouseX/mouseY - makes flowers
//mouse click - adds centers
//key press - adds stems and leaves
//mouse wheel - makes it nighttime

void setup() {
  size(400, 400);
  background(240, 247, 255);
}
 
void draw() {
   
    strokeWeight(1);
//flowers
  pushMatrix();
   stroke(229, 201, 228);
  fill(223, 165, 227);
  translate(width/2, height/2);
  rotate(mouseX);
  rect(10, 10, 70, 4);
  popMatrix();
  
  pushMatrix();
  stroke(252, 0, 139);
  fill(250, 129, 206);
  translate(width/5, height/5);
  rotate(mouseY);
  triangle(36, 5, 15, 35, 55, 35);
  popMatrix();
  
  pushMatrix();
  stroke(250, 228, 172);
  fill(250, 208, 129);
  translate(width*.8, height*.2);
  rotate(mouseX);
  ellipse(25, 25, 50, 50);
  popMatrix();
   
  
}

void mouseClicked(){
  //middle of the flowers
  noStroke();
  fill(250, 161, 129);
  ellipse(80, 80, 75, 75);
  
  fill(229, 160, 226);
  ellipse(320, 80, 60, 60);

  fill(250, 86, 176);
  ellipse(200, 200, 120, 120);
  
}

void keyPressed() {
  //stems
 
    strokeWeight(15);
    strokeCap(SQUARE);
    stroke(178, 252, 207);
    fill(178, 252, 207);
    line(75, 140, 75, 400);
    line(320, 140, 320, 400);
    line(200, 260, 200, 400);
    
    //leaves
    arc(50, 250, 80, 80, QUARTER_PI, PI, OPEN);
    arc(235, 300, 60, 60, 0, PI, OPEN);
    arc(160, 300, 60, 60, 0, PI, OPEN);
    arc(320, 200, 100, 100, 0, HALF_PI, OPEN);

}
 
 void mouseWheel(MouseEvent event) {
  background(2, 1, 59);
}
 

