
//danielle yip
//dmgs 2010 @ sci-arc
//week 09 homework #1
//3d form using transformations & export to rhino

//import libraries
//some commented out for upload to openprocessing.org
//import processing.opengl.*;
import peasy.*;
//import unlekker.data.*;

PeasyCam cam;
//boolean saveSTL = false;

void setup(){
  
  size(600, 400, P3D);

  //create peasycam instance
  cam = new PeasyCam(this, 200);

   
}

void draw(){
  
  background(0, 15, 40);
  lights();
  noStroke();
  
  //set variables
  int shapeCount = 50;
  float stepSize = 5;
  
  //intialize STL output
  //if(saveSTL) beginRaw("unlekker.data.STL", "STLWrite.stl");
  
  //start point
  translate(width/10, 0, 0);
  rotateY(radians(90));
  //randomize using perlin noise
  float noiseScale = 0.01;
    
  //draw some shapes
  for(int i=0; i<shapeCount; i++){
     float noiseVal = noise(mouseX*noiseScale, mouseY*noiseScale);
     fill(216, 202, 164, 70);
     translate(stepSize, 0, 0);
     rotateX(noiseVal*50);
     rotateZ(noiseVal*100);
     box(noiseVal*10, noiseVal*2, height/3); 
     
     fill(255, 0, 94, 50);
     
     pushMatrix();
     translate(0, 60, 0);
     sphere(random(.5, 3));
     popMatrix();
  }
  
  //end STL output
  //if(saveSTL) endRaw();
  //saveSTL = false;
}

/////FUNCTIONS
/*
void keyPressed(){
  if(key == 's') saveSTL = true;
}
*/

