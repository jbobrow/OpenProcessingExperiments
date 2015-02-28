
/*
Konkuk University
SOS iDesign
  
Name: Gwang il Lee
ID: 201420094
  
*/

float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;
 
 
void setup() {
  size(600, 600);
  smooth();
  background(0);
  frameRate(5);
}
 
void draw() {
  rectMode(CENTER);
  noStroke();
  fill(#FFEAAF);
 
  if (backGround) background(18, 31, 37);
  if (!backGround) background(255);
 
   
   
  ellipseMode(CENTER);
  ellipse(mouseX+10, mouseY+10, 50, 50);
  ellipse(mouseX-10, mouseY-10, 15, 15);
  ellipse(mouseX, mouseY, 30, 30);
  fill(#CCC9FF);
  stroke(255, 60);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(#E0FFAA);
  noStroke();
  fill(#FFAAC8);
  rect(xLast, yLast,70,30);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
  }
 
 
 
void title() {
  fill(127);
  textAlign(RIGHT);
  text("Gwang il Lee , Untitled, Dynamic Media, 2014", width-50, height-20);
}
 
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");
 
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
 
  if (key=='1') switchStroke = !switchStroke;
 
  /*
   // Variable xPos and yPos in the code above required.
   if (keyCode==UP) yPos += 0.1;
   if (keyCode==DOWN) yPos -= 0.1;
   if (keyCode==LEFT) xPos += 0.1;
   if (keyCode==RIGHT) xPos -= 0.1;
   */
  if (keyCode==TAB) backGround = !backGround;
}

