
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name:Hong Jiyae
// ID:201420117

float xSpeed = 5;
float ySpeed = 4;
float xSpeed2 = 4;
float ySpeed2 = 3;
float xSpeed3 = 3;
float ySpeed3 = 4;
float xSpeed4 = 2;
float ySpeed4 = 3;
float xSpeed5 = 2;
float ySpeed5 = 1;
float x=200;
float y=200;
float x2=500;
float y2=500;
float x3=300;
float y3=300;
float x4=500;
float y4=300;
float x5=900;
float y5=500;

float dia;

boolean switchFill1 = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

// ==========================================
void setup() {
  size (600,600);
  smooth();
}

// ==========================================
void draw() {
  //background(#eeeeee);

  noStroke();
  if (backGround) fill(#eeeeee, 100);
  if (!backGround) fill(0, 100);
  rect(0, 0, width, height);

  float dia=width/4;

  x=x+xSpeed;
  y=y+ySpeed;
  x2+=xSpeed2;
  y2+=ySpeed2;
  x3+=xSpeed3;
  y3+=ySpeed3;
  x4+=xSpeed4;
  y4+=ySpeed4;
  x5+=xSpeed5;
  y5+=ySpeed5;

  if ((x > width-dia/2) || (x < dia/2)) { 
    xSpeed = xSpeed * -1;
  } 
  if ((y > height-dia/2) || (y < dia/2)) { 
    ySpeed = ySpeed * -1;
  } 
  if ((x2 > width-dia/2) || (x2 < dia/2)) { 
    xSpeed2 *= -1;
  } 
  if ((y2 > height-dia/2) ||(y2 < dia/2)) { 
    ySpeed2 *= -1;
  } 
  if ((x3 > width-dia/2) || (x3 < dia/2)) { 
    xSpeed3 *= -1;
  } 
  if ((y3 > height-dia/2) ||(y3 < dia/2)) { 
    ySpeed3 *= -1;
  } 
  if ((x4 > width-dia/2) || (x4 < dia/2)) { 
    xSpeed4 *= -1;
  } 
  if ((y4 > height-dia/2) ||(y4 < dia/2)) { 
    ySpeed4 *= -1;
  } 
  if ((x5 > width-dia/2) || (x5 < dia/2)) { 
    xSpeed5 *= -1;
  } 
  if ((y5 > height-dia/2) ||(y5 < dia/2)) { 
    ySpeed5 *= -1;
  } 

  if (mousePressed) {
    float lerpVar = 0.1;
    x=lerp(x, mouseX, lerpVar);
    y=lerp(y, mouseY, lerpVar);
    x2=lerp(x2, mouseX, lerpVar);
    y2=lerp(y2, mouseY, lerpVar);
    x3=lerp(x3, mouseX, lerpVar);
    y3=lerp(y3, mouseY, lerpVar);
    x4=lerp(x4, mouseX, lerpVar);
    y4=lerp(y4, mouseY, lerpVar);
    x5=lerp(x5, mouseX, lerpVar);
    y5=lerp(y5, mouseY, lerpVar);
  }

  x = constrain(x, dia/2, width-dia/2);
  y = constrain(y, dia/2, height-dia/2);
  x2 = constrain(x2, dia/2, width-dia/2);
  y2 = constrain(y2, dia/2, height-dia/2);
  x3 = constrain(x3, dia/2, width-dia/2);
  y3 = constrain(y3, dia/2, height-dia/2);
  x4 = constrain(x4, dia/2, width-dia/2);
  y4 = constrain(y4, dia/2, height-dia/2);
  x5 = constrain(x5, dia/2, width-dia/2);
  y5 = constrain(y5, dia/2, height-dia/2);


  //big ellipses
  noStroke();
  fill(72, 102, 34, 100);
  fill(#d11313, 50);
  ellipse(x, y, dia, dia);
  ellipse(x2, y2, dia, dia);
  ellipse(x3, y3, dia, dia);
  ellipse(x4, y4, dia, dia);
  ellipse(x5, y5, dia, dia);

  //triangle
  if (backGround) stroke(0);
  if (!backGround) stroke(255);
  strokeWeight(1);
  //noStroke();
  if (backGround) fill(0, 30);
  if (!backGround) fill(255, 30);
  //fill(72, 102, 34, 100);
  triangle(x, y, x2, y2, x3, y3);
  triangle(x, y, x3, y3, x4, y4);
  triangle(x, y, x4, y4, x5, y5);
  triangle(x, y, x5, y5, x3, y3);
  triangle(x, y, x2, y2, x5, y5);
  triangle(x, y, x2, y2, x4, y4);

  title();
  legend();
}

// ==========================================
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='1') switchFill1 = !switchFill1;
  /* 
   // Variable xPos and yPos in the code above required.
   if (keyCode==UP) yPos += 0.1;
   if (keyCode==DOWN) yPos -= 0.1;
   if (keyCode==LEFT) xPos += 0.1;
   if (keyCode==RIGHT) xPos -= 0.1;
   */
  if (keyCode==TAB) backGround = !backGround;
}


void title() { 
  fill(127);
  textAlign(RIGHT);
  text("HONG Jiyae, space.color.motion, Dynamic Media, 2014", width-50, height-20);
}

void legend() { 
  fill(100);
  textAlign(LEFT);
  text("TAB background | SPACE pause/start", 50, height-20);
}



