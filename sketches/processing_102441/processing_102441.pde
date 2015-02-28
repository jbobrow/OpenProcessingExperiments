
// For AdditiveBlending Mode - http://www.flight404.com/blog/?p=71
// Inspired in - http://code.google.com/creative/radiohead/ (We don't use this code)
// CheatScreen from Processing Example - HSVSpace (Video Library)
// 3D Reference - http://andybest.net/2008/07/3d-webcam-lines/
// & http://createdigitalmotion.com/2008/11/ruttetra-visual-synth-as-software-etras-legacy-needs-your-support/ 
// 
//Libraries, all of them are included in Processing except for the commented fullscreen class
import processing.opengl.*;
import processing.video.*;
import javax.media.opengl.*;
//import fullscreen.*; 

//FullScreen fs; 

Capture video;
PGraphicsOpenGL pgl;
GL gl;
float leftRightAngle;
float upDownAngle;
float fwdBackTrans;
boolean motion;
int mode;
int multIntensity;

boolean cheatScreen = false;

void setup() {
  
  size(1280, 720, OPENGL);
  // Create the fullscreen object
  // fs = new FullScreen(this); 

  // enter fullscreen mode
  // fs.enter(); 

  leftRightAngle = 180;
  upDownAngle = -180;
  fwdBackTrans = 200;
  multIntensity = 2;

  motion = false;
  mode = 2;

  pgl = (PGraphicsOpenGL) g;

  gl = pgl.gl;

  frameRate(24);

  hint(ENABLE_OPENGL_4X_SMOOTH);

  video = new Capture(this, width, height, 24);
  
  
}

void draw() {
  
  pgl.beginGL();
  
  gl.glDisable(GL.GL_DEPTH_TEST);
  
  gl.glEnable(GL.GL_BLEND);
  
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);

  //println("leftRightAngle is equal to " +   leftRightAngle);
  //println("upDownAngle is equal to " +   upDownAngle);
  

  int pointer = 0;

  noFill();
  lights();
  strokeWeight(2);

  video.read();
  video.loadPixels();
  background(0);  

 
  pushMatrix();

  translate(width, height, + fwdBackTrans);

  rotateY(radians(+ leftRightAngle));
  rotateX(radians(+ upDownAngle));


  translate(-width, -height, + fwdBackTrans);


  for (int i = 0; i < video.height; i += 3) {
    beginShape();

    for (int j = 0; j < video.width; j ++) {

      int intensity = video.pixels[j+(i*video.width)];

      stroke(red(intensity), green(intensity), blue(intensity), 255);

// 
      if (mode == 0) {
        vertex (j*2, i*2, (hue(intensity)*multIntensity)-100);
      }
      if (mode == 1) {
        vertex (j*2, i*2, (saturation(intensity)*multIntensity)-100);
      }
      if (mode == 2) {
        vertex (j*2, i*2, (brightness(intensity)*multIntensity)-100);
      }
      pointer++;
    }

    endShape();
  }

  pgl.endGL();

  popMatrix();

// Auto Rotate
  if (motion) {
    upDownAngle--;
    leftRightAngle--;
  }
  
// Cheat Screen
  if (cheatScreen) {
    image(video, 0, height - video.height, 130, 100);
  }
}

void mouseDragged() {
  
  //Mouse control 
  
  float dX, dY;

  switch (mouseButton) {
  case LEFT:  
    dX = pmouseX - mouseX;
    dY = pmouseY - mouseY;
    leftRightAngle -= dX * 0.2;
    upDownAngle += dY * 0.4;
    break;

  case RIGHT:  
    dY = (float) (pmouseY - mouseY);
    fwdBackTrans -= 1 * dY;
    break;
  }
}

void keyPressed() {
  
  // Keyboard movement. 
  
  switch (key) {
  case 'g': 
    saveFrame(); 
    break;
  case 'c': 
    cheatScreen = !cheatScreen; 
    break;
  case 'r': 
    motion = !motion; 
    break;
  case '+': 
    fwdBackTrans += 1; 
    break;
  case '1': 
    leftRightAngle = 178;
    upDownAngle = -270; 
    break;

  case '2': 
    leftRightAngle = 124;
    upDownAngle = -304; 
    break;

  case '3': 
    leftRightAngle = -3;
    upDownAngle = -333; 
    break;

  case '4': 
    leftRightAngle = -46;
    upDownAngle = -172; 
    break;

  case '5': 
    leftRightAngle = 360;
    upDownAngle = -295; 
    break;

  case '0': 
    leftRightAngle = 360;
    upDownAngle = -360; 
    break;

  case 'i': 
    multIntensity ++;
    break;

  case 'I': 
    multIntensity --;
    break;
    
  case 'm': 
    mode++;
    if (mode > 2) {
      mode = 0;
    }
    break;
      case 's': 
      saveFrame("line-####.tif");

    break;

  }
}


