
PImage myImage;
PImage Image2;
PImage Image3;
PFont  myFont;

void setup() {
  myImage = loadImage("lightening.jpg");
  Image2 = loadImage("tornado.jpg");
  Image3 = loadImage("blizzard.jpg");
  myFont = loadFont("BlairMdITCTT-Medium-36.vlw");
    
  
  size(425,318);
}

void draw () {
  
  image(myImage,0,0);
  fill(255);
  textSize(40);
  text("CAPTURED STORMS", 10,50);
  textSize(18);
  text ("Monday, September 15", 10, 280);
  text ("SCI 108 7:00PM", 10,300);
  
  if (mousePressed){
    image(Image2,0,0);
    fill(225);
    textSize(18);
    text("Experience the sounds, sights, and smells",25,140);
    text(" of extreme weather like never before.",33,157);
  }

  }
   





