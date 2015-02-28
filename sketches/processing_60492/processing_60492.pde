
//Final Moire Project
//Creative Code -- Homework One -- Moire Pattern
//Alex Mutter
//January 30th, 2012


void setup () {
  size(600, 400);
  background(200);
  smooth();
}

void drawFigureOne () {//draw rectangle
  noFill();
  stroke(0, 0, 0, 128);
  rectMode(CENTER);
  rect(0, 0, 180, 120);
}

void drawFigureTwo () {//draw ellipse
  noFill();
  stroke(0, 0, 0, 128);
  ellipseMode(CENTER);
  ellipse(0, 0, 150, 120);
}

void draw() {
  println(frameCount);
  pushMatrix();
  translate(frameCount*3, 0);
  drawFigureOne();//rectangle
  popMatrix();
  
  pushMatrix();
  translate(-120 + frameCount*3, height/2);
  drawFigureTwo();//ellipse
  popMatrix();
  
  pushMatrix();
  translate(frameCount*3, 400);
  drawFigureOne();//rectangle
  popMatrix();
  
  pushMatrix();
  translate(0, -60 + frameCount*3);
  drawFigureTwo();
  popMatrix();
  
  pushMatrix();
  translate(width/4, 460 - frameCount*3);
  drawFigureTwo();
  popMatrix();
  
  pushMatrix();
  translate(width/2, -60 + frameCount*3);
  drawFigureTwo();
  popMatrix();
  
  pushMatrix();
  translate(450, 460 - frameCount*3);
  drawFigureTwo();
  popMatrix();
  
  pushMatrix();
  translate(width, -60 + frameCount*3);
  drawFigureTwo();
  popMatrix(); 
  
}

