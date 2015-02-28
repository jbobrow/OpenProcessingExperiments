
PFont font;
PFont font2;
PImage images;

void setup(){
  size(800,800);
    background(255,0,0);
    
  font = loadFont("ToBeContinued-72.vlw");
  font2 =loadFont("AmericanTypewriter-Light-72.vlw");
  images = loadImage("hello-octopus.jpg");
  
    tint(0,0,255,90);
  image(images,10,10,780,780);
}

void draw(){
  
  
  fill(0,200,0,10);
  textFont(font);
  text("hello hello!!!", mouseX,random(800));
  
  fill(0,200,0,299);
  textFont(font2);
  text("hello hello hello!!", 400,400);
}

