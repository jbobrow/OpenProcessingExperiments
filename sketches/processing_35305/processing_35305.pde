
float incr = 0;
float rot = PI/2;
int x = 100;
int y = 100;
float z = 0.01;

void setup() {
  size(700, 400);
  background(255);
  //  stroke(6);

  /*
  rect(325,175,50,50);
   
   pushMatrix();
   translate(325,175);
   rotate(radians(45));
   fill(0);
   rect(325,175,50,50);
   popMatrix();
   */
}

void draw() {
  pushMatrix();
  background(255);
  translate(width/2, height/2);
  rotate(rot);
  rect(-x/2, -y/2, x, y);
  popMatrix();
  rot = rot + incr;

  if (mousePressed == true) {
    incr = z;
  }
  else {
    incr = 0;
  }
}

/*void mousePressed() {
  if (incr == 0) {
    incr = 0.01;
  }
  else {
    incr = 0;
  }
}
*/
//dist function
//dist between two point is less than buffer zone

