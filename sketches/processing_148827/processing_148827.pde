
float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;
 
void setup() {
  size (600, 600);
  smooth();
  background(255);
  frameRate(20);
}
 
void draw () {
 
  if (backGround) {
    fill(#eeeeee, 30);
    stroke(0, 100);
  }
  if (!backGround) {
    fill(0, 30);
    stroke(255, 50);
  }
  rect(0, 0, width, height);
  if (switchStroke) stroke(18, 31, 37);
  if (!switchStroke) stroke(255);
   
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(random(255));
  noStroke();
  ellipse (mouseX, mouseY,80,80);
  ellipse(mouseX-50, mouseY-50, 45, 45);
  ellipse(mouseX+50, mouseY-50, 45, 45);
  fill(#ff0000);
  noStroke();
  rect (mouseX-47, mouseY+60, 100, 45);
  fill(255);
  noStroke();
  ellipse(mouseX-20, mouseY+82, 15, 25);
  ellipse(mouseX+22, mouseY+82, 15, 25);
  fill(#ffe400);
  ellipse(mouseX-40, mouseY+140, 65,45);
  ellipse(mouseX+40, mouseY+140, 65,45);
  fill(255);
  line(mouseX, mouseY, xLast, yLast);
 
  xLast=pmouseX;
  yLast=pmouseY;
  title();
}
 
void title() {
  fill(127);
  textAlign(RIGHT);
  text("KIM Hyemi, Mickey, Dynamic Media, 2014", width-50, height-20);
}
 
void keyPressed() {
 
  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
  if (key=='1') switchStroke = !switchStroke;
}

