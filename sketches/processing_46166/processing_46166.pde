
PImage myImage1;
PImage myImage2;
PImage myImage3;

void setup(){
  size(1000,1000);
  myImage1 = loadImage("myImage1.jpg");
  myImage2 = loadImage("myImage2.jpg");
  myImage3 = loadImage("myImage3.jpg");
}

void draw(){
  tint(random(0,255), random(0,255),random(0,255), random(0,150));
  image(myImage1,random(0, 1000), random(0, 1000), 500,500);
  
  tint(random(0,255), 255, 255, 150);
  image(myImage2, random(0,1000),mouseY,500, 500);
  
  tint(255,255,255,150);
  image(myImage3, mouseX, mouseY, 200, 300);
}

