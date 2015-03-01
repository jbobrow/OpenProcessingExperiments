
int  ballSize, holeSize, dropSize;
float starSize; 
int sec, min;
float angle;
PVector ballPos, boxPos, holePos, dropPos, drop2Pos;
float dropSpeed, drop2Speed;
float z, y; // position for rotating tow boxes


void setup() {
  size(600, 760, P3D);

  ballSize = 30;
  holeSize = 180;
  dropSize = 20;
  angle = 0;
  holePos = new PVector (width/2, height/4);
  ballPos = new PVector (width/2, height/4, 0);
  boxPos = new PVector (width/2, height/1.8, 0);
  dropPos = new PVector (width/2 - 12, height/4);
  drop2Pos = new PVector (width/2 -12, 2*height/4);
  dropSpeed = 1.2;
  drop2Speed = 1.2;
  z = 1.8;
  y = 1.2;
}


void draw() {
  background(0);
  smooth();
  noStroke();
  sec = second();
  min = minute();

  //Drop a minute down to the box
  if (sec >= 58 ) {
    dropPos.y += dropSpeed;
    dropSpeed += 0.01;   
    fill(255);
    rect(dropPos.x, dropPos.y, dropSize, dropSize);
  }
  if (sec < 58) {
    dropPos.y = height/3;
    dropSpeed = 1.2;
  }
  
    //Drop an hour down to the lower box
  if (min == 59 ) {
    drop2Pos.y += drop2Speed;
    drop2Speed += 0.01;   
    fill(255);
    rect(dropPos.x, dropPos.y, dropSize, dropSize);
  }
  if (min < 59) {
    drop2Pos.y = height/4;
    drop2Speed = 1.2;
  }
println(dropPos);
println(dropSpeed);

  //Draw the hole
  angle += .05;
  fill(240, 140);
  ellipse(holePos.x, holePos.y, holeSize, holeSize);
  for (int i = 0; i <= holeSize/10; i++) {
    fill(0, 20);
    ellipse(holePos.x, holePos.y, i*10, i*10);
  }

  //Draw the box and rotation of box
  pushMatrix();
  fill(255);
  lights();
  translate(boxPos.x, boxPos.y, 0);
  rotateY(6.8);
  rotateX(1.3);
  rotateZ(z);
  z += .03;
  box(100);
  // println(boxPos);
  popMatrix();

  //Draw the box and rotation of box
  pushMatrix();
  fill(255);
  lights();
  translate(boxPos.x, boxPos.y+height/4+10, 0);
  rotateY(4.8);
  rotateX(1.3);
  rotateZ(y);
  y -= .01;
  box(60);
  // println(boxPos);
  popMatrix();


  //Rotation of the sphere
  ballPos.x = (60-sec) * cos(angle) + width/2;
  ballPos.y = (60-sec) * sin(angle) + height/4;
  ballPos.z -= .5;
  println(second());

  //Draw the sphere
  angle += .05;
  fill(255);
  lights();
  translate(ballPos.x, ballPos.y, 0); 
  sphere(ballSize);
}



