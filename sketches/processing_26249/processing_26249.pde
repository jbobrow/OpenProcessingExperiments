
int x;
int y;
PFont DilleniaFont;
PImage myImage;

void setup(){
  size(600,600);
  
  x = 0;
  y = 0;
  DilleniaFont = loadFont("DilleniaUPC-48.vlw");
  myImage = loadImage ("Sean.jpg");
}
 
void draw(){
  background(20,100,100);
  tint(255,0,0,255);
 image(myImage,mouseX,mouseY,300,300);
  fill(0);
  textFont(DilleniaFont);
  text("hey there!", mouseX, mouseY);
}

