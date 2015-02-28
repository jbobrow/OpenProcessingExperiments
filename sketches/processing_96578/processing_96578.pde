
void setup() {
  size(600, 800);
 
  noStroke();
}
 
 
void draw() {
 
 
  translate(mouseX, mouseY);
 
 
  if (mousePressed) {
    if ( 100<=mouseX && mouseX <=280 && mouseY >= 150 && mouseY <= 380) {
      insidebrush1();
      insidebrush1();
      insidebrush1();
    }
    else if ( mouseX>=320 && mouseX<=500 && mouseY>=150 && mouseY<= 380) {
      insidebrush1();
      insidebrush1();
      insidebrush1();
    }
    else if (100<=mouseX && mouseX <=280 && mouseY >= 420 && mouseY <= 650) {
      insidebrush1();
      insidebrush1();
      insidebrush1();
    }
    else if ( mouseX>=320 && mouseX<=500 &&mouseY; >= 420 && mouseY <= 650) {
      insidebrush1();
      insidebrush1();
      insidebrush1();
    }
    else {
      if (mousePressed) {
        outsidebrush1();
        outsidebrush1();
        outsidebrush1();
      }
    }
  }
}
 
void insidebrush1() {
  fill(random(0, 212), random(87, 244), random(102, 250), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(0, 0, 50, 50);
  insidebrush2();
  insidebrush2();
  insidebrush2();
  popMatrix();
}
 
void insidebrush2() {
  fill(random(0, 212), random(87, 244), random(102, 250), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(0, 0, 20, 20);
  popMatrix();
}
void outsidebrush1() {
  fill(random(171, 255), random(102, 242), random(0, 255), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(0, 0, 50, 50);
  outsidebrush2();
  outsidebrush2();
  outsidebrush2();
  popMatrix();
}
 
void outsidebrush2() {
  fill(random(171, 255), random(102, 242), random(0, 255), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(0, 0, 20, 20);
  popMatrix();
}
