
/*
François Zajéga
frankiezafe.net
*/

Wave w1, w2, w3, w4, w5;
float def;

void setup() {
  
  size(800,600);
  background(255);
  def = 0;

  w1 = new Wave( 20 );
  w2 = new Wave( 20 );
  w3 = new Wave( 20 );
  w4 = new Wave( 20 );
  w5 = new Wave( 20 );

  // setting speeds
  w1.setSpeed( 0.004f );
  w2.setSpeed( 0.003f );
  w3.setSpeed( 0.008f );
  w4.setSpeed( 0.012f );
  w5.setSpeed( 0.0015f );
  
  // setting maps once and for all
  w1.setMap( 10, 110 );
  w2.setMap( 0.2f, 0.7f );
  w3.setMap( 240, 340 );
  w4.setMap( 0.1f, 0.5f );
  w5.setMap( 450, 550 );
  
  // setting range
  w1.setRange( 0.3f );
  w4.setRange( 0.15f );
  
  // changing method
  w5.setMethod( Wave.WAVE_NOISE );
  w5.setNoiseScale( 0.05f );
  
}

void draw() {
  
  w1.update();
  w2.update();
  w3.update();
  w4.update();
  w5.update();
  
  w1.setRange( mouseY / 600.f );
  w3.setRange( w2.getValue() );
  w5.setRange( w4.getValue() );
  
  background(255);
  
  def += 0.01f;
  
  // no dephas
  w1.render( 40, 10, 780, 100 );
  
  w2.render( 40, 185, 780, 50 );
  w3.render( 40, 240, 780, 100 );
  
  w4.render( 40, 395, 780, 50 );
  w5.render( 40, 450, 780, 100 );
  
  // drawing circles via Wave.getValue()
  noFill();
  strokeWeight(2);
  stroke( 255, 0, 255 );
  float yv;
  yv = w1.getValue();
  line( 10, yv, 30, yv );
  yv = w3.getValue();
  line( 10, yv, 30, yv );
  yv = w5.getValue();
  line( 10, yv, 30, yv );
  strokeWeight(1);
  
}

