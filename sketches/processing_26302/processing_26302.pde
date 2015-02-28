

PFont mercury;
PImage myImage;


void setup(){
  size (600,600);

  mercury=loadFont("Andalus-48.vlw");
  myImage=loadImage ("images.jpg");
}

void draw(){
  background(255, 0,100);
  
  
  image(myImage, 100,100, 200, 200) 
;

fill(255,255,255,200);
textFont(mercury);
text("I'm an invasive species!", 100,100, 200, 200 );

fill(255);

}




