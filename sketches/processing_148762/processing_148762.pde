
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
  fill(255, 130, 180, 50);

  if (backGround) background(18, 31, 37);
  if (!backGround) background(255);

  
  
  ellipseMode(CENTER);
  ellipse(mouseX+10, mouseY+10, 15, 15);
  ellipse(mouseX-10, mouseY-10, 15, 15);
  ellipse(mouseX, mouseY, 30, 30);
  fill(255, 150, 100, 30);
  stroke(255, 60);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(255, 200, 100, 20);
  stroke(255);
  triangle(mouseX, mouseY, xLast, yLast, mouseX+30, mouseY+50);
  triangle(xLast, yLast, mouseX+30, mouseY+30, mouseX+30, mouseY+50);
  triangle( mouseX+30, mouseY+50, mouseX+30, mouseY+30,xLast, yLast);
  noStroke();
  fill(255,150,100,50);
  rect(xLast, yLast,30,30);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
  }



void title() { 
  fill(127);
  textAlign(RIGHT);
  text("you chahee, blossom, Dynamic Media, 2014", width-50, height-20);
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

