


// use camera from peasyCam 
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

// -------------------------------------------------------------------

float X_Add = 2.9;  
float X_Add_Change = 0.1;  // 

float dx_value = -530;   // the "sinusiness"
float dy_value = -1;     // the "ziness"

int dx_value_Add = 1; 

PVector MyResults = new PVector (0,0,0); 

// cam
PeasyCam cam;

boolean boolShowMovie = true; 

// ------------------------------------------------------------------------------

void setup()
{ 
  size( 800, 650, P3D );
  cam = new PeasyCam(this, 100);
  // move
  cam.pan(200,250);
  cam.setDistance(1630);
  cam.setResetOnDoubleClick (true);   
} // setup

void draw()
{ 
  background(117);
  float x=0; 
  if (boolShowMovie){
    cam.rotateY(radians(-1));
  }

  float dx = dx_value; 
  float dy = dy_value; 

  if (X_Add<0.1) { 
    X_Add=0.01;  
  }
  if (X_Add>15) { 
    X_Add=15;  
  }    
  while(x<721) {

    float y = dx * sin ( radians (x) ); 

    //good: -----------------------------------------------------------------------
    // line ( y+x+110, y+440, x+dy,   530-y, x+210, 3*y-dy);   
    MyResults.x= y+x+110;
    MyResults.y= y+140;
    MyResults.z= x*0.1-dy;

    MyBox ( MyResults.x ,MyResults.y , MyResults.z ,   
    230-y, x+210, y,
    4,
    color (MyResults.x ,MyResults.y , MyResults.z ));      

    x += X_Add ; 

  }  //  While

  dx_value = dx_value + dx_value_Add; 
  if (abs(dx_value)>535) {
    dx_value_Add=-1*dx_value_Add; 
  } 

} // draw 

void keyPressed() {
  if (key == CODED) {

    if (keyCode == UP) {
      X_Add += X_Add_Change;
    } 
    else if (keyCode == DOWN) {
      X_Add += -X_Add_Change;
    } 
    // keyboard for dx_value
    else if (keyCode == RIGHT) {
      dx_value += 1;
    } 
    else if (keyCode == LEFT) {
      dx_value += -1;
    } 
    else {
    }
  } 
  else {   
    // not key == CODED 
    // letters jkl as on the keyboard for dy_value
    if (key == 'j') {
      // reset
      dy_value = 0;
    }             
    else if (key == 'k') {
      // decrease
      dy_value -= 1;
    } 
    else if (key == 'l') {
      // increase
      dy_value += 1;
    }     
    // keyboard for dx_value    
    if (key == 'r') {
      // reset dx_value
      dx_value = 0;
    }             
    else {
    }
  }
}

void MyBox(float x1, float y1, float z1, float x2, float y2, float z2, float weight, color strokeColour)
// was called drawLine; programmed by James Carruthers
// see http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9
{
  PVector p1 = new PVector(x1, y1, z1);
  PVector p2 = new PVector(x2, y2, z2);
  PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
  float rho = sqrt(pow(v1.x,2)+pow(v1.y,2)+pow(v1.z,2));
  float phi = acos(v1.z/rho);
  float the = atan2(v1.y,v1.x);
  v1.mult(0.5);

  pushMatrix();
  translate(x1,y1,z1);
  translate(v1.x, v1.y, v1.z);
  rotateZ(the);
  rotateY(phi);
  noStroke();
  fill(strokeColour);
  // box(weight,weight,p1.dist(p2)*1.2);
  box(weight,weight,p1.dist(p2)*1.2);
  popMatrix();

}


