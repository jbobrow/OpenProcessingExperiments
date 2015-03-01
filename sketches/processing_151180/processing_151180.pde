
/*
* Title: One rect
* Made by: @ramayac
* Inspired by this image: 
* Description: I wanted to see if I could get a sense of the animation
* found in this "loading rectangles" gif: https://31.media.tumblr.com/2db442f461864b529cabdfc27a9f07f9/tumblr_n6ukzroesr1r2geqjo1_500.gif
* Time: 2 Hours.
*/

float i = 0, t = PI, T_INC = 0.025, I_INC = 0.795;
//T_INC = 0.025, I_INC = 0.5; //try this one :)
boolean anim = true, flip = true;

PGraphics pbuff; //a second buffer to play.
PImage irect; //the white rectangle

void setup() {
  size(400, 400);
  noStroke();
  
  //stroke(255);
  //strokeWeight(1.5);
  
  frameRate(24);
  
  smooth();

  //first, I make the image of the white rectangle
  irect = createImage(50, 200, RGB);
  irect.loadPixels();
  for (int i = 0; i < irect.pixels.length; i++) {
    irect.pixels[i] = color(255);
  }
  irect.updatePixels();
  
  //setup the buffer
  pbuff = createGraphics(width, height);
}

void draw() {

  if (anim) {
    //Yeah I should be using sine
    if (flip) {
      t = t + T_INC;
      i = i + I_INC;
      if(t > 4.716) flip = false;
    } else {
      t = t - T_INC;
      i = i - I_INC;
      if(t <= PI) flip = true;
    }
  }

  rectMode(CORNER);

  //Draw on the buffer...
  pbuff.beginDraw();
  pbuff.background(0);
  pbuff.pushMatrix();
  pbuff.translate(100, 300);
  pbuff.rotate(t);
  pbuff.image(irect, i, 0);
  pbuff.popMatrix();
  pbuff.endDraw();

  //clear the background...
  background(51);

  //first transformation is flipping the image
  pushMatrix();
  scale(-1, -1);
  image(pbuff, -pbuff.width, -pbuff.height);
  popMatrix();

  //then some blend with the DIFFERENT filter.
  blend(pbuff, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);

  //Now, I save the state of the canvas into the buffer
  pushMatrix();
  loadPixels();
  pbuff.loadPixels();
  for (int i = 0; i < width*height; i++) {
    pbuff.pixels[i] = pixels[i];
  }
  pbuff.updatePixels();
  updatePixels();
  popMatrix();

  //Now reset the background
  background(51);
  
  //I'll draw the buffer again, but with a rotation 
  //to get the up and down rectangles
  pushMatrix();
  translate(width/2, height/2);
  imageMode(CENTER);
  rotate(PI/2);
  image(pbuff, 0, 0);
  imageMode(CORNER);
  popMatrix();

  //finally I blend it aguien using the original buffer
  blend(pbuff, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
  
  //And that's how I get the 4 rects on the screen with the blend :)
}

void mousePressed() {
  //println("x: " + mouseX + ", y:" + mouseY + ", t: " + t);
}

void keyPressed() {
  if (keyPressed) {
    switch (key) {
    case '+':
      t = t + T_INC;
      i = i + I_INC;
      println(t);
      break;
    case '-':
      t = t - T_INC;
      i = i - I_INC;
      println(t);
      break;
    case 't':
      anim = !anim;
      break;
    }
  }
}

