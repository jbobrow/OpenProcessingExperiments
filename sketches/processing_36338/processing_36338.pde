
//Homework 3.1.1_Conditional Composition
//Created by Adrianne Blossom
//September 7, 2011

//This code creates an abstract composition using conditionals which change how the rectangles and triangles overlap each other in the sketch.

void setup() {
  size(300, 300);
  background(0, 0, 0);
}

void draw() {

  stroke(255, 255, 255); //Remember: Effects all of the figures strokes.
  strokeWeight(2);


  if (mouseY < height/4) {
    fill(255, 0, 0);
    rect(0, 0, 220, height/4);
  }  //Top red rectangle

  else if (mouseY > height/4) {
    fill(245, 255, 0);
    rect(80, 3*height/4, width, height/4);  //Bottom yellow rectangle

    if (mouseX < 3*width/4) {
      fill(119, 219, 13);
      triangle(0, 0, 0, height, width/2, height/2);
    }  //Right blue triangle

    else if (mouseX > width/4) {
      fill(0, 0, 255);
      triangle(width, 0, width, height, width/2, height/2);
    }  //Left green triangle
  }
}


