
/*=======================================
"Into The Light"
Functions Lab
Simple Gradient of "Light" created using functions
   
Modified 2/19/2015
     
Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com
     
Art 3001
     
=======================================*/

void setup() {
  size(600, 600);
  background(10);
  noStroke();
  noLoop();
}

void draw() {

  drawEllipse(width*0.5, height*0.5, 700, 40);
  //draws scaling ellipse 
  //width&height*0.5 allows for centering
  //700=ellipse size, 40=spacing of redrawn ellipses

}

void drawEllipse(float x, float y, int size, int n) { //setup function
  //Each call to drawEllipse() specifies position, size, total number of ellipses drawn
  float vortex = 255/n; //setup fill gradient
  float rays = size/n; //initiates size of each ellipse, size/number
  for (int i = 0; i < n; i++) {
    
    fill(i*vortex); //allows ellipses to appear as gradient
    ellipse(x, y, size - i*rays, size - i*rays); //ellipse function
  }
}
