
PImage myImage1;
PImage myImage5;

void setup(){
  size(960,500);
  myImage1 = loadImage("Image1.jpg"); 
  myImage5 = loadImage("Image5.jpg");
}

void draw(){

  tint(255,255,255,10);
  image(myImage1, random(0,255),random(0,90));
  image(myImage5, random(490,235),random(0,90));
  
  
  
}



