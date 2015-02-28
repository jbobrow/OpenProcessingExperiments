
float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

float x,y;

void setup() {
  size (600, 600);
  smooth();
  background(0,0,0);
}
   
void draw () { 
  if (switchStroke) stroke(18, 31, 37);
  if (!switchStroke) stroke(255);

  stroke(255);
  line(x, y, pmouseX, pmouseY);
  noStroke();
  x = lerp (x, mouseX, 0.01);
  y = lerp (y, mouseY, 0.01);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
}
void title() {
  fill(127);
  textAlign(RIGHT);
  text("Eunjin PARK, Untitled, Dynamic Media, 2014", width-50, height-20);
}
   
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (key==' ') onOff = !onOff;
  if (keyPressed == true ) {
  background(0,0,0);
  if (onOff) loop();
  if (!onOff) noLoop();
  if (key=='1') switchStroke = !switchStroke;
}
}
