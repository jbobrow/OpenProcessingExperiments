

float angle = 0.0;

void setup() {
  size (800,800);
  frameRate(200);
    smooth();
    PFont font;
        font=loadFont ("OldSansBlackUnderline-48.vlw");
          textFont(font, 30);
  fill (255);
  textFont(font);
}



void draw() {
  background(100); // no trace





  // fill(151, 227, 220, 50); // triangle colour and transparency

  // translate(10, 10);
  // rotate(PI/20);
  // triangle(350, 100, 450, 100, mouseX, mouseY); // triangle prism


  // rotate(PI/80);
  // triangle(350, 100, 450, 100, mouseX, mouseY); // triangle prism


  // rotate(PI/160);
  // triangle(350, 100, 450, 100, mouseX, mouseY); // triangle prism




  pushMatrix();

  fill(0);

  rect(0, 0, 30, mouseY);
  translate(20, 20);
  rect(0, 0, 30, mouseX);
  translate(20, 20);
  rect(0, 0, 30, mouseY);
  translate(20, 20);
  rect(0, 0, 30, mouseX);
  translate(20, 20);
  rect(0, 0, 30, mouseY);
  translate(20, 20);
  rect(0, 0, 30, mouseX);

  popMatrix();


  rect(mouseX, 10, mouseY, 10);
  translate(20, 20);
  rect(mouseX, 10, mouseY, 10);
  translate(20, 20);
  rect(mouseX, 10, mouseY, 10);
  translate(20, 20);
  rect(mouseX, 10, mouseY, 10);
  translate(20, 20);
  rect(mouseX, 10, mouseY, 10);
  translate(20, 20);
  rect(mouseX, 10, mouseY, 10);
  translate(20, 20);
  rect(mouseX, 10, mouseY, 10);
  translate(20, 20);

  pushMatrix();

  translate(mouseX, mouseY);
  rotate(angle);
  rect(-15, -15, 30, 30);
  angle += 0.1;


  translate(20, 20);
  rect(-15, -15, 30, 30);

  translate(-40, -40);
  rect(-15, -15, 30, 30);

ellipse(20, 20, 50, 50);

translate(20, -40);
  ellipse(0, 0, 15, 15);

translate(-40, 20);
  ellipse(0, 0, 20, 20);

translate(-60, 0);
  ellipse(0, 0, 30, 30);

  popMatrix();
  

 textSize(30);
  text ("hellomyminions.jpg", 10, 100);
}




