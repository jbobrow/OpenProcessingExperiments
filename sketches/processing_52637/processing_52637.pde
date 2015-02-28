
float circleX = 400;
float circleY = 400;

float eyeR;
float eyeG;
float eyeB;

float cubeX;
float cubeY;


void setup() {
  size(900, 900);
  smooth();
  background(14);
}

void draw () {
  smooth();

  cubeX = mouseX;
  cubeY = mouseY;
  //cubeX = cubeX+100;
  //cubeY = cubeY+100;
  println(cubeX);

  eyeR = random(mouseX);
  eyeG = random(mouseY);
  eyeB = random(255);

  strokeWeight(1);

  stroke(eyeR, eyeG, eyeB);
  line(100, 100, cubeX, cubeY);
  line(100, 200, cubeX, cubeY);
  line(100, 300, cubeX, cubeY);
  line(100, 400, cubeX, cubeY);
  line(100, 500, cubeX, cubeY);
  line(100, 600, cubeX, cubeY);
  line(100, 700, cubeX, cubeY);
  line(100, 800, cubeX, cubeY);
  line(200, 100, cubeX, cubeY);
  line(200, 200, cubeX, cubeY);
  line(200, 300, cubeX, cubeY);
  line(200, 400, cubeX, cubeY);
  line(200, 500, cubeX, cubeY);
  line(200, 600, cubeX, cubeY);
  line(200, 700, cubeX, cubeY);
  line(200, 800, cubeX, cubeY);
  line(300, 100, cubeX, cubeY);
  line(300, 200, cubeX, cubeY);
  line(300, 300, cubeX, cubeY);
  line(300, 400, cubeX, cubeY);
  line(300, 500, cubeX, cubeY);
  line(300, 600, cubeX, cubeY);
  line(300, 700, cubeX, cubeY);
  line(300, 800, cubeX, cubeY);
  line(400, 100, cubeX, cubeY);
  line(400, 200, cubeX, cubeY);
  line(400, 300, cubeX, cubeY);
  line(400, 400, cubeX, cubeY);
  line(400, 500, cubeX, cubeY);
  line(400, 600, cubeX, cubeY);
  line(400, 700, cubeX, cubeY);
  line(400, 800, cubeX, cubeY);
  line(500, 100, cubeX, cubeY);
  line(500, 200, cubeX, cubeY);
  line(500, 300, cubeX, cubeY);
  line(500, 400, cubeX, cubeY);
  line(500, 500, cubeX, cubeY);
  line(500, 600, cubeX, cubeY);
  line(500, 700, cubeX, cubeY);
  line(500, 800, cubeX, cubeY);
  line(600, 100, cubeX, cubeY);
  line(600, 200, cubeX, cubeY);
  line(600, 300, cubeX, cubeY);
  line(600, 400, cubeX, cubeY);
  line(600, 500, cubeX, cubeY);
  line(600, 600, cubeX, cubeY);
  line(600, 700, cubeX, cubeY);
  line(600, 800, cubeX, cubeY);
  line(700, 100, cubeX, cubeY);
  line(700, 200, cubeX, cubeY);
  line(700, 300, cubeX, cubeY);
  line(700, 400, cubeX, cubeY);
  line(700, 500, cubeX, cubeY);
  line(700, 600, cubeX, cubeY);
  line(700, 700, cubeX, cubeY);
  line(700, 800, cubeX, cubeY);
  line(800, 100, cubeX, cubeY);
  line(800, 200, cubeX, cubeY);
  line(800, 300, cubeX, cubeY);
  line(800, 400, cubeX, cubeY);
  line(800, 500, cubeX, cubeY);
  line(800, 600, cubeX, cubeY);
  line(800, 700, cubeX, cubeY);
  line(800, 800, cubeX, cubeY);
  
}

////conditionals
//if (mouseX>width/2){
//  eyeR = eyeR+1;
//  eyeG = eyeG;
//  eyeB = eyeB;}
//  else{
//  eyeR = 0;
//  eyeG = 0;
//  eyeB = 0;}
  
//  if (mouseY>height/2){
//  eyeR = eyeR;
//  eyeG = eyeG+1;
//  eyeB = eyeB;}
//  else{
//  eyeR = 0;
//  eyeG = 0;
//  eyeB = 0;}
  
//    if (mousePressed){
//  eyeR = eyeR;
//  eyeG = eyeG;
//  eyeB = eyeB+1;}
//  else{
//  eyeR = 0;
//  eyeG = 0;
//  eyeB = 0;}

void mousePressed() {
  background(0);
  cubeY = cubeY+900;
}

void keyPressed() {
  background(255);
}



////////////////////////////////////////////////////////////////////////////
//  eyeR = random(255);
//  eyeG = random(255);
//  eyeB = random(255);
//  fill((abs(mouseY-pmouseY)),(abs(mouseY-pmouseY)),(abs(mouseY-pmouseY)));

//  rect(circleX,circleY,circleY+10,circleY-10);

//  circleX = mouseX;
//  circleY = mouseY+6;

//   smooth();
//  eyeR = random(255);
//  eyeG = random(255);
//  eyeB = random(255);
//  fill((abs(mouseY-pmouseY)),(abs(pmouseY-mouseY)),(abs(mouseY-pmouseY)));
//  rect(circleX,circleY,(abs(mouseY-pmouseY)),(abs(mouseY-pmouseY)));
//  }
////////////////////////////////////////////////////////////////////////////


