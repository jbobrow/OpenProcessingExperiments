
//global variables
PVector e1 = new PVector();
PVector e2 = new PVector();
PVector e3 = new PVector();


void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  drawAtomBG();
  
  //start homework code here//
  float time = (float)millis()/200;
  e1.x = 200 + (150 * cos(time)) ;
  e1.y = 200 + (50 * sin(time));

  
  //adding to time just starts the circle at a different location on the ellipse, i did it because it looks better
  e2.x = 200 + (150 * cos(time+2) * cos(-PI/3) - 50 * sin(time+2) * sin(-PI/3));
  e2.y = 200 + (150 * cos(time+2) * sin(-PI/3) + 50 * sin(time+2) * cos(-PI/3));
  
  e3.x = 200 + (150 * cos(time+1) * cos(-PI/1.5) - 50 * sin(time+1) * sin(-PI/1.5));
  e3.y = 200 + (150 * cos(time+1) * sin(-PI/1.5) + 50 * sin(time+1) * cos(-PI/1.5));
 
  noStroke();
  fill(255, 100, 100);
  ellipse(e1.x, e1.y, 20, 20);

  noStroke();
  fill(100, 255, 100);
  ellipse(e2.x, e2.y, 20, 20);
  
  noStroke();
  fill(100, 100, 255);
  ellipse(e3.x, e3.y, 20, 20);

  //end homework code here//
}

void drawAtomBG() {
  noStroke();
  fill(255);
  ellipse(200, 200, 50, 50);
  noFill();
  strokeWeight(5);

  pushMatrix();
  translate(200, 200);
  stroke(255, 100, 100);
  ellipse(0, 0, 300, 100);
  popMatrix();


  pushMatrix();
  translate(200, 200);
  rotate(PI/1.5);
  stroke(100, 255, 100);
  ellipse(0, 0, 300, 100);
  popMatrix();

  pushMatrix();
  translate(200, 200);
  rotate(PI/3);
  stroke(100, 100, 255);
  ellipse(0, 0, 300, 100);
  popMatrix();
}



