
///////////////////////////// Project_ CLOCK \\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2014\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


PFont font;
void setup() {
  size(800, 800);
  font = loadFont("Calibri-Bold-48.vlw");
  smooth();
  frameRate(100);
}

void draw() {

  translate(width/2, height/2);
  background(0);
  smooth();
  int s = second();
  int m = minute();
  int  h = hour();


 // textFont(font, 50);
  fill(mouseX/5, mouseY/20, mouseX/15, 95);
  ///text(h, 0-70, 150);
 // text(m, -10, 150);

 // text(s, 0+50, 150);



  noStroke();

  // strokeWeight(1);
  ellipse(0, 0, mouseX+mouseY/2, mouseX+mouseY/2);
  ellipse(0, 0, mouseX/2, mouseX/2);
  ellipse(0, 0, mouseY/4, mouseY/4);
  fill(120);
  ellipse(0, 0, 10, 10);

  pushMatrix();
  stroke(255, 255, 255, 20);
  //noStroke();
  translate(0, 0);
  rotate(PI/6*h);
  line(0, 0, 0, -60);
  fill(250, 0, 0, 100);
  noStroke();
  ellipse(0, -60, 10, 10);
  popMatrix();

  pushMatrix();
  stroke(255, 255, 255, 20);
  translate(0, 0);
  rotate(PI/30*m);
  line(0, 0, 0, -80);
  fill(250, 0, 0, 100);
  noStroke();
  ellipse(0, -80, 10, 10);
  popMatrix();


  pushMatrix();
  stroke(255, 255, 255, 20);
  translate(0, 0);
  rotate(PI/30*s);
  line(0, 0, 0, -80);
  fill(250, 255, 255, 100);
  noStroke();
  ellipse(0, -80, 10, 10);
  popMatrix();
  pushMatrix();                     ///////////////logo
  fill(255, 255, 255, 95);
  noStroke();
  rect(width/2-80, height/2-55, 10, 10);
  rect(width/2-60, height/2-55, 10, 10);
  rect(width/2-70, height/2-45, 10, 10);
  rect(width/2-60, height/2-35, 10, 10);
  popMatrix();                      /////////////logo
}


///////////////////////////// Project_ CLOCK \\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2014\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

