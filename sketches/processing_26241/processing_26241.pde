
int x;
PFont myFont;
PFont myFont2;
PImage myImage;

void setup(){
  size(600,350);
  x = 0;
  myFont = loadFont("myfont.vlw");
  myFont2 = loadFont("my2font.vlw");
  myImage = loadImage("underwood-typewriter.jpg");
}

void draw(){
  
  background(255,mouseX,mouseY);

tint(mouseX,mouseY,255, 90);
     image(myImage,50,50);
   
  fill(0);
  textFont(myFont);
  text("I'm writing text!", 0, 32);
  
  fill(150);
  textFont(myFont2);
  text("I'm writing two texts!", 0, 58);
 
}

