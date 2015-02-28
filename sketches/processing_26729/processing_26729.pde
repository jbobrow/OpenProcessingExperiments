
class Circle {
  
  float x, y;
  
  int counter = 0;
  
  Circle() {
    // Set colour to random value.
  }
  
  void drawAndGrow() {
    stroke(#DE3838);
    strokeWeight(2);
    fill(#CB5A5A, 200);
    ellipse(x, y, counter, counter);
    counter = counter + 1;
  }
  
}

