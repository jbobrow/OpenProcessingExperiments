
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Hyebin 
// ID: 201420081
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

float xoff;
import ddf.minim.*;

Minim minim;
AudioInput input;
AudioRecorder recorder;
void setup() {
  //size(1280, 720);
  size(displayWidth, displayHeight);
  smooth();
  background(255);

  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  recorder = minim.createRecorder(input, "audio/##.wav", true);
}

void draw() {
  if (backGround) background(#FFF29E);
  if (!backGround) background(#005766);
  if (switchStroke) stroke(#FFC19E);
  if (!switchStroke) stroke(#FFB2D9);

  float d = input.mix.level() * 750;
  xoff = xoff +0.005;
  float nx = noise(xoff)*width;

  for (int x = 50; x <=1500; x+=50) {
    for (int y = 50; y<=1000; y+=50) {                
      strokeCap(SQUARE);
      strokeWeight(6);
      stroke(#FFC19E);
      line(0, y-50, width, y-50);
    }
  }
  //H
  for (int x = 100; x <=1500; x+=50) {
    for (int y = 100; y<=x; y+=50) {
      strokeCap(SQUARE);
      strokeWeight(6);
      stroke(#FFB2D9);
      line(x-80, y-100, x-80, height);
    }
  }
  for (int x = 200; x <=1500; x+=100) {
    for (int y =200; y<=1000; y+=100) {
      fill(#B778FF);  
      noStroke();
      ellipse(x-100, y-100, d, d);
      fill(255);
      ellipse(x-100, y-100, d/2, d/2);
    }
  }
    if(!backGround){
       for (int x = 50; x <=1500; x+=50) {
    for (int y = 50; y<=1000; y+=50) {                
      strokeCap(SQUARE);
      strokeWeight(6);
      stroke(#B2EBF4);
      line(0, y-50, width, y-50);
    }
  }
  //H
  for (int x = 100; x <=1500; x+=50) {
    for (int y = 100; y<=x; y+=50) {
      strokeCap(SQUARE);
      strokeWeight(6);
      stroke(#B2CCFF);
      line(x-80, y-100, x-80, height);
    }
  }
  for (int x = 200; x <=1500; x+=100) {
    for (int y =200; y<=1000; y+=100) {
      fill(255);  
      noStroke();
      ellipse(x-100, y-100, d, d);
      fill(#6B66FF);
      ellipse(x-100, y-100, d/2, d/2);
    }
  }
    }
  title();
}
//--------------------------------------------------------------
void title() {
  fill(127);
  textAlign(RIGHT);
  text("PARK HYEBIN, Untitled, Dynamic media, 2014", width-70, height-35);
  textAlign(LEFT);
  text("TAB background", width-1350, height-35);
}
//--------------------------------------------------------------
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

