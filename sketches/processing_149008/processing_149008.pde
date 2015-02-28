
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// CHOI Jihye
// 201420116
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// CHOI Jihye
// 201420116


float x = 0;
float y = 0;
float xSpeed = 3;
float ySpeed = 2;

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

// -------------------------------------------- 
void setup() {
  size(600, 600);  
  smooth();
  background(255);
  title();
}

// -------------------------------------------- 
void draw() {


  x = x + xSpeed;
  y= y + ySpeed;


  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }

  if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }
  stroke(0);
  strokeWeight(2);
  noFill();
  quad (mouseX, mouseY, x, y, mouseX, mouseY, pmouseX, pmouseY);
}

// -------------------------------------------- 
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='1') switchStroke = !switchStroke;
  if (keyCode==TAB) backGround = !backGround;
}
void title() { 
  fill(127);
  textAlign(RIGHT);
  text("CHOI Jihye, untitled, Dynamic Media, 2014", width-50, height-20);
}

