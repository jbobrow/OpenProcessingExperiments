
PImage[] images = new PImage[7];
int i =1;
int drop = -500;
int radius = 40;
PImage girl;

void setup() {

  size(900, 598);

  background(0);

  for ( int i = 1; i< images.length; i++ )
  {
    images[i] = loadImage( i + ".png" );   // make sure images "0.jpg" to "11.jpg" exist
  }

  frameRate(2);
  
girl = loadImage ("aaack.png");
  
}


void draw() {

  image(images [i], 0, 0);
  i++;
  if (i>= images.length)
  {
    i=1;
  }

drop+=35;
 image (girl, 0, drop);
 
 if (drop>1000)
 {
   drop = -500;
 }
}


