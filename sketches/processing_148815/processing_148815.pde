
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
}

void draw () {

  if (backGround) {
    fill(#eeeeee, 30);
    stroke(0, 50);
  }
  if (!backGround) {
    fill(0, 30);
    stroke(255, 50);
  }
  rect(0, 0, width, height);
  if (switchStroke) stroke(0);
  if (!switchStroke) stroke(255);

  line(mouseX, mouseY, pmouseX, pmouseY);

  fill(255);
  line(mouseX, mouseY, xLast, yLast);
  fill(0);
  strokeWeight(2);
  line(mouseY, mouseX, yLast, xLast);
  fill(255);
  ellipse(mouseY+5, mouseX, 15, 10);
  ellipse(mouseY-5, mouseX, 15, 10);
  fill(250, 238, 0);
  ellipse(mouseY, mouseX, 10, 20);
  fill(random(255));
  ellipse(mouseY-5, mouseX-10, 5, 5);
  ellipse(mouseY+5, mouseX-10, 5, 5);
  fill(0);
  ellipse(mouseY, mouseX, 8, 1);
  ellipse(mouseY, mouseX-5, 8, 1);
  ellipse(mouseY, mouseX+5, 8, 1);

  fill(255);
  ellipse (mouseX-10, mouseY+10, 30, 30);
  ellipse (mouseX+10, mouseY-10, 30, 30);
  ellipse (mouseX+10, mouseY+10, 30, 30);
  ellipse (mouseX-10, mouseY-10, 30, 30);
  fill(206, 10, 10);
  ellipse (mouseX, mouseY, 20, 20);

  xLast=pmouseX;
  yLast=pmouseY;
  title();
}

void title() { 
  fill(127);
  textAlign(RIGHT);
  text("JooYongGill, Flower and Bug, Dynamic Media, 2014", width-50, height-20);
}

void keyPressed() {

  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
  if (key=='1') switchStroke = !switchStroke;
}

