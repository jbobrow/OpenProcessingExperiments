
/* @pjs preload="metal.jpg"; */  
PImage metalImage;

void setup(){
  size( 800, 400 );
  metalImage = loadImage("metal.jpg");
  image( metalImage, 0, 0, metalImage.width, metalImage.height );
}


void draw(){
  //if( frameCount < 2 ) image( metalImage, 0, 0, metalImage.width, metalImage.height );
}



