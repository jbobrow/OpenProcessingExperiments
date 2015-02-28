
/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: MinKyung Kim
 ID: 201420065
 */

float xLast;
float yLast;

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

void setup() {
  size(800, 600);
  smooth();
  background(#fbe8bd);  
  frameRate(15);
}

void draw() {

  noStroke();
  if (backGround) {
    fill(#fbe8bd, 30);
    stroke(#25363e, 50);
    strokeWeight(2);
  }
  if (!backGround) {
    fill(#a2774c, 30);
    stroke(#7e5535, 100);
    strokeWeight(2);
  }
  rect (0, 0, width, height);
  line(mouseX, mouseY, pmouseX, pmouseY);
  bezier(mouseX, mouseY, 0, 0, width, height, pmouseX, pmouseY);
  bezier(mouseX, mouseY, width, 0, 0, height, xLast, yLast);
  line(mouseX, mouseY, xLast, yLast);
  fill(#25363e, 150);
  ellipse(mouseX, mouseY, 20, 20);

  xLast = pmouseX;
  yLast = pmouseY;
  title();
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

void title() {

  fill(#25363e, 50);
  textAlign(RIGHT);
  text("Minkyung KIM, flower, Dynamic Media, 2014", width-50, height-20);
}

