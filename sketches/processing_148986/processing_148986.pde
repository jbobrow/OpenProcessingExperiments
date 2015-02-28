
/* konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name : LEE HeaRin
 ID : 201420102
 */

float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

void setup() {
  size(600,600);
  smooth();
  background(255);
  frameRate(20); 
}


void draw() {
  fill(#FFFFFF);
  noStroke();
  quad(mouseY, mouseX, 100, 150, width, height, pmouseX, pmouseY );
  xLast = pmouseX;
  yLast = pmouseY;
  fill(#000000);
  quad(mouseX, mouseY, 100, 150, width, width, pmouseX, pmouseY);
  xLast = pmouseX;
  yLast = pmouseY; 
  fill(#FFFFFF);
  quad(mouseY, mouseX, 100, 150, height, width, pmouseY, pmouseX);
  fill(#000000);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(#FFFFFF);
  line(mouseY, mouseX, pmouseY, pmouseX); 

}

void title() {
   fill(127);
   textAlign(RIGHT);
   text("LEE HaeRin, Untitled, Dynamic Media, 2014", width-50 ,height-20);
 }
 
