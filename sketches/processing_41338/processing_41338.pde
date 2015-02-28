
PImage img;
PImage img1;

void setup (){
 
  size (400,400);
  img= loadImage ("van_gough_bacon_2.jpg");

  
}

void draw (){
 
 image (img, 0,0);
 
 float r = map(mouseX, 0,400, 2, 5);

filter(POSTERIZE, r);
  
}

