
// timestep for the noise function
int t;

// canvas width/height
int w = 255;

// x == Y * w + X, it runs through all pixels
int x;

// X and Y will be calculated back from x using divison and modulo
int X, Y;

// almost final grey value
int c;

// horizontal/vertical noise selector
int m;


void setup(){
  // 255 == w
  size( 255, 255 );
}


void draw(){
  // next timestep
  t++;

  // black is beautiful
  background( 0 );

  // run through all pixels
  for( x = 0; ++x < w*w; ){

    // calc X,Y and wave them randomly with noise
    X = x % w + n();
    Y = x / w + n();

    // base color value
    c = 50
    // multiple dots can go to the same destination pixel
    // get the green channel's value
    // w = 255 which "accidentally" equals to binary 11111111
      + (get(X,Y) >> 8 & w );

    set( X, Y,
      // c might be larger than 255, but color() will clip it back to white
      color(
        c,  // red:   nothing special
        c,  // green: this is the value we extracted at the previous step
        c*2 // blue:  gray would be boring, let's make it blue by multiplication
      )
    );
  }
}


// noise calculator function
int n(){

  return int(

    // noise function can accept max 3 arguments, but we need 4:
    noise(

      // X,
      x % w / 99f,

      // Y,
      x / w / 99f,

      // time,
      t / 99f

      // and we need different noises for horizontal and vertical modulation
      // otherwise poor dots could only move diagonally which is boring
      + m++ % 2

    // scale noise()'s result from 0..1 to -127..+127
    ) * w - w/2
  );

}


