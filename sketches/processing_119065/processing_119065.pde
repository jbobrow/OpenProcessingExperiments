
PImage myImage1;
PImage myImage2;

void setup(){
  size(900, 900);
  myImage1 = loadImage ("labradoodle.jpg");
  myImage2 = loadImage ("happy-cat.jpg");
}

void draw(){
  imageMode (CENTER);
  tint(mouseY, mouseX, 150,150);
  image(myImage1,mouseX, mouseY, mouseX, mouseY);
  tint(255,150,150,100);
  image(myImage2, mouseY, mouseX, mouseY, mouseX);
}

  


