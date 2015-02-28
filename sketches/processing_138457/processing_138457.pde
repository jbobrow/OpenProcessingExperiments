




void setup() { 
  size(800, 8000); 
  background(255);
  smooth();
  noStroke();
  println("click the mouse.");
}

void draw() {

  background(255);

  //sea grean dot
  //head
  fill(170, 255, 223);
  ellipse(mouseX-50, 400, 100, 100);

  fill(0);
  //right eye
  ellipse(mouseX-30, 400, 15, 15);
  //left eye
  ellipse(mouseX-70, 400, 15, 15);

  //cheeks
  fill(170, 255, 223);
  ellipse(mouseX-70, 422, 23, 23);
  ellipse(mouseX-30, 422, 23, 23);
  if (mousePressed) {
    fill(255, 111, 111);
    ellipse(mouseX-70, 422, 23, 23);
    ellipse(mouseX-30, 422, 23, 23);
    
    //purple dot
    fill(249, 170, 255);
    ellipse(750, 400, 100, 100);
    //eyes
    fill(0);
    ellipse(725, 400, 15, 15);
    ellipse(775, 400, 15, 15);

    //mouth
    fill(232, 118, 80);
    ellipse(750, 412, 20, 10);
  }
}



