
void setup () {
  size (500, 500);
}

void draw () {
  if(mousePressed) {
    background(0);
    stroke(255);
    fill(255);
    triangle(250, 50, 200, 150, 300, 150);
    stroke(255);
    fill(255);
    ellipse(250, 250, 100, 100);
    stroke(255);
    fill(255);
    rect(245, 350, 5, 100);
  }
  else {
    background(255);
    stroke(0);
    fill(0);
    triangle(250, 50, 50, 450, 450, 450);
    stroke(0);
    fill(255);
    triangle(250, 60, 60, 445, 440, 445); 
    stroke(0);
    fill(0);
    ellipse(250, 327, 235, 235);
    stroke(0);
    fill(255);
    ellipse(250, 327, 225, 225);
    stroke(0);
    fill(0);
    rect(246, 58, 8, 380);
  }
}


