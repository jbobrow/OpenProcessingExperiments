
void setup() {
  size(600, 600);
  background(0);
  smooth();
  
}
 int value=20;

void draw() {

  ///////////////////body
  stroke(1000);
  fill(187,150,0);
  ellipse(240,240, 350, 350);
  ////////////////
  stroke(1000);
  fill(210,160,0);
  ellipse(250, 250, 350, 350);
  //////////////////left eye
  stroke(1000);
  fill(187,150,0);
  ellipse(160, 220, 100,100);
  ///////
  stroke(1000);
  fill(255);
  ellipse(165, 225, 100,100);
  //
  stroke(1000);
  fill(value);
  ellipse(180, 200, 28, 28);
  ///
  stroke(1000);
  fill(255);
  ellipse(180, 200, 10, 10);
  ////////right eye
  stroke(1000);
  fill(180,150,0);
  ellipse(270, 220, 150,150);
  //////////
  stroke(1000);
  fill(255);
  ellipse(275, 225, 150, 150);
  //inside right
  stroke(1000);
  fill(value);
  ellipse(285, 190, 50, 50);
  /////////
  stroke(1000);
  fill(255);
  ellipse(290, 190, 25, 25);
  ////////////////////mouth
  stroke(20);
  rect(150,325,125,50, 10, 10);
  //////
}

void mouseMoved() {
  value = value + 40;
  if (value > 150) {
    value = 0;
  }
}


