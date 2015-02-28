
PImage pic;

float a = 0;

void setup(){
  size(903,660);
  pic = loadImage("slave-ship.jpg");
  frameRate(60);
  
  
}


void draw(){

  
  image(pic,0,0,width, height);
  copy(mouseX,mouseY,mouseX+1,mouseY+2,200,200,205,205);

}

//need to stop the jagged edges

//need to zoom in
