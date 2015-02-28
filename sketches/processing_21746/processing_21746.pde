
// Disintegration/Reaggregation (Dust and the Ghost in the Machine)
// William A. Clark / Math, Programming, and Art (Nick Lally)
// Febuary 2011

// code for voronoi generation modified from code from:
// http://processing.org/discourse/yabb2/YaBB.pl?num=1272171428

// ideas/to do: 
// color each region depending on avg color value of region
// animate cells?
// framerate quickens depending on amount of motion in frame? (OpenCV?)
// set voronoi settings based on data from Macbook light sensor

import megamu.mesh.*;
import controlP5.*;
import de.looksgood.ani.*;
import processing.video.*;
Capture img;
Ani ani;

float upperBright = 100;
float lowerBright=50;
float lowSkip = 1;
float highSkip = 5.5;

//int cx = 0; int cy = 0;
int x, y, prevX, prevY;

float cx = 0;  float cy = 0;
int count = 0;
int vnum = 0;
float opacity = 0;
int blood;

PointList points = new PointList();
Voronoi voronoi;
ControlP5 controlP5;
boolean ready = false;
boolean v = true;

void setup() {
 size(800,600,P3D);  // using the P3D renderer in hopes of speeding things up a bit
 frameRate(15);      // slow down framerate.. this creates the 'disintegration' effect
 
 /** INIT CONTROLS **/
  img = new Capture(this,width,height,30);
  controlP5 = new ControlP5(this);
  Controller np = controlP5.addSlider("upper",0,255,upperBright,40,40,100,10);
  Controller ns = controlP5.addSlider("lower",0,255,lowerBright,40,60,100,10);
  Controller ls = controlP5.addSlider("lowskip",1,20,lowSkip,40,80,100,10);
  Controller hs = controlP5.addSlider("highskip",1,20,highSkip,40,100,100,10);
  Controller go = controlP5.addButton("go",1, 40,120, 50, 20);
  
  Ani.init(this);
  ani = new Ani(this, 2, "blood", 100);
  ani.setPlayMode(Ani.YOYO);
  ani.repeat();

 println("done setup");
}


/** CONTROL EVENTS **/
void captureEvent(Capture img) {
  img.read();
}

void upper(float value) {
  upperBright = int(value);
}

void lower(float value) {
  lowerBright = int(value);
}

void lowskip(float value) {
  lowSkip = value;
}

void highskip(float value) {
  highSkip = value;
}

void go() {
  ready = false;
  points.clear();
  getAllPoints();
  if(points.size() < 7000 && v == true ){
      voronoi = new Voronoi( points.toArray());
      ready = true;
      v = false;
  }
  else{
    println("Not drawing Voronoi");
    
    // have some if() clauses here to lower the amount of voronoi points if
    // they begin to become too high (thus insuring the computer doesn't freeze/stall).
    // could probably be done more elegantly, but I'll save that for later.
    if(points.size() > 7000 && points.size() < 9000){
      highSkip++;
    }
    if(points.size() > 9000) {
      highSkip = highSkip + 2;
    }
    if(points.size() > 10200) {
      highSkip = highSkip + 3;
      upperBright-=2;
      lowerBright+=2;
    }
    v = true;
  }
}

void draw() {
  
    for(int i = 0; i < 1500; i ++) {
    x = int(random(width));
    y = int(random(height));
    
    color cp = img.get(x,y);
    color prevcp = img.get(prevX,prevY);
    float h = hue(cp);
    float s = saturation(cp);
    float b = brightness(cp);
    float prevb = brightness(prevcp);
    float prevH = hue(prevcp);
    float prevS = saturation(prevcp);
    
    //if the point currently being drawn is close to the hue of the last, do some stuff
    if(h > prevH-5 && h < prevH+5);{
      //stroke(map(mouseY,0,width,0,255),0,0,3);
      stroke(blood,0,0,3);
      line(x, y, prevX, prevY);
      /**
      float ellSize = random(10,18);
      fill(h, random(5,10));
      ellipse(x,y,ellSize,ellSize);
      **/
  }
    noStroke();
      float ellSize = random(5,10);
      fill(img.get(x,y),random(20,140));
      float rnd = random(-5,5);
      ellipse(x,y,ellSize+rnd,ellSize+rnd);
  prevX = x;
  prevY = y;
}

// every x frames, draw Voronoi triangulations
  if(count%100 == 0 && count != 0) {
    println(count + "drawing...");
    go();
    }
    
    count++;

  stroke(180,108);
  if (!ready) {
    fill(20);
    rect(0,30,200,120);
    controlP5.draw();
    return;
  }
  MPolygon[] regions = voronoi.getRegions();    // create an array of points
  stroke(180,2);
  /**
  for(int i=0; i<regions.length; i++) {
	float[][] regionCoordinates = regions[i].getCoords();   // get region coords
        noFill();
	regions[i].draw(this);  // 
  }**/
  float[][] edges = voronoi.getEdges();   // get coords for edges of Voronoi regions
  for(int i=0; i<edges.length; i++) {
        // draw edges
	float startX = edges[i][0];
	float startY = edges[i][1];
	float endX = edges[i][2];
	float endY = edges[i][3];
	line( startX, startY, endX, endY );
  }
  
  noStroke();
  
  // draw controls, in case they haven't been drawn already
  fill(20);
  rect(0,30,200,120);
  controlP5.draw();
}

// this function creates the points for the Voronoi regions, depending on certain values
// there is a low brightness threshold, a high brightness threshold, and skip thresholds for each
// by adjusting the granularity of these details, you can achieve different triangulations.
void getAllPoints() {
  for (int x = 0; x < width; x+=int(random(lowSkip,highSkip))) {
    for (int y = 0; y < height; y+=int(random(lowSkip,highSkip))) {
	float b = brightness(img.get(x,y));
	if (b <= upperBright && b >= lowerBright) {
	  points.addPoint(new Point(x,y));
	}
    }
  }
  println("total:"+points.size());
}

// some Java bullocks.. essentially creating holders and values for points
class PointList {
  ArrayList points = new ArrayList();
  
  public void addPoint(float x, float y) {
    addPoint(new Point(x,y));
  }
  
  public void addPoint(Point p) {
    points.add(p);
  }
  
  public boolean isEmpty() {
    return points.isEmpty();
  }

// put x,y values of points in arrays
  float[][] toArray() {
    float[][] arr = new float[points.size()][2];
    for (int i = 0; i < points.size(); i++) {
	Point p = (Point) points.get(i);
	arr[i][0] = p.getX();
	arr[i][1] = p.getY();
    }
    return arr;
  }

// size integer for points  
  int size() {
    return points.size();
  }
  
  Point get(int i) {
    return (Point) points.get(i);
  }
  
  void clear() {
    points.clear();
  }
}

class Point {
  float x,y;
  
  public Point(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

}

