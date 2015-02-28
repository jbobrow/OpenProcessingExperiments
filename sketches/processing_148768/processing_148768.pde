
float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;


void setup() {
  size(600, 600);
  smooth();
  background(100);
  frameRate(10);
}

void draw() {
  rectMode(CENTER);
  noStroke();
  fill(150, 20, 0, 50);

  if (backGround) background(50,40,10);
  if (!backGround) background(100);

  
  
  rectMode(CENTER);
  rect(mouseX+10, mouseY+10, 30, 15);
  rect(mouseX-10, mouseY-10, 15, 15);
  rect(mouseX, mouseY, 30, 30);
  fill(200, 30, 100, 15);
  stroke(230, 40);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(250, 255, 40, 20);
  stroke(255);
  rect(mouseX, mouseY, xLast, yLast);
  rect(xLast, yLast, mouseX+30, mouseY+50);
  rect( mouseX+30, mouseY+50, mouseX+30, mouseY+30);
  noStroke();
  fill(100,150,30,50);
  rect(xLast, yLast,15,15);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
  }



void title() { 
  fill(50);
  textAlign(RIGHT);
  text("JANG Jinseon, WOW , Dynamic Media, 2014", width-5, height-10);
}

void keyPressed() {
  
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='0') switchStroke = !switchStroke;

  if (keyCode==TAB) backGround = !backGround;
}
