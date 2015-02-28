
PImage img;
PImage img1;

void setup (){
 
  size (400,400);
  img= loadImage ("van_gough_bacon_2.jpg");

  
}

void draw (){

 tint (mouseX,mouseY,255); 
 image (img, 0,0);

  
}

