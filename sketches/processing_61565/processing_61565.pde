
PGraphics m1, m2;
PFont myFont;
color c = color( 64, 64, 0);
void setup() {
  size(600, 400);
  m1 = createGraphics( 600, 400, P2D );
  m2 = createGraphics( 600, 400, P2D );
  myFont = loadFont( "Arial-Black-48.vlw");
  m1.beginDraw();
  m1.background(0);
  m1.fill(255);
  m1.noStroke();
  m1.textFont( myFont );
  for ( int i = -5; i < height-50; i+=44) {
    for ( int j = 10; j < width; j+=200 ) {
      m1.text( "SHOES", j, i );
    }
  }
  m2.beginDraw();
  m2.background(0);
  m2.endDraw();
}
void draw() {
  m2.beginDraw();
  m2.mask(m1);
  m2.endDraw();
  background(0);
  image(m2, 0, 0);
  fill(255);
  noStroke();
  rect(0, height - 50, width, 50);
  fill(c);
  noStroke();
  rect( 10, height - 40, 30, 30);
  int at=50;
  for ( int reds= 0; reds <= 256; reds+=64) {
    for ( int gres= 0; gres <= 256; gres+=64) {
      for ( int blus= 0; blus <= 256; blus+=64) {
        fill( reds, gres, blus );
        rect( at, height - 40, 4, 30);
        at+=4;
      }
    }
  }
  if ( mousePressed ) {
    if ( mouseY <= height - 50 ) {
      m2.beginDraw();
      m2.noStroke();
      m2.fill(c);
      m2.ellipse(mouseX, mouseY, 20, 20);
      m2.endDraw();
    } 
    else {
      c = get(mouseX, mouseY);
    }
  }
}


