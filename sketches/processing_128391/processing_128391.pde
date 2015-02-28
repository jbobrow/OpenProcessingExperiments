
//references:
//http://www.processing.org/tutorials/pixels/
//http://vormplus.be/blog/article/voronoi-paintings-with-toxiclibs

import toxi.geom.*;
import toxi.geom.mesh2d.*; 
import toxi.util.*;
import toxi.util.datatypes.*; 
import toxi.processing.*;
import processing.video.*;

Capture video;

float size = 10000;

Voronoi voronoi;
 
PImage source;
 
int pointDensity = 70;
int cols, rows;
int x, y;
int numPixels;
float colorThreshold = 30;

 
void setup() {
  size(640,480);
  //size(source.width, source.height);
  video = new Capture(this, width, height);
  video.start();
  
  //source = loadImage("test.png");
  source = createImage(640,480,RGB);
  //image(source,0,0);  
  smooth();
  
  //colors = new ArrayList<color>();
  
  cols = width/pointDensity;
  rows = height/pointDensity;
  numPixels = source.width * source.height;
 
  voronoi = new Voronoi(size);
  

//  addPoint(); 
//  drawTriangle();
}

void addPoint() {
  //video.loadPixels();
  //loadPixels();
  
  source.copy(video,0,0,640,480,0,0,640,480);
  source.updatePixels();
  
  for (x=1; x<source.width; x+=cols) {
    for (y=1; y<source.height; y+=rows) {
      int loc = x + y*source.width;
      color pix = source.pixels[loc];
      
      int leftLoc = (x-1) + (y-1)*source.width;
      color leftPix = source.pixels[leftLoc];
      
      // compare color
      float r1 = red(pix); float g1 = green(pix); float b1 = blue(pix);
      float r2 = red(leftPix); float g2 = green(leftPix); float b2 = blue(leftPix);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      // compare brightness
//      float diff = abs(brightness(pix)-brightness(leftPix)); 
      if (diff > colorThreshold) {
        voronoi.addPoint(new Vec2D(x+random(-2, 2), y+random(-2, 2)));
      }
    }
  }
}  

void drawTriangle(){
 
  for (Triangle2D t : voronoi.getTriangles()) {
    color pix;
    
    // use Centroid's color
    Vec2D locVec = t.computeCentroid();
    int loc = (int)((locVec.x) + (locVec.y)*source.width);
    
    // use vertexA's color
//    int loc = (int)((t.a.x) + (t.a.y)*source.width);
    
//    if (loc < numPixels-1 && loc > 0) {
//      fill(255);
//      ellipse(locVec.x, locVec.y, 2, 2);
      pix = source.pixels[constrain(loc,0,numPixels-1)];
//      stroke(pix,100);
//      fill(pix);
//    }
    noFill();
//    noStroke();

    beginShape(TRIANGLES);
    stroke(0, 200, 200);
    strokeWeight(.1);
    vertex(t.a.x, t.a.y);
    vertex(t.b.x, t.b.y);
    vertex(t.c.x, t.c.y);
    endShape();    
  }
}
 
void draw() {
  background(255);
  video.read();
  //image(video,0,0);


  if(showImg) {
    image(source, 0, 0);
  } else {
    addPoint(); 
    drawTriangle();
  }
  
  fill(0);  
  rect(15,5,30,20);
  
  // show frame rate
  fill(255);
  text(int(frameRate), 20, 20);
  
  updatePixels();
  
  if (frameCount%10 == 0)
    voronoi = new Voronoi(size);
//  if (saveImg)
//    saveFrame("ss.gif");
}

boolean showImg = false;
boolean saveImg = false;

void keyPressed() {
  if(key == 'i')
    showImg = !showImg;
    
//  if(key == 's') {
//    saveImg = true;
//  } else {
//    saveImg = false;
//  }
}


