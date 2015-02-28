
int counter = 0;
PImage[] images = new PImage[16];

void setup() {
  size(400, 400);
  background(200);
  images[0] = loadImage( "castleisland1.jpg" );
  images[1] = loadImage( "castleisland2.jpg" );
  images[2] = loadImage( "castleisland3.jpg" );
  images[3] = loadImage( "castleisland4.jpg" );
  images[4] = loadImage( "castleisland5.jpg" );
  images[5] = loadImage( "castleisland6.jpg" );
  images[6] = loadImage( "castleisland7.jpg" );
  images[7] = loadImage( "castleisland8.jpg" );
  images[8] = loadImage( "castleisland9.jpg" );
  images[9] = loadImage( "castleisland10.jpg" );
  images[10] = loadImage( "castleisland11.jpg" );
  images[11] = loadImage( "castleisland12.jpg" );
  images[12] = loadImage( "castleisland13.jpg" );
  images[13] = loadImage( "castleisland14.jpg" );
  images[14] = loadImage( "castleisland15.jpg" );
  images[15] = loadImage( "castleisland16.jpg" );
}


void draw() { 
    background(200);
    image(images[counter], 0, 0);
  }
  
 void mousePressed() {
  if(counter < 15) {
    counter++; 
 } else {
   counter = 0;
 }
}

