
/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: LIM HYUN SEUNG
 ID: 201420104
/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: LIM HYUN SEUNG
 ID: 201420104
 */

float xLast;
float yLast;
PFont font;

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

void setup() {
  size(600, 600);
  smooth();

  frameRate(29.97);
  //Font
  font = createFont("ACaslonPro-SemiboldItalic", 20);
}

void draw() {


  ///text   
  fill(100);
  textFont(font);
  text("LIM hyunseung, Untitled, Dynamic Media, 2014", 180, 550);


  if (backGround) {
    fill(255, 30);
    stroke(255, 150);
    strokeWeight(2);
  }

  quad(mouseX, mouseY, 10, 30, width, height, pmouseX, pmouseY);
  xLast = pmouseX;
  yLast = pmouseY;
}

void keyPressed() {
  if (key=='3') saveFrame("HYUNSEUNG/frame_#####.jpg");

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='3') switchStroke = !switchStroke;

  if (keyCode== TAB) backGround = !backGround;
}


    

