
/*

 Liz Rutledge
 August 10, 2011
 Custom Functions!!!!!
 
 */



void setup() {
  size(400, 400);
  smooth();
  strokeWeight(2);
  fill(255);
}

void draw() {
  //  background(150);
  drawOrangeCircle(70, 120, 90, true);
  //white square with 2pt stroke
  drawOrangeCircle(180, 190, 200, false);

  rect(200, 80, 150, 150);
  drawOrangeCircle(mouseX, mouseY, mouseX/2, true);
}

//define your own custom function with whatever variables you want to use
// just make sure to define your data types!
void drawOrangeCircle(int circleX, int circleY, int circleWidth, boolean hasStroke) {
  //set fill orange momentarily
  fill(255, 120, 0);
  //remove stroke momentarily
  if (hasStroke) {
    stroke(0);
  }
  else {
    noStroke();
  }

  //draw circle
  ellipse(circleX, circleY, circleWidth, circleWidth);
  //replace stroke
  strokeWeight(2);
  //replace fill
  fill(255);
}


