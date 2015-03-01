
float x,y;
float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;


void setup() {
  size(displayWidth, displayHeight);
  smooth();
}

void draw() {
  rectMode(CENTER);
  noStroke();
  fill(255, 115, 82);

  if (backGround) background(227, 37, 63);
  if (!backGround) background(89, 130, 72);

  x = lerp(x, mouseX, 0.2);
  y = lerp(y, mouseY, 0.2);




  rectMode(CENTER);
  fill(250, 255, 40, 100);
  noStroke();
  rect(x, y, xLast, yLast);
  rect(xLast, height-yLast, mouseX+30, mouseY+50);
  rect(x, y, mouseX+30, mouseY+30);


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

void mousePressed(){ 
  backGround = !backGround;
}
