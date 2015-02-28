
PImage laimagen;
int x=400;


void setup(){
  size(400,400);
  laimagen = loadImage ("paranoid.png");
  frameRate(20);

}

void draw(){
  background(255);
  
  image(laimagen,x,0);
   x= x-1;
  
}
