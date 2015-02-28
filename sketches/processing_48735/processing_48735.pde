
/////////////////////////////////////////////////////////////////////////////////////////////
// Written by Sasa Zivkovic 
// No.mad discourse | www.nomaddiscourse.com
// No.mad process | www.nomadprocess.com
/////////////////////////////////////////////////////////////////////////////////////////////
int framewidth = 15;
int num = 2000;
int spacing = 100;

///// declare and create array
My_Spiral[][] spiralObj = new My_Spiral[num][num];

float a;
float b;
float eas;

/////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 500);
  background(255); 
  ellipseMode(CENTER);
  smooth();
  frameRate(20);
  
  ///// assign arrays within grid
  for (int i = 0; i < num; i += spacing) {
    for (int j = 0; j < num; j += spacing) {
      spiralObj[i][j] = new My_Spiral(i, j);
    }
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
 
  ///// draw spiral grid
  for (int i = 0; i < num; i += spacing) {
    for (int j = 0; j < num; j += spacing) {
      
      ///// scale in relation to mouse
      float f = dist (i, j, mouseX, mouseY);
      if (f <= 100) {
        f = 100;
      }
      
      ///// apply easing
      eas = (f - eas) * 0.0005;
      float m = 1000/eas;
      
      float mx = map(m, -1000, 1000, 0.1, 0.3);
      
      ///// assign spirals
      spiralObj[i][j].returnValues();
      spiralObj[i][j].draw_my_Spiral(mx);
    }
  }
  
  ///// mouse indicator bar bottom 
  fill(0);
  rect(0, 500-10, width, height);
  rect(1000-10, 0, width, height);
  fill(255);
  ellipse(mouseX, 500-5, 4, 4);
  ellipse(1000-5, mouseY, 4, 4);
  
  ///// rounded rectangles 
  fill(255);
  noStroke();
  beginShape();
  int v = 10;
  vertex(width-v, 0);
  bezierVertex(width-v/2, 0, width, 0+v/2, width, v);
  vertex(width, 0);
  endShape();
  beginShape();
  vertex(v, 0);
  bezierVertex(v/2, 0, 0 , v/2, 0, v);
  vertex(0, 0);
  endShape();
  beginShape();
  vertex(v, height);
  bezierVertex(v/2, height, 0 , height- v/2, 0, height - v);
  vertex(0, height);
  endShape();
  beginShape();
  vertex(width-v, height);
  bezierVertex(width-v/2, height, width, height-v/2, width, height-v);
  vertex(width, height);
  endShape();
  noFill();
}  


/////////////////////////////////////////////////////////////////////////////////////////////
class My_Spiral {
  
  float x = 0;
  float y = 0;
  float angle = 0.0;                                    // initial angle variable
  float scalar = 0.1;                                   // initial radius
  float speed = 0.05;                                   // point density on spiral
  float[] initArray = new float[2];                     // array stores first x and y values
  float[] returnArray = new float[2];                   // array stores returned values
  
  My_Spiral(float tempX, float tempY) {
   x = tempX;
   y = tempY;
  }
  
  void returnValues() {
    arrayCopy(initArray, returnArray);                  // transfer array values
  }
  
  float[] draw_my_Spiral(float TEST) {
    pushMatrix();                                       // start coordinate system shift
    translate(x, y);                                    // shift coordinate system
    float m = cos(angle) * scalar;                      // set x parameter
    float n = sin(angle) * scalar;                      // set y parameter
    fill(100, 200);
    
    noStroke();                                         // set stroke and fill
    float l = map(mouseX, 0, 1000, 0.01, 0.3);          // restrict mouse value influence
    
    angle += speed + TEST;                              // increase angle by speed
    scalar += speed + TEST/4;                           // increase spiraling (speed, mouse)
    strokeWeight(0.2);
    stroke(100, 100);
    initArray[0] = m;                                   // assign initial array (value 1)
    initArray[1] = n;                                   // assign initial array (value 2)
    line(m, n, returnArray[0], returnArray[1]);         // draw line at m, n and return array     
    popMatrix();                                        // stop coordinate system shift
    return initArray;                                   // return x and y coordinates 
  }
}

  
  
  
  
  
  
  
  
  

