
/*Nafis Sabir
 Professor Calli Higgins
 HW 2.1.1*/
void setup() {
  size(800, 800);//window size
  background(0, 150, 255);//background color

  strokeWeight(9);//weight for stems
  stroke(10, 200, 0);//stem color
  line(200, 303, 200, 700);//stem 1
  line(560, 503, 560, 700);//stem 2
  line(380, 403, 380, 700);//stem 3
  noStroke();//removed stroke from flowers
  fill(0, 0, 255);//blue color for left flower
  arc(200, 200, 200, 200, 0, PI+QUARTER_PI);//left flower
  fill(146, 0, 206);//purple color for middle flower
  arc(380, 300, 200, 200, 0, PI+QUARTER_PI);//middle flower
  fill(255, 100, 255);//pink color for left flower
  arc(560, 400, 200, 200, 0, PI+QUARTER_PI);//right flower
}
void draw() {
  smooth();//pixel smoothing
}

void keyPressed() { //color change to night onvkey press
  background(25, 25, 112);//background night color
  strokeWeight(9);//weight for pads
  stroke(0, 255, 0);//pad color
  ellipse(200, 300, 140, 10);//left pad
  ellipse(380, 400, 140, 10);//middle pad
  ellipse(560, 500, 140, 10);//right pad
  noStroke();//no stroke on flowers
  fill(255, 225, 0);//yellow color for left flower
  arc(200, 200, 200, 200, 0, PI+QUARTER_PI);//left flower
  fill(255, 69, 0);//orange color for middle flower
  arc(380, 300, 200, 200, 0, PI+QUARTER_PI);//middle flower
  fill(255, 0, 0);//red color for right flower
  arc(560, 400, 200, 200, 0, PI+QUARTER_PI);//right flower
} 
void mousePressed() { //change colors to day on mouse press
  background(0, 150, 255);//background day color
  strokeWeight(9);//weight for stems
  stroke(10, 200, 0);//stem color
  line(200, 303, 200, 700);//stem 1
  line(560, 503, 560, 700);//stem 2
  line(380, 403, 380, 700);//stem 3
  noStroke();//removed stroke from flowers
  fill(0, 0, 255);//blue color for left flower
  arc(200, 200, 200, 200, 0, PI+QUARTER_PI);//left flower
  fill(146, 0, 206);//purple color for middle flower
  arc(380, 300, 200, 200, 0, PI+QUARTER_PI);//middle flower
  fill(255, 100, 255);//pink color for left flower
  arc(560, 400, 200, 200, 0, PI+QUARTER_PI);//right flower
}

void mouseMoved() {
  fill(mouseX, 0, mouseY);//color change for flowers on mouse move
  arc(200, 200, 200, 200, 0, PI+QUARTER_PI);//left flower
  arc(380, 300, 200, 200, 0, PI+QUARTER_PI);//middle flower
  arc(560, 400, 200, 200, 0, PI+QUARTER_PI);//right flower
}



//Done by Nafis Sabir



