
PImage img;
PImage img2;
PImage img3;
final float imageWidth=-2580;
float x=0;



void setup(){
  size (500,500);
  background(255);
  img=loadImage ("plane.png");
  img2=loadImage ("deathvalley.png");
  img3=loadImage ("deathvalley2.png");
}

void draw(){
    background(255);
    image(img2,x,0,2580,500);
    image(img,mouseX,mouseY,125,125);
    x+=4;
    if (x>width-500){
      x=-2080;
   
    }
 
}



 
 
  




