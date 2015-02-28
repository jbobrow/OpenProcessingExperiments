
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Hyebin
// ID: 201420081
import ddf.minim.*;

Minim minim;
AudioInput input;
AudioRecorder recorder;

float xLast;
float yLast;
boolean backGround = true;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
float x, x2;
float y, y2;

float d;
// -------------------------------------------- 
void setup() {
 //size(1280,720);
  size(displayWidth, displayHeight);
  smooth();
  noCursor();
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  recorder = minim.createRecorder(input, "audio/##.wav", true);

}


// -------------------------------------------- 
void draw() {
  //if necessary change the file format from *.tif to *.jpg or *.png
 saveFrame("frames/######.tif"); 
  float m = input.mix.level() * 500;
  d = d*0.9+m*0.9;

  if (backGround) background(#FFFFA1);
  if (!backGround) background(#eeeeee);
  if (switchStroke) stroke(0);
  if (!switchStroke) stroke(255);
  // -------------------------------------------- 
  x = lerp(x, mouseX, 0.05);
  y = lerp(y, mouseY, 0.05);
  x2 = lerp(x2, mouseX, 0.01);
  y2 = lerp(y2, mouseY, 0.01);

strokeWeight(2);
  stroke(#FFA7A7);  
  line(x, y, x2, y2);
  fill(255, 50);
  ellipse(x, y, d, d);
  fill(255);
  ellipse(x2, y2, d, d);
  stroke(#F361A6);
  noFill();
  ellipse(x, y, d, d);
  ellipse(x, y, d*1.5, d*1.5);

  noStroke();
  fill(#FF85CA, 30);
  ellipse(x2, y2, d/4, d/4);
  stroke(#FF85CA);

  ellipse(x2, y2, d/2, d/2);

  stroke(#FF85CA);

  line(x2, y2, xLast, yLast);
  xLast=x;
  yLast=y;  
  title();
  
  if(!backGround){
    strokeWeight(4);
  noCursor();
  stroke(255);
  line(x, y, x2, y2);
  fill(#FFFFA1);
  ellipse(x, y, d, d);
  ellipse(x2, y2, d, d);
  ellipse(x, y, d*1.5, d*1.5);
  fill(#FFFFA1,30);
  ellipse(x, y2, d/4, d/4);
  ellipse(x2, y2, d/2, d/2);
  line(x2, y2, xLast, yLast);
  }
}
// --------------------------------------------  

void title() {
  fill(127);
  text("PARK Hyebin, Ellipse, Dynamic Media, 2014", width-300, height-35);
  textAlign(LEFT);
  text("TAB background", width-1300, height-35);

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

