
PFont font;// declare
PImage img;
 
void setup(){//setup details bkg, colour etc.
size(400, 267);
background(0);
smooth();
font= loadFont ("NanumBrush-48.vlw");
textFont(font);
background(255);
textAlign(CENTER);
textSize(50);
img = loadImage("text.jpg");
}
  
 float x = .5; //declare variable and value
void draw (){
  image (img,0,0);
  fill (abs(x)); //increase by increments of .5
  x++;
  text ("Snap",mouseY, mouseX, abs(x), abs(x));
  //will move with mouse and increase sideways at .5 in white-black gradient
  ////////////
  if(x > 150) { //set boundaries
    x = -150;
  }
    
}


