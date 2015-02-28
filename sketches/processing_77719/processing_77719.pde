
import processing.opengl.*;

float xrot = 0, zrot = 0;
int nlat,nlong,mlat,mlong,M;
float theta,phi;

void setup() {
  size( 600, 400, OPENGL );
  xrot = PI/5;
  zrot = PI/4;
}

void draw() {
  background(255);
  lights();
  
  
  translate(300,200,0);
  pushMatrix();
  noFill();
  setRotate();
  drawAxises(2);
  drawShapes();
  popMatrix();
  println(frameRate);
}

void drawShapes(){
  pushMatrix();
    pushMatrix();
      translate(-100, -100, 0);
      noStroke();
      fill(color(255,0,0));
      box(50);
    popMatrix();
    
    pushMatrix();
      translate(-20, 50, 100);
      noStroke();
      fill(color(0,0,255));
      box(50);
    popMatrix();
    
    pushMatrix();
      translate(100, 100, 0);
      fill(color(0,255,0));
      noStroke();
      sphere(40);
    popMatrix();
    
    // draw prism
    pushMatrix();
      translate(20, -50, 100);
      scale(30);
      stroke(color(0,0,255));
      fill(color(125,125,125));
      beginShape();
      vertex(-1, -1, -1);
      vertex( 1, -1, -1);
      vertex( 0,  0,  1);
    
      vertex( 1, -1, -1);
      vertex( 1,  1, -1);
      vertex( 0,  0,  1);
    
      vertex( 1, 1, -1);
      vertex(-1, 1, -1);
      vertex( 0, 0,  1);
    
      vertex(-1,  1, -1);
      vertex(-1, -1, -1);
      vertex( 0,  0,  1);
      endShape();
    popMatrix();
    
  popMatrix();
}

void setRotate(){
  rotateX(xrot*PI/2.0);
  rotateZ(zrot*PI/2.0);
  //rotateX(PI/3.0);
  //rotateY(PI/3.0);
  //rotateZ(PI/3.0);
}

void drawAxises(int w){
  strokeWeight(w);
  int len = 100;
  beginShape();
    stroke(color(255,0,0));
    vertex(-len,0,0);
    vertex(len,0,0);
  endShape();
    beginShape();
    stroke(color(0,255,0));
    vertex(0,-len,0);
    vertex(0,len,0);
  endShape();
    beginShape();
    stroke(color(0,0,255));
    vertex(0,0,-len);
    vertex(0,0,len);
  endShape();
}

void mouseDragged(){
  float dt=PI/50.;
  if( mouseButton==LEFT ){
    xrot-=(mouseY-pmouseY)*dt;
    zrot-=(mouseX-pmouseX)*dt;
  }
  else{
    nlat +=(mouseY-pmouseY);
    nlong +=(mouseX-pmouseX);
    if( nlat<1 ) nlat=1;  
    if( nlong<1 ) nlong=1;       
    if( nlat>25 ) nlat=25;

    theta = PI/float(nlat);
    phi = 2.*PI/float(nlong);

    mlat = nlat+1;
    mlong = nlong+1;
    M=nlat;
  }
}


