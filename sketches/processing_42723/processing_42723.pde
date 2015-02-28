
//Variable
PImage ima1;
PImage ima2;
PFont font1;
PFont font2;
//Setup
void setup() {
  size (480,650 );
  //Load images
  ima1 = loadImage("mouth.jpeg");
  ima2 = loadImage("cake.png");
  //Load Fonts
  font1 = loadFont("Monospaced-eat.vlw");
  font2 = loadFont("eat60.vlw");
}
//Draw
void draw() {
  
  //image 1
  image(ima1, 0, 0, 480, 650);
  
  //image 2
  image(ima2, mouseX-80, mouseY-100,300,300);
  
  //Font1
  fill(255, 255, 255);
  textFont(font1);
  text("Let's", 50, 50);
  textSize(200);
  
  //Font2
  fill(255, 255, 255);
  textFont(font2);
  text("EAT", 50, 96);
  textSize(200);
}


