
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

  if (backGround) background(#2CF5BA);
  if (!backGround) background(255);

  
  
  rectMode(CENTER);
  rect(mouseX+50, mouseY+45, 20, 20);
  rect(mouseX-30, mouseY-20, 30, 30);
  rect(mouseX, mouseY, 30, 30);
  fill(#FA72C8);
  stroke(255, 80);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(#8ACEF0);
  stroke(255);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, xLast, yLast);
  ellipse(xLast, yLast, mouseX+60, mouseY+60);
  ellipse( mouseX+60, mouseY+60, mouseX+70, mouseY+70);
  noStroke();
  fill(#FAEE95);
  rect(xLast, yLast,30,30);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
  }



void title() { 
  fill(127);
  textAlign(RIGHT);
  text("CHAE Seo Rin, Dynamic Media, 2014", width-50, height-20);
}

void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='3') switchStroke = !switchStroke;

  /* 
   // Variable xPos and yPos in the code above required.
   if (keyCode==UP) yPos += 0.2;
   if (keyCode==DOWN) yPos -= 0.1;
   if (keyCode==LEFT) xPos += 0.3;
   if (keyCode==RIGHT) xPos -= 0.4;
   */
  if (keyCode==SHIFT) backGround = !backGround;
}
