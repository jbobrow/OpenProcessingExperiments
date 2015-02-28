
float[] grassx = new float[100];
float[] grassy = new float[100];
void setup() {
  size(300,300);
  frameRate(25);
  smooth();
  
  for ( int i =0; i<100; i++ ) {
    grassx[i] = random( 6 );
    grassy[i] = random( 10 );
  }
}

int c = 0;

void draw() {
  background(255);
  stroke( 0 );
  pushMatrix();
  c += random(3);
  translate(150,300);
  rotate( PI/12 * sin(30 + c/6.0));
  scale( 1.0 - 0.1 * cos(c/3.0), 1 + 0.1 * cos( c/3.0));
  drawEgg();
  popMatrix();
  drawGrass();
}

void drawEgg() {
  strokeWeight(3);
  fill( 255, 255, 0);
  bezier( -60, -60, -70, 20, 70, 20, 60, -60);
  bezier( -60, -60, -40, -160, 40, -160, 60, -60);

  fill(128,255,0);
  strokeWeight(2);
  ellipse( 0, -7, 10, 10 );
  ellipse( -35, -20, 10, 10 );
  ellipse(  25, -40, 10, 10 );
  ellipse( -15, -35, 10, 10 );
  ellipse( -35, -50, 10, 10 );
  ellipse( 0, -90, 10, 10 );
  ellipse( 40, -60, 10, 10 );
  ellipse( 10, -70, 10, 10 );
  ellipse( -35, -80, 10, 10 );
  ellipse( 20, -100, 10, 10 );
  ellipse( -20, -110, 10, 10 );
}

void drawGrass() {
  stroke( 0, 128, 0);
  strokeWeight(2);
  for( int i = 0; i < 100; i++ ) {
    line(i*3, 300, i*3 - 3 + grassx[i], 290 - grassy[i]);
  }
}

