
PImage myImage1;
PImage myImage2;

void setup(){
  size (700, 400);
  myImage1 = loadImage ("image1.jpg");
  myImage2 = loadImage ("images3.jpg");
}

void draw(){
  tint (255,255,255,255);
  image(myImage2, 0,0, 700, 400);
  tint (151,84,79, 200);
  image(myImage1, 0,0,300,300);
  image(myImage1, 300, 0, 300,300);
  image(myImage1, 300,300,300,300);
  image(myImage1, 0,300, 300,300);
  image(myImage1, 600,0,300,300);
  image(myImage1, 600,300,300,300);
  
}

