
int r = 40;
float a = 50;
float x, y, z2;
float move = 0;
float dist = 100;
boolean isClicked = false;
boolean isUp = false;
float k;

void setup()
{
  size(600, 600, P3D);
}

void draw()
{
  translate(0, k, 0);

  background(237, 219, 188);

  lights();
  translate(width/2, height/2, -500);

  rotateY(radians(mouseX));


  //eyeball
  noStroke();
  fill(255);
  pushMatrix();
  translate(0, 0, 50);
  sphere(50);
  popMatrix();

  //iris
  pushMatrix();
  translate(0, 0, 78); 
  fill(252, 224, 140);
  sphere(28);
  popMatrix();

  //big white
  pushMatrix();
  translate(7.5, 7.5, 102);
  fill(255);
  sphere(4.5);
  popMatrix();

  //donggong
  pushMatrix();
  translate(0, 0, 93);
  fill(0);
  sphere(15);
  popMatrix();

  //white feather
  pushMatrix();
  translate(0, 0, 106);
  fill(255);
  sphere(4.25);
  popMatrix();

  pushMatrix();
  fill(223, 148, 157);
  ellipse(0, 0, 200, 200);
  popMatrix();

  ///////////////the pink head/////////////////


  pushMatrix();
  scale(2.5);
  lights();
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<60; z+=1) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(243, 168, 177);
      x = (r+z*1.5/2) * sin(theta);
      y = (r+z*1.5/2) * cos(theta);

      vertex(x, y, z);

      // float theta2 = radians(paul + 1);

      //x = (r+z/2) * sin(theta);
      //y = (r+z/2) * cos(theta);
      //z2 = z + 1;
      //vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();
  //////////////////////the black batchim cylinder//////

  pushMatrix();
  translate(0, 0, -50);
  scale(2.5);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<20; z++) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(70);
      x = r * sin(theta);
      y = r * cos(theta);

      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0, 0, -84);
  fill(50);
  ellipse(0, 0, 100, 100);
  popMatrix();

  //the next black batchim

  pushMatrix();
  translate(0, 0, -80);
  scale(2.5);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<15; z++) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(50);
      x = r/2 * sin(theta);
      y = r/2 * cos(theta);
      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0, 0, -50);
  fill(70);
  ellipse(0, 0, 200, 200);
  popMatrix();



  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////


  ///////Sibal makdae//////
  pushMatrix();
  lights();
  rotateX(PI/2);
  translate(0, -100, -500);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<60; z+=1) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(153, 136, 106);
      x = 20 * sin(theta);
      y = 20 * cos(theta);

      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();

  /////sibal makdae black////
  pushMatrix();
  lights();
  rotateX(PI/2);
  translate(0, -100, -440);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<10; z+=1) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(90, 90, 90);
      x = 19 * sin(theta);
      y = 19 * cos(theta);

      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();


  ////////sibal makdae orange number 2////
  pushMatrix();
  lights();
  rotateX(PI/2);
  translate(0, -100, -430);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<60; z+=1) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(153, 136, 106);
      x = 20 * sin(theta);
      y = 20 * cos(theta);

      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();

  /////sibal makdae black number2////
  pushMatrix();
  lights();
  rotateX(PI/2);
  translate(0, -100, -370);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<10; z+=1) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(90, 90, 90);
      x = 19 * sin(theta);
      y = 19 * cos(theta);

      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();

  ////numberthree/////////
  pushMatrix();
  translate(0, 270, 260);
  rotateX(-PI/3);
  numberthree();
  popMatrix();

  ////numberfour/////////
  pushMatrix();
  translate(0, 80, -340);
  rotateX(3*PI/8);
  numberthree();
  popMatrix();

  ////numberfive/////////
  pushMatrix();
  translate(0, 190, 260);
  rotateX(-PI/3);
  numberthree();
  popMatrix();

  ////numbersix/////////
  pushMatrix();
  translate(0, 0, -340);
  rotateX(3*PI/8);
  numberthree();
  popMatrix();

  ////numberfive/////////
  pushMatrix();
  translate(0, 110, 260);
  rotateX(-PI/3);
  numberthree();
  popMatrix();

  ////numbersix/////////
  pushMatrix();
  translate(0, -80, -340);
  rotateX(3*PI/8);
  numberthree();
  popMatrix();

  ////numberseven/////////
  pushMatrix();
  translate(0, 30, 260);
  rotateX(-PI/3);
  numberthree();
  popMatrix();

  ////numbereight/////////
  pushMatrix();
  translate(0, -160, -340);
  rotateX(3*PI/8);
  numberthree();
  popMatrix();

  ////numbernine/////////
  pushMatrix();
  translate(0, -50, 260);
  rotateX(-PI/3);
  numberthree();
  popMatrix();

  rotateX(-PI/2);
  translate(0, 100, 580);
  code();
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  if (mousePressed)
  {
    if (k==20) isUp = false;
    else if (k==0) isUp = true;

    if (isUp) k-=10;
    else k+=10;
  }
}


void numberthree()
{

  ////////sibal makdae orange number 3////
  pushMatrix();
  lights();
  rotateX(PI/2);
  translate(0, -100, -360);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<60; z+=1) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(153, 136, 106);
      x = 20 * sin(theta);
      y = 20 * cos(theta);

      vertex(x, y, z);
    }
  }


  endShape(CLOSE);
  popMatrix();

  /////sibal makdae black number3////
  pushMatrix();
  lights();
  rotateX(PI/2);
  translate(0, -100, -300);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<10; z+=1) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(90, 90, 90);
      x = 19 * sin(theta);
      y = 19 * cos(theta);

      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();
}



void code()
{

  //////////////////////the black batchim cylinder//////

  pushMatrix();
  translate(0, 0, -50);
  scale(2.5);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<20; z++) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(34, 133, 115);
      x = r * sin(theta);
      y = r * cos(theta);

      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0, 0, -80);
  fill(34, 133, 115);
  ellipse(0, 0, 100, 100);
  popMatrix();

  //the next black batchim

  pushMatrix();
  translate(0, 0, -80);
  scale(2.5);
  beginShape(TRIANGLE_STRIP);
  for ( float z = 0; z<15; z++) {
    for ( float paul = 0; paul<360; paul++) {
      float theta = radians(paul);
      stroke(34, 133, 115);
      x = r/2 * sin(theta);
      y = r/2 * cos(theta);
      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0, 0, -50);
  fill(39, 156, 135);
  ellipse(0, 0, 200, 200);
  popMatrix();
}



