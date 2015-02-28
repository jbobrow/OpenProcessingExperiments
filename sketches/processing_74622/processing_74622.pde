
// hw11
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

/* Controls:
b = black background
w = white backtround
z = stop
x = go

note: i turn off the codes that influence the ellipses' size because it slows down the sketch ALOT
      if you want to see it with varying ellipse sizes, make sure you reduce the number of points by ALOT (e.g. between 10-30)
*/

PVector[] pts, pv; // array of locations and velocities
float[] d; // array of ellipse diameters
int n = 210; // number of points 
PVector bounceX, bounceY;
float f,b;

void setup(){
  size(700,700);
  ellipseMode(CENTER);
  smooth();
  
  f = 0;
  b = 255;
  
  bounceX = new PVector(-1,1);
  bounceY = new PVector(1,-1);
  
  pts=new PVector[n];
  pv = new PVector[n];
  d = new float[n];
  
  initPvector(pts, 20, width-20);
  initPvector(pv, -1,1);
  //initDiam(d,1,10); // turn this on to create ellipses with varying diameters
}

void draw(){
  initiate();
  display(); // start the points
  bounce(); // move the points and make them bounce
  for(int i = 0; i<pts.length; i++){
    connect(pts[i].x, pts[i].y); // check distance and connect between all points. Thanks to "http://www.openprocessing.org/sketch/2215" for this distance checking solution
  }
}

void initiate(){
  background(b);
}

void initPvector(PVector[] v, float low, float high){
  for (int i = 0; i<v.length; i++){
      v[i] = new PVector(random(low,high), random(low,high));
  }
}

void initDiam(float[] f, float low, float high){
  for (int i = 0; i<f.length; i++){
      f[i] = random(low,high);
  }
}

/*void initPts(PVector[] v, float low, float high){
  for (int i = 0; i<pts.length; i++){
    pts[i] = new PVector(random(20,width-20), random(20,height-20)); // how to change this function so that it can support a rectangular (not square) window?
  }
}*/

void display(){
  for(int i = 0; i<pts.length; i++){
    //for(int j = 0; j<d.length; j++){ // turn this on for varying diameters
      fill(f);
      //ellipse(pts[i].x,pts[i].y, d[i],d[i]); // initiate this to generate ellipse with different diameters. can be VERY slow
      ellipse(pts[i].x, pts[i].y, 1,1);
    //}
  }
}


void connect(float x_, float y_){
  for(int i = 0; i<pts.length; i++){
    if(dist(pts[i].x, pts[i].y, x_,y_)<84){ // change the distance of influence here
      stroke(f,21);
      line(pts[i].x, pts[i].y, x_,y_);
    }
  }
}

void bounce(){
  for (int i = 0; i<pts.length; i++){
    for (int j = 0; j<pv.length; j++){
      if(i == j){
        pts[i].add(pv[j]);
        if(pts[i].x<20 || pts[i].x>width-20){
          pv[j].mult(bounceX);
        }else if(pts[i].y<20 || pts[i].y>height-20){
          pv[j].mult(bounceY);
        }
      }       
    }
  }
}

void mousePressed(){
  initPvector(pts, 20, width-20);
  //initDiam(d,1,10);
}

void keyPressed(){
  if(key == 'w'){
    f = 0;
    b = 255;
  }
  if(key == 'b'){
    f = 255;
    b = 0;
  }
  if(key == 'z'){
    noLoop();
  }else if(key =='x'){
    loop();
  }
}

