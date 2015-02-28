
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Hyebin
// ID: 201420081

float xLast;
float yLast;
boolean backGround = true;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
float x, x2;
float y, y2;

// -------------------------------------------- 
void setup() {
  size(800, 600);
  smooth();
  background(#eeeeee, 40);
}
// -------------------------------------------- 
void draw() {
  if (backGround) background(#FFFFA1);
  if (!backGround) background(255);
  if (switchStroke) stroke(0);
  if (!switchStroke) stroke(255);
  // -------------------------------------------- 
    x = lerp(x, mouseX, 0.1);
  y = lerp(y, mouseY, 0.1);
  x2 = lerp(x2, mouseX, 0.01);
  y2 = lerp(y2, mouseY, 0.01);
  
  noCursor();
  
   stroke(#FFA7A7);  
  line(x, y, pmouseX, pmouseY);
  fill(#FF85CA);
  ellipse(x, y, 100, 100);
  fill(255);
  ellipse(x, y, 50,50);
  noFill();
  stroke(#F361A6);
  strokeWeight(3);
  ellipse(x, y, 120, 120);
  ellipse(x, y, 140, 140);
  
  noStroke();
  fill(#FF85CA);
  ellipse(mouseX, mouseY, 50,50);
  stroke(255);
  noFill();
  ellipse(mouseX, mouseY, 60, 60);
  
  
  stroke(#FF85CA);

  line(mouseX, mouseY, xLast, yLast);
  xLast=x;
  yLast=y;
  title();
}
// --------------------------------------------  

void title() {
  fill(127);
  text("PARK Hyebin, Ellipse, Dynamic Media, 2014", width-300, height-20);
}
// --------------------------------------------  
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

