
//Processing Homework 


import processing.video.*;
Capture video;
float posX = 0;
float posY = 0;
float posX2 = 0;
float posY2 = 0;
PFont font1;

int cols;
int rows;
int videoScale = 10;

PImage img;
int pixelX;
int pixelY;


boolean guiStart = false;

void setup() {

  size(640, 350);
  cols = width/videoScale;
  rows = height/videoScale;
  video = new Capture(this, cols, rows, 30);
  video.start();
  img = loadImage("gui.png");
  pixelX = 0;
  pixelY = 0;
  frameRate(30);
}


void draw(){
  background(255);
  
  if(guiStart == true){
  drawVideo();
 
  }
  
  if(guiStart== false){
    image(img,0,0);
    fill(0);
    textAlign(CENTER);
    font1 = loadFont("Bauhaus93-48.vlw");
    textFont(font1, 40);
    fill(255);
    text("VIDEO MADDNESS",  width/2, height/2);
    text("CLICK HERE TO GET CRAZY",  width/2, height/2.5);
    
     posX = random(width);
     posY = random(height); 
     posX2 = random(width);
     posY2 = random(height);
  }
  
}

void mouseClicked(){

  guiStart=true;
}


void drawVideo() {

  if (video.available()) {
    video.read();
  }
  //image(video,0,0);
  //background(0);
  //video.loadPixels();

  for (int x = 0; x < cols; x++) {
    for (int y=0; y < rows; y++) {
      int xx = x*videoScale;
      int yy = y*videoScale;
      color c = video.get(x,y);
      float bright = brightness(c);
      float sz = map(bright, 0, 255, 0, 10);
      float rot = map(mouseX, 0, width, 0, 359);
      stroke(c);
      fill(c);
      //point(xx,yy); 
      pushMatrix();
      translate(xx,yy);
      rotate(radians(rot));
      rectMode(CENTER);
      rect(0,0,sz,sz);
      popMatrix();
      
    }
   
  }
 //a little drawing on top of the video
      stroke(mouseX/5);
      strokeWeight(mouseY/10);
      line(pmouseX, pmouseY, mouseX, mouseY);

}








