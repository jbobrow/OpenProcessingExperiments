
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Joo HEe
// ID: 201420114

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

import ddf.minim.*;
 
Minim minim;
AudioInput input;
 
 
float P;
float xoff;

PImage img;

void setup () {
  size(600, 600, P3D);
  background(#D1E3FF);
  minim = new Minim(this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw () {
   
   if (backGround) background(#14212C);
  if (!backGround) background(#D1E3FF);

  
 float mic = input.mix.level()*1000;
  P = P*0.9 + mic*0.8;
    
  if (switchStroke) stroke(#9B0329);
  if (!switchStroke) stroke(#384583);

  ambientLight(255, 3, 3);
  lights();
 
  for (int i=50; i< width; i+=50) {
    for (int j=50; j< height; j+=50){
      xoff += 0.001;
      float n = noise(xoff)*50;
      float dia = dist(mouseX, P,mouseY, n);
      
      noFill();
      pushMatrix();
      translate(i, j, -200);
      rotate(radians(P));
      box(-n,dia,P);
      popMatrix();
    }
  }
 
  title();
}
void title() {
  fill(127);
  textAlign(RIGHT);
  text("CHOI Joo Hee, untitled, Dynamic Media, 2014", width-50, height-20);
  textAlign(LEFT);
  text("press TAB", width-580, height-20);
}

void keyPressed() {
  if (key=='s') saveFrame("images/frame_#####.jpg");
 
 
  if (key=='q') onOff = !onOff;
  if (onOff) loop();  
  if (!onOff) noLoop();
  if (key==TAB) switchStroke = !switchStroke;
  if (keyCode==TAB) backGround = !backGround;
}
