
PImage[] images = new PImage[3];

void setup(){
  size(500,500);
  
  for (int i=0; i<3; i++){
    images[i] = loadImage( i + ".png" );   // make sure images "0.jpg" to "2.jpg" exist
  }
}

void draw(){
  image(images[0]);
  image(images[1],300,300);
}


