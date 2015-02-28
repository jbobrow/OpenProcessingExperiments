
PFont Gothic2;
PFont Gothic;
PImage myImage;

void setup () {
  size(700,400);
  background(255,255,255);
  Gothic2 = loadFont("LetterGothicStd-45.vlw");
  Gothic = loadFont("LetterGothicStd-68.vlw");
  myImage = loadImage("SunsetSky.jpg");
}
  void draw() {
    
    
  fill(183,228,255,50);
  textFont(Gothic);
  text("Sincerely",180,230);
  
     tint(255,255,255,50);
  image(myImage,0,0,700,400);
  
  fill(250,136,193,70);
  textFont(Gothic2);
  text("I love you",mouseX,mouseY);
  
  

  }

