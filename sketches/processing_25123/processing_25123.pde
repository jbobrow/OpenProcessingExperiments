
PImage img;
PImage maskImg;
float circleSize = 25;
public static int squareWidth = 20;
public static int squareHeight = 20;
PFont font;

void setup(){
  size(400,600);
  maskImg = loadImage("Image13.jpg");
  img = loadImage("Image12.jpg");
  image(maskImg,0,0);
  font = loadFont("PrestigeEliteStd-Bd-17.vlw");
  textFont(font);
  fill(255);
  text("WHICH BOOK SHOULD I BUY?",140,25);

}

void draw(){
  if (mousePressed)
copy(img, 
      constrain(mouseX-squareWidth/2,0,width), 
      constrain(mouseY-squareHeight/2,0,height), 
      squareWidth,squareHeight, 
      constrain(mouseX-squareWidth/2,0,width), 
      constrain(mouseY-squareWidth/2,0,height), 
      squareWidth,squareHeight);
}



