
import processing.video.*;
import processing.pdf.*;
import processing.opengl.*;

float angle=45;
boolean record;
/*
 ImageMap
 Ira Greenberg, November 4, 2005
 revised, October 10, 2006 and revisited November 7 2010 
 I am working on something 
 */

/* IMPORTANT- to run this, you need 
 6 images in your data directory named
 img1.jpg - img6.jpg. Images should each
 be 250 x 250 pixels */

Capture video;
PImage[] images = new PImage[6];
PImage bk;

void setup() {
  size(900, 900,OPENGL);
  //  video=new Capture(this,250,250);
  noStroke(); 
  //load images
  for (int i=1; i<7; i++) {
    images[i-1] = loadImage(i+".png");
  }
  bk=loadImage("screen-556.tif");
  smooth();

  // map images using 0.0-1.0
  textureMode(NORMALIZED); 
  frameRate(15);
}

void draw() {
  //  if(video.available()){
  //    video.read();
  //  }
  background(0);
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame.pdf");
  }



  //*center geometry in display windwow.
  //    image(images[1],0,0,800,800);
  translate(width/2, height/2);
  //rotate around y and x axes
  float rotX=map(mouseX, 0, width,0,20);
  float rotY=map(mouseY, 0, width,0,20);
      float mix = 100+sin(radians(angle))*10;
  rotateX(mix); 
  rotateY(rotY);
  for(int i=10; i<10000; i+=100) {
    scale(rotX);


    float mix2 = 100+cos(radians(angle))*i;
   float t= map(mix,0,100,0,10);
    //float mix2=100*cos(angle)
    angle++;
    createCube(i, t,mix2+i);
  }

  if (record) {
    endRaw();
    record = false;
  }
}




/* Create a class for a cube. What does volumetric space mean?
 
 
 */
void createCube(float w, float h, float d) {
  //front face
  beginShape(QUADS);
  texture(images[1]);
  vertex(-w/2, -h/2, -d/2, 0, 0); 
  vertex(w, -h/2, -d/2, 1, 0); 
  vertex(w, h, -d/2, 1, 1); 
  vertex(-w/2, h, -d/2, 0, 1); 
  endShape();
  //back face
  beginShape(QUADS);
  texture(images[1]);
  vertex(-w/2, -h/2, d,  0, 0); 
  vertex(w, -h/2, d,  1, 0); 
  vertex(w, h, d, 1, 1); 
  vertex(-w/2, h, d, 0, 1);
  endShape();
  //left face
  beginShape(QUADS); 
  texture(images[1]);
  vertex(-w/2, -h/2, -d/2, 0, 0); 
  vertex(-w/2, -h/2, d, 1, 0); 
  vertex(-w/2, h, d, 1, 1); 
  vertex(-w/2, h, -d/2, 0, 1); 
  endShape();
  //right face
  beginShape(QUADS); 
  texture(images[1]);
  vertex(w, -h/2, -d/2, 0, 0); 
  vertex(w, -h/2, d, 1, 0); 
  vertex(w, h, d, 1, 1); 
  vertex(w, h, -d/2, 0, 1); 
  endShape();
  //top face
  beginShape(QUADS);
  texture(images[1]); 
  vertex(-w/2, -h/2, -d/2, 0, 0); 
  vertex(w, -h/2, -d/2, 1, 0); 
  vertex(w, -h/2, d, 1, 1); 
  vertex(-w/2, -h/2, d, 0, 1); 
  endShape();

  //  //bottom face
  beginShape(QUADS); 
  texture(images[1]);
  //  
  vertex(-w/2, h, -d/2, 0, 0); 
  vertex(w, h, -d/2, 1, 0); 
  vertex(w, h, d, 1, 1); 
  vertex(-w/2, h, d, 0, 1); 
  endShape();
}

void mousePressed() {

  saveFrame();
  background(0);
}

void keyPressed() {
  if (key == 'r') {
    record = true;
  }
}


