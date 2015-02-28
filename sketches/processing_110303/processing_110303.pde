
float circleX;
float circleY;

void setup() {
  size(600, 600);
  background(25, 25, 112);
  circleY = 300;
  circleX = 300;
}

// CIRCLES

void draw() {
  
    stroke(255);
  fill(255);
  ellipse(circleY, 300, 305, 305);
     // cercle size
  circleY = circleY - .1;
   stroke(255);
  fill(255);
  ellipse(circleX, 300, 305, 305);
     // cercle size
  circleX = circleX + .1;
    
    stroke(0);
  noFill();
  ellipse(circleX, 300, 405, 405);
       // cercle size
  circleX = circleX + .1;
      stroke(0);
  noFill();
  ellipse(circleY, 300, 405, 405);
       // cercle size
  circleY = circleY - .1;
  
  stroke(0);
  noFill();
  ellipse(300, 300, 25, 25);
   stroke(0);
  noFill();
  ellipse(mouseX, mouseY, 25, 25);
  
  
  stroke(0);
  noFill();
  ellipse(300, 300, 45, 45);
  stroke(0);
  noFill();
  ellipse(300, 300, 65, 65);
  stroke(0);
  noFill();
  ellipse(300, 300, 85, 85);
  stroke(0);
  noFill();
  ellipse(300, 300, 105, 105);
  stroke(0);
  noFill();
  ellipse(300, 300, 205, 205);

}



