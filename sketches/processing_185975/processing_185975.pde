
int halfofWidth = 400 / 2;
void setup() {
  size(400, 400);
  
}
void draw() {
  background(0, 0, 0);
  
  //dividing lines
  stroke(255, 240, 245);
  strokeWeight(1);
  line(halfofWidth, 0, halfofWidth, height);
  line( 0, height/2, width, height/2);
    
  //if the mouse is in the top left quadrant
  if (mouseX < halfofWidth) {
    if (mouseY < height/2) { 
      fill(3,126,255);
      noStroke();
      rect(0, 0 , 200 , 200);  //draw a rectangle
      fill(0, 255, 0);
      textSize(122); // display Text
      text("I", 85, 140); 
  }
  }
    //if the mouse is in the top right quadrant
  if (mouseX > halfofWidth) {
    if (mouseY < height/2) { 
      fill(255, 246, 70);
      noStroke();
      rect(200, 0 , 200 , 200);  //draw a rectangle
      fill(225, 0, 0);
      beginShape(); // heart shape
curveVertex(300, 140);
curveVertex(300, 140);
curveVertex(250, 70);
curveVertex(270, 50);
curveVertex(300, 80);
curveVertex(330, 50);
curveVertex(350, 70);
curveVertex(300, 140);
curveVertex(300, 140);
endShape(CLOSE);

    }
  }
    //if the mouse is in the bottom left quadrant
  if (mouseX < halfofWidth) {
    if (mouseY > height/2) { 
      fill(255,3,222);
      noStroke();
      rect(0, 200 , 200 , 200);  //draw a rectangle
      fill(250, 255, 3);
      textSize(100); // display Text
      text("CO", 30, 335); 
}
  }
    //if the mouse is in the bottom right quadrant
  if (mouseX > halfofWidth) {
    if (mouseY > height/2) { 
      fill(0,225,0);
      noStroke();
      rect(200, 200 , 200 , 200);  //draw a rectangle
      fill(0, 0, 225);
      textSize(100); // display Text
      text("DE", 235, 335); 
}
  }
  }


