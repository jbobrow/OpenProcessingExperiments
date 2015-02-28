
PFont Black;
PFont Brad;
PImage myImage;

void setup(){
  size(600,600);
   background(255,0,0);
  
  Black = loadFont("Black-72.vlw");
  Brad = loadFont("Brad-72.vlw");
  myImage= loadImage("man.jpg");
  
}

void draw(){
  tint(255,255,255,3);
  
 image(myImage,mouseX,30);
  
  fill(0,0,0,50);
  textFont(Black);
  text("I SEE YOU",random(600),random(600));
 
   fill(0,0,255,40);
  textFont(Brad);
  text("How Are You?!",random(600),random(600));
  }

