
// basic_image_sample1

int x = 0;
int y = 0;
int dir_x = 1;
int dir_y = 1;
int speed = 3;

PImage img;

void setup() {
  size( 300, 300 );
  frameRate( 30 );
  img = loadImage( "tori.png" );
}

void draw() {
  background( 255 );

  x += dir_x * speed;
  y += dir_y * speed;

  if ( ( x < 0 ) || ( x > width - img.width ) ) {
    dir_x = - dir_x;
  }

  if ( ( y < 0 ) || ( y > height - img.height ) ) {
    dir_y = - dir_y;
  }

  image( img, x, y );
}

