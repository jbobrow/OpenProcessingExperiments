
float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;
   
void setup() {
  size (600, 600);
  smooth();
    frameRate(5);
}

void draw() {
  if (backGround)
  if (!backGround) background(100);
  fill(255, 30);
   
   
  ellipseMode(CENTER);
  ellipse(mouseX+50, mouseY+10, 30, 30);
  fill(0,120,90);
  ellipse(mouseX, mouseY, xLast, yLast);
  noFill();
  ellipse(mouseX, mouseY, 10,30);

  line(mouseX, mouseY, pmouseX, pmouseY);
   fill(255);
  
  fill(250, 255, 40, 20);
  noStroke();
  fill(255);
  
  fill(255);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
  }
 
 
 
void title() {
  fill(255);
  textAlign(RIGHT);
  text("SoJung YUN , Bing , Dynamic Media, 2014", width-30, height-10);
}
 
void keyPressed() {
   
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
  if (key=='0') switchStroke = !switchStroke;
}


