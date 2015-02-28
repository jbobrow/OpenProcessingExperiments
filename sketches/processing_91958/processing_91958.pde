
float x = 50;
float speed = 1.0;
float body = 10.0;
int i = 255;


void setup() {
  size(500, 200, P3D);
}

void draw() {
  background(60,20,100);
  translate(x, height/2, 0);
  x = x + speed;
  if (x > width + body)
  {
    x = -body;
  }

  rotateY(radians(((mouseX/(float)width)*180)-90));
  noStroke();
  lights();

  //---------------------------------------------------------------
  //body
  pushMatrix();
  scale(1, 2, .5);
  fill(100, 80);
  box(50);
  popMatrix();

  translate(0, -75, 0);

  //---------------------------------------------------------------
  //head
  pushMatrix();
  scale(.8, .6, .5);
  fill(200);
  box(50);
  popMatrix();

  translate(-10, 150, 0);

  //---------------------------------------------------------------
  //left leg
  pushMatrix();
  scale(.3, .8, .3);
  fill(250, 200, 100);
  rotateY(radians(frameCount*-1));
  box(50);
  popMatrix();

  translate(20, 0, 0);

  //---------------------------------------------------------------
  //right leg
  pushMatrix();
  fill(250, 200, 100);
  rotateY(radians(frameCount));
  scale(.3, .8, .3);
  box(50);
  popMatrix();


  translate(-40, -100, 0);

  //---------------------------------------------------------------
  //left hand
  pushMatrix();
  scale(1.5, .8, .5);
  fill(30, 250, 100);
  rotateY(-1.25);
  rotateX(0.8);
  rotateX(radians(((mouseY/(float)height)*45)-8));
  box(30);
  popMatrix();


  //---------------------------------------------------------------
  //right hand
  translate(60, 0, 0);
  pushMatrix();
  scale(1.5, .8, .5);
  rotateY(1.25);
  rotateX(-0.8);
  rotateX(radians(((mouseY/(float)height)*45)-8));
  fill(30, 250, 100);
  box(30);
  popMatrix();


  //---------------------------------------------------------------
  //left eye
  translate(-40, -50, 0);
  pushMatrix();

  scale(.3, .3, .9);

  fill(0, frameCount%i);
  box(30);
  popMatrix();

  translate(20, 0, 0);

  //---------------------------------------------------------------
  //righteye
  pushMatrix();
  scale(.3, .3, .9);
  fill(0, random(150, 200));
  box(30);
  popMatrix();


  //-------------------------------------------------------------------

  translate(10, 30, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(-10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(-10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(-10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(-10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(0, 30, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(0, 10, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(-40, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(20, 20, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(-10, 30, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  translate(10, 0, 0);
  pushMatrix();
  scale(.3, .3, .9);
  fill(random(255), random(255), random(255));
  box(30);
  popMatrix();

  //----------------------------------------------------------------------
}
