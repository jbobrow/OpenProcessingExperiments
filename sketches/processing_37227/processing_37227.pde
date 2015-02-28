
//noid

float noidX;
float noidY;

float tailR;
float tailG;
float tailB;

float eyeRad;
float eyeR;
float eyeG;
float eyeB;

void setup() {
  size(200, 200);
  noidX = width/2;
  noidY = height + 1;
}


void draw() {
  background(255);

  //body
  fill(255, 83, 3, 127);
  ellipse(noidX, noidY, 100, 30);

  //eye
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR, eyeG, eyeB);
  ellipse(noidX-35, noidY, eyeRad, eyeRad);

  //mouth
  stroke(0, 100, 0);
  line(noidX-35, noidY+10, noidX-25, noidY+6);

  //tail
  stroke(0);
  
  tailR = random(255);
  tailG = random(255);
  tailB = random(255);
  
  fill(mouseX, 10, mouseY);
  triangle(noidX+50, noidY, noidX+60, noidY-15, noidX+60, noidY+5);

  //legs
  line(noidX-15, noidY+15, noidX-25, noidY+50);
  line(noidX+25, noidY+15, noidX+45, noidY+50);

  //feet
  fill(255, 255, 0);
  rect(noidX-30, noidY+50, 5, 3);
  rect(noidX+40, noidY+50, 5, 3);
  
  noidY = random(200);
 noidX = random(200);
 eyeRad = random(200);
 
}

/*void keyPressed() {
  fill(255, 0, 0);
  ellipse(mouseX-35, mouseY, 15, 15);
}
*/


