
/*
This sketch is about preprocessing the sine of a wave in an object.
Values are generated during instanciation.
They are readables via a getCurrentValue( float ). 
This method use interpolation to render any value on the wave

François Zajéga
frankiezafe.net
*/

Wave w1, w2, w3;
float def;
float mx;

void setup() {
  
  size(800,600);
  background(255);
  def = 0;
  mx = 0;
  
  // using more than 1 wave is required if you want to use
  // the resolution inconsistancy (true for very low resolutions)
  w1 = new Wave( 5 );
  w2 = new Wave( 10 );
  // it's possbile to define the period 
  w3 = new Wave( 300, 3 );
  // it's possible to define an angular speed
  // if you use a phase with render() or getValue(),
  // the phase will be added to the angular speed
  w2.setSpeed( 0.003f );
  
}

void draw() {
  
  // update is required only if the speed is set
  // to something else than 0
  w2.update();
  
  background(255);
  
  def += 0.01f;
  
  // no dephas
  w1.render( 10, 10, 100, 100 );
  w2.render( 120, 10, 100, 100 );
  w3.render( 230, 10, 100, 100 );
  
  // interactive dephas
  // the same wave can be played at different speed
  w1.render( 360, 10, 100, 100, mx / 100.f );
  w1.render( 470, 10, 100, 100, mx / 50.f );
  w2.render( 580, 10, 100, 100, mx / 100.f );
  w3.render( 690, 10, 100, 100, mx / 100.f );
  
  // variable dephas
  w1.render( 10, 120, 780, 460, def * 0.149f );
  w2.render( 10, 120, 780, 460, def * 0.150f );
  w3.render( 10, 120, 780, 460, def * 0.151f );
  
  // drawing circles via Wave.getValue()
  noFill();
  stroke( 255, 0, 255 );
  ellipse( 10, 350 + w1.getValue( def * 0.149f ) * 230, 10, 10 );
  ellipse( 10, 350 + w2.getValue( def * 0.150f ) * 230, 10, 10 );
  ellipse( 10, 350 + w3.getValue( def * 0.151f ) * 230, 10, 10 );
  
  mx = mouseX;

}

