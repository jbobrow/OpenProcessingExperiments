
PImage myImage;
PImage myImage2;

void setup(){
  size(500,500);
  myImage = loadImage("7429987-seamless-pattern-of-blue-water-in-pool.jpg");
  myImage2 = loadImage("grey-gold-water.jpg");
}


void draw(){
  tint(mouseX, mouseY, 255, 50);
  image(myImage, mouseX, mouseY, 800, 100);
  image(myImage2, 0, 0, 600, 700);
  rect(0,0,100,100);
  
}


