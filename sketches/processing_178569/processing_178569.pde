
class SPoint { 
  float x=0.0, y=0.0, z=0.0;
 
  SPoint( float r, float incl, float azim) {
    this.x = r * sin( radians( incl)) * cos( radians( azim));
    this.z = r * sin( radians( incl)) * sin( radians( azim));
    this.y = r * cos( radians( incl)) ;
  } 
}

class SPike {
  
  float pLeft, pRight, pTop, pBottom, pBase, pHeight, pDelta;

 
  SPike( float pLeft, float pRight, float pBottom, float pTop, float pBase, float pHeight) {
    this.pLeft  = pLeft  ;
    this.pRight = pRight ;
    this.pBottom= pBottom;
    this.pTop   = pTop   ;
    this.pBase  = pBase  ;
    this.pHeight= pHeight;
    this.pDelta = 0.0;
  } 
 
  void setDeltaPlus( float d) {
    this.pDelta = pDelta+d;
  } 
 
  void setDelta( float d) {
    this.pDelta = d;
  } 
 
  float getHeight() {
    return this.pHeight;
  } 
   
  void deltaHeight() {
     this.pHeight+=this.pDelta;
  } 
 
 
  void render() {
    float x, y, z;
    SPoint sph, tip;
    pushMatrix();
    beginShape(TRIANGLES);
    
    tip = new SPoint( (pBase+pHeight), (pTop+pBottom)/2.0, (pLeft+pRight)/2.0 );
    vertex( tip.x, tip.y, tip.z); // left top front 
    sph = new SPoint( pBase, pTop, pLeft);
    vertex( sph.x, sph.y, sph.z); // left top front
    sph = new SPoint( pBase, pBottom, pLeft );
    vertex( sph.x, sph.y, sph.z); // left top back
     
    vertex( tip.x, tip.y, tip.z); // left top front 
    sph = new SPoint( pBase, pTop, pLeft);
    vertex( sph.x, sph.y, sph.z); // left top front
    sph = new SPoint( pBase, pTop, pRight );
    vertex( sph.x, sph.y, sph.z); // left top back
     
    vertex( tip.x, tip.y, tip.z); // left top front 
    sph = new SPoint( pBase, pBottom, pRight);
    vertex( sph.x, sph.y, sph.z); // left top front
    sph = new SPoint( pBase, pBottom, pLeft );
    vertex( sph.x, sph.y, sph.z); // left top back
     
    vertex( tip.x, tip.y, tip.z); // left top front
    sph = new SPoint( pBase, pTop, pRight);
    vertex( sph.x, sph.y, sph.z); // Right top back
    sph = new SPoint( pBase, pBottom, pRight);
    vertex( sph.x, sph.y, sph.z); // Right top front
     
    endShape();
 
    popMatrix();
  } 
} 
import processing.opengl.*;
 
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
 
 
PeasyCam cam;
SPike Mimi[][];
float xrot=0.0, yrot=0.0, d=0.0, maxH=100.0, minH=-50.0;
  
float inc = 0;


 
 
void setup() {
  noCursor();
  frameRate(70);
  Mimi= new SPike[36][18];
  size(500, 500, P3D);
  fill(204);
  cam = new PeasyCam(this, 380);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  for ( int j=0; j<18; j++) { 
    for ( int i=0; i<36; i++) { 
      Mimi[i][j] = new SPike( 10.0*i, 10.0*i+10.0, 10*j, 10.0*j+10.0, 120.0, 100*noise(i*0.2, j*0.2) );
    } 
  } 
}
 
void draw() {
  
  
 

  
  lights();
 
  colorMode( HSB, 360, 10, 10, 10); 
   background(200,16,99);
  // drawing 
  stroke( 0, 0, 50, 100);
  
  
  

  
  
  

for ( int j=1; j<17; j++) { 
   for ( int i=0; i<36; i++) {
  
 
  fill( random(200,225));
 
   
      d= random(-0.1, 0.1);
      Mimi[i][j].setDeltaPlus( d);
      if ( Mimi[i][j].getHeight() > maxH) {
        Mimi[i][j].setDelta(-0.1);
      }
        
     if ( Mimi[i][j].getHeight() < minH) {
        Mimi[i][j].setDelta( 0.1);
      }
      Mimi[i][j].deltaHeight();
      Mimi[i][j].render();
    } 
  } 
}



