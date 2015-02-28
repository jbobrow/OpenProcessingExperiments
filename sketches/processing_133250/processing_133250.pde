

import processing.opengl.*;
PVector location = new PVector(500,300,50); //Added Z value and changed x/y values -J
PVector speed = new PVector (1,1,2); //Added Z value -J
float inc=0;

void setup(){
  noStroke();
  size(1000,600, OPENGL); //changed size -J
    background(255);
    camera(width/2, height/2, 1000, width/2, height/2,0, 0, 1, 1000) ;

}

void draw(){
  background(255); //added background to draw loop -J
  pushMatrix();
  lights();
  inc+=0.1;
  
  
  location.add(speed);//location changes by 1 pixel in the x and y
  if (location.y > height || location.y < 0) {
    speed.y *= -1;
    
  }
  
  
  if(location.x > width || location.x < 0){
    speed.x *=-1;
  }
  
   if(location.z > 500 || location.z < 0){ // made it so it changes if it's over "2000" instead of over 1 -J
    speed.z *=-1;
  }
  
  noStroke();
  lights();
  translate(location.x,location.y,location.z);
  sphere(28);

  popMatrix();
}


