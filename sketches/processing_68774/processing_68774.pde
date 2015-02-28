
/**
A small sketch based on the Simple Desktop Wallpaper "Energy Sunset":
http://simpledesktops.com/browse/desktops/2012/aug/06/energy-sunset

Coded by: @ramayac 

*/

void setup(){
  size(600, 390);
  background(#FFCC48);
  smooth();
  frameRate(24);
}

void draw(){
  background(#FFCC48);
  fill(0);
  
  arc(width/2, height, width*2, height/1.10, -PI, 0); 
  
  windmill(254,169, 1);
  windmill(288,169, 3);
  windmill(326,169, 1.5);
  windmill(358,169, 3.2);
  
}

void windmill(int x, int y, float r){
  pushMatrix();
    translate(x, y);
    triangle(0, 0, 1, 50, -1, 50);
    
    rotate(frameCount * PI * r/100);
  
    pushMatrix();
    //rotate(0);
    triangle(0, 0, 5, -2, 13, 0);
    rotate(2);
    triangle(0, 0, 5, -2, 13, 0);
    rotate(2);
    triangle(0, 0, 5, -2, 13, 0);
    popMatrix();
  popMatrix();
}
