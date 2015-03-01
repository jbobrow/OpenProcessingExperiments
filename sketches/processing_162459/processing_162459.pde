
int rx = 45;
int rxx = 54;
int ry = 20;
 
int r = 15;
int a = 20;
int draw2 = 225;
int drawCir = 213;
 
void setup() {
  size (600, 600);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
  background(30);
 
  //buttcons
  fill(255);
  rect(87, 550, rx, ry, 2);
  fill(139, 214, 175);
  rect(87+rxx, 550, rx, ry, 2);
  fill(255, 244, 113);
  rect(87+rxx*2, 550, rx, ry, 2);
  fill(242, 153, 122);
  rect(87+rxx*3, 550, rx, ry, 2);
  fill(117, 81, 51);
  rect(87+rxx*4, 550, rx, ry, 2);
  fill(249, 178, 170);
  rect(87+rxx*5, 550, rx, ry, 2);
  fill(253, 230, 198);
  rect(87+rxx*6, 550, rx, ry, 2);
  fill(229, 100, 82);
  rect(87+rxx*7, 550, rx, ry, 2);
 
 
  //drawing board
  fill(90);
  ellipse(300, 300, draw2, draw2);
  fill(255);
  ellipse(300, 300, drawCir, drawCir);
 
  ellipse(300, 34, 8, 8);
}
 
 
void draw() {
 
  float pd = dist(pmouseX, pmouseY, 300, 300);
  float d = dist(mouseX, mouseY, 300, 300);
 
 
  if (mousePressed) {
 
    //brush
    if (d < drawCir && pd < drawCir) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
 
  //red,
  if ( mouseX > 87 && mouseX < 87+rx && mouseY > 550 && mouseY < 550+ry) {
    stroke(255);
    strokeWeight(5);
    fill(255);
    ellipse(300, 34, 6, 6);
  }
 
  if ( mouseX > 87+rxx && mouseX < 87+rxx+rx && mouseY > 550 && mouseY < 550+ry) {   
    stroke(139, 214, 175);
    strokeWeight(5);
    fill(139, 214, 175);
    ellipse(300, 34, 6, 6);
  }
 
  if ( mouseX > 87+rxx*2 && mouseX < 87+rxx*2+rx*2 && mouseY > 550 && mouseY < 550+ry) {   
    stroke(255, 244, 113);   
    strokeWeight(5);
    fill(255, 244, 113);
    ellipse(300, 34, 6, 6);
  }
 
  if ( mouseX > 87+rxx*3 && mouseX < 87+rxx*3+rx*3 && mouseY > 550 && mouseY < 550+ry) {   
    stroke(242, 153, 122);
    strokeWeight(5);
    fill(242, 153, 122);
    ellipse(300, 34, 6, 6);
  }
 
  if ( mouseX > 87+rxx*4 && mouseX < 87+rxx*4+rx*4 && mouseY > 550 && mouseY < 550+ry) {   
    stroke(117, 81, 51);
    strokeWeight(5);
    fill(117, 81, 51);
    ellipse(300, 34, 6, 6);
  }
 
  if ( mouseX > 87+rxx*5 && mouseX < 87+rxx*5+rx*5 && mouseY > 550 && mouseY < 550+ry) {   
    stroke(249, 178, 170);
    strokeWeight(5);
    fill(249, 178, 170);
    ellipse(300, 34, 6, 6);
  }
 
  if ( mouseX > 87+rxx*6 && mouseX < 87+rxx*6+rx*6 && mouseY > 550 && mouseY < 550+ry) {   
    stroke(253, 230, 198);
    strokeWeight(5);
    fill(253, 230, 198);
    ellipse(300, 34, 6, 6);
  }
 
  if ( mouseX > 87+rxx*7 && mouseX < 87+rxx*7+rx*7 && mouseY > 550 && mouseY < 550+ry) {   
    stroke(229, 100, 82);
    strokeWeight(5);
    fill(229, 100, 82);
    ellipse(300, 34, 6, 6);
  }
 
 
  if ( mouseX > 296 && mouseX < 304 && mouseY > 30 && mouseY < 38) {   
   noStroke();
    fill(255);
    ellipse(300, 300, drawCir, drawCir);
    fill(255,255,255);
    ellipse(300, 34, 8, 8);
  }
}

