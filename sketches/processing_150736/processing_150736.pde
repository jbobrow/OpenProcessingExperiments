
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Hyebin
// ID: 201420081

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

import ddf.minim.*;

Minim minim;
AudioInput input;


float P;
float xoff;
// -------------------------------------------- 
void setup() {
  size(600, 600, P3D);
  minim = new Minim(this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {
  if (backGround) background(#FFFFFF);
  if (!backGround) background(255);

  if (switchStroke) stroke(255);
  if (!switchStroke) stroke(0);

  float mic = input.mix.level()*500;
  P = P*0.9 + mic*0.8;

  background(#000000);
  lights();

  for (int i=0; i< width; i+=50) {
    for (int j=0; j< height; j+=30) {
      xoff += 0.001;
      float n = noise(xoff)*500;

      pushMatrix();
      noFill();  
      stroke(#FFFFFF);
      translate(i, j, -300);
      //rotateX(radians(P));
      //rotateY(radians(P));
      rotate(radians(30));
      box(50, 50, -n); 
      popMatrix();
    }
  }

  if (!backGround) { 
    background(255);

    for (int i=0; i< width; i+=50) {
      for (int j=0; j< height; j+=30) {
        float n = noise(xoff)*500;

        pushMatrix();
        stroke(0);  
        noFill();
        translate(i, j, -300);
        //rotateX(radians(P));
        //rotateY(radians(P));
        rotateX(radians(P));
        rotateY(radians(P));
        box(100, 100, 100);
        popMatrix();
      }
    }
  }

  title();
}

// -------------------------------------------- 
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) loop();

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
// -------------------------------------------- 
void title() { 
  fill(127);
  textAlign(RIGHT);
  text("PARK Hyebin, Untitled, Dynamic Media, 2014", width-40, height-20);
  textAlign(LEFT);
  text("TAB background", width-580, height-20);
}

