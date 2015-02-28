
import processing.video.*;

Capture cam;
float quadrant = 0;
PImage pixelImage;                                
float scalar = 2.2;
int offsetX = -10;
int offsetY = -10;

void setup() {
  size (1280, 720, P3D);
  smooth();
  /////////camera capture:processing.org/////////////
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {  //activates camera
    cam.read();
    
    saveFrame();
    
    ///////////////////////quadrant 4////////////////////////
    ///////////////////Messy blocks video/////////////////////
    //sources: www.learningprocessing.com and openprocessing.org////
    if (quadrant == 4) {
      if (cam.width != 0) {
        scalar =1.4*(displayWidth/cam.width);
      }
      //println("scalar" + scalar);
      int fiveTally = 0;

      int[] pVue;
      int tolerance = 1000;

      float pixelDistort = 50;


      for (int m = 0; m<2500; m++) {

        int randX = round(random(0, (cam.width-40)/5))*5;
        int randY = round(random(0, (cam.height-40)/5))*5;
        float randSize = 1.5;

        int c = cam.get(randX, randY);

        drawRect(round(randX+random(0, 5)), round(randY+random(0, 5)), randSize, round(c));
      }
    }
  }
  ///////////////////////////quadrant 6/////////////////////////////////
  //////////////////Fun house mirror video//////////////////////////////
  if (quadrant == 6) {
    translate (-2123, -493, -270);
    rotateX(-0.7);
    image(cam, 0, 0, 5255, 3771);
  }
  ////////////////////////////quadrant 9////////////////////////////////
  ///////////////////Fun house mirror video 2///////////////////////////
  if (quadrant == 9) {
    translate (-418, -237, -288);
    rotateX(0.8);
    rotateY(0.0);
    image (cam, 0, 0, 1791, 1274);
  }
  /////////////////////////////quadrant 5///////////////////////////////
  ///////////////////////////Pointillism////////////////////////////////
  ////////sources: learningprocessing.com and openprocessing.org/////////
  if (quadrant == 5) {

    frameRate(300);

    //Pick a random point
    int x = int(random(cam.width));
    int y = int(random(cam.height));
    int loc = x + y*cam.width;
    // Look up the RGB color in the source image
    cam.loadPixels();
    float r = red(cam.pixels[loc]);
    float g = green(cam.pixels[loc]);
    float b = blue(cam.pixels[loc]);
    noStroke();

    fill(r, g, b, (random(255)));
    ellipse(x, y, 30, 30);
    ellipse(x+20, y+20, 30, 30);
    ellipse(x-20, y+20, 30, 30);
    ellipse(x+20, y-20, 30, 30);
    ellipse(x-20, y-20, 30, 30);
  }



  if (quadrant == 0) {
    image(cam, 0, 0);
  } 
  else {
  }

  ////////////////RULE OF THIRDS MOUSE DETECTION/////////////////////


  /////top section/////
  if (mouseX < width/3 && mouseY < height/3) { //top left
    //NORMAL CAM - NO EFFECTS//
    quadrant = 0;
  }

  else if (mouseX > width/3 && mouseX < (width/3+width/3) && mouseY < height/3) { //top center
    filter(THRESHOLD);
    quadrant = 0;
    ///////filter: http://processing.org/////////////////
  }

  else if (mouseX > (width/3+width/3) && mouseY < height/3) { //top right
    filter(INVERT);
    filter(POSTERIZE, 4);
    quadrant = 0;
    //////////filter: http://processing.org//////////
  }



  /////center section/////
  else if (mouseX < width/3 && mouseY > height/3 && mouseY < (height/3+height/3)) { //center left
    quadrant = 4;
  }

  else if (mouseX > width/3 && mouseX < (width/3+width/3) && mouseY > height/3 && mouseY < (height/3+height/3)) {//center of screen
    //POINTILLISM//
    quadrant = 5;
  }

  else if (mouseX > (width/3+width/3) && mouseY > height/3 && mouseY < (height/3+height/3)) { //center right
    quadrant = 6;
  }


  /////bottom section/////
  else if (mouseX < width/3 && mouseY > (height/3+height/3)) { //bottom left
    //WARMING FILTER//
    fill(255, 140, 0, 40);
    rect(0, 0, width, height);
    quadrant = 0;
  }

  else if (mouseX > width/3 && mouseX < (width/3+width/3) && mouseY > (height/3+height/3)) { //bottom center
    //COOLING FILTER//
    fill(30, 144, 255, 40);
    rect(0, 0, width, height);
    quadrant = 0;
  }

  else if (mouseX > (width/3+width/3) && mouseY > (height/3+height/3)) { //bottom right
    quadrant = 9;
  }



  //Rule of Thirds Lines//
  //line(width/3, 0, width/3, height);
  //line((width/3+width/3), 0, (width/3+width/3), height);
  //line(0, height/3, width, height/3);
  //line(0, (height/3+height/3), width, (height/3+height/3));
  println(quadrant);
}


void drawRect(int xVal, int yVal, float w, color c) {

  fill(c);
  rect((xVal*scalar)+offsetX, (yVal*scalar)+offsetY, w*scalar, w*scalar);
}

void mouseClick(){
  saveFrame();
}




