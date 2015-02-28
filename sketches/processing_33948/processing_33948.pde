
float rot = PI/3;
int x = 100;
int y = 100;

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

  rot = rot + 0.01;
}

