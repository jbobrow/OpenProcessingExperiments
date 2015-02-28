
PImage myImage1;
PImage myImage2;

void setup(){
  size (900, 900);
  myImage1 = loadImage ("image1.jpg");
  myImage2 = loadImage ("image2.jpg");
  
}

void draw(){
  imageMode(CENTER);
  tint(mouseY,mouseX,150,150);
  image(myImage1,mouseX,mouseY,mouseX,mouseY);
    tint(250,mouseX,150,150);
  image(myImage2,mouseY,mouseX,mouseY,mouseX);
  
}

