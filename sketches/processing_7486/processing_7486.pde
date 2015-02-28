
float[] v;
float[] inc;

void setup() {
    size( 500, 100 );
    v = new float[width];
    inc = new float[v.length];
    for( int i = 0; i < v.length; i++ ) {
      v[i] = .5;
      inc[i] = i/1000.0;
    }
    textFont( loadFont( "AndaleMono-12.vlw" ), 12 );
}

void draw() {
  background( 255 );
  stroke( 0 );
  for( int i = 0; i < v.length; i++ ) {
    v[i] += inc[i];
    float val = noise(v[i]) * height;
    line( i, height, i, val );
  }
  stroke( 255 );
  text("increment rates close to " + (float)1/1000, 0, height-4);
  text("increment rates close to " + (float)width/1000, width-215, height-4);
}

