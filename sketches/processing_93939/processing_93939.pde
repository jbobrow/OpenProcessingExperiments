
float cx, cy, cr, carea;
part[] parts;
PGraphics bg;
PGraphics main;
PGraphics shadow;

void setup() {
  
  size(800,600);
  cx = 400;
  cy = 300;
  cr = 200;
  carea = pow( 250, 2 ) * PI;
  parts = new part[ 7000 ];
  for ( int i = 0; i < parts.length; i++ )
    parts[ i ] = new part();
    
  main = createGraphics( 800,600, P2D );
  main.beginDraw();
  main.smooth();
  main.background(0,0);
  main.endDraw();
  
  bg = createGraphics( 800,600, P2D );
  bg.beginDraw();
  bg.background(0);
  bg.noStroke();
  bg.fill( 255, 5 );
  for ( float i = cr * 2; i < cr * 2.21f; i += 1.1f ) {
    bg.ellipse( cx, cy, i, i );
  }
  bg.filter(BLUR, 3);
  bg.endDraw();
  noFill();
  stroke(0);
  
  shadow = createGraphics( 800,600, P2D );
  shadow.beginDraw();
  shadow.smooth();
  shadow.background(0,0);
  shadow.loadPixels();
  for ( int y = 0; y < shadow.height; y++ ) {
  for ( int x = 0; x < shadow.width; x++ ) {
    float d = dist( x + 0.5f, y + 0.5f, cx, cy );
    if ( d <= cr + 0.5f ) {
      shadow.pixels[ x + y * shadow.width ] = color( 0, pow( d/cr, 3 ) * 143 );
    }
  }
  }
  shadow.updatePixels();
  // shadow.filter( BLUR, 1.f );
  shadow.endDraw();
  
  smooth();
  
}

void draw() {
  
  float ratio = map ( sin ( frameCount / 60.f ), -1,1, 0,1 );
  float b = 0; // possible brightness: carea
  
  main.beginDraw();
  main.smooth();
  main.noStroke();
  main.fill( 255 - ratio * 255 );
  for ( int i = 0; i < parts.length; i++ ) {
    parts[ i ].update();
    main.rect( parts[ i ].px, parts[ i ].py, 1,1 );
  }
  main.endDraw();
  main.loadPixels();
  for ( int i = 0; i < main.pixels.length; i++ ) {
    b += brightness( main.pixels[ i ] ) / ( 255.f * carea );
  }
  
  smooth();
  background( 0 );
  image( bg, 0,0 );
  noStroke();
  fill( 0,0,0, 255.f * ( 1 - b ) );
  rect( 0,0, width, height );
  image( main, 0,0 );
  image( shadow, 0.f,0.f );

}

class part {
  
  float px, py, pvx, pvy, dev;
  
  public part() {
    px = random( 0,width );
    py = random( 0,height );
    pvx = random(-1,1);
    pvy = random(-1,1);
    float l = sqrt( pow(pvx,2) + pow(pvy,2) );
    pvx /= l;
    pvy /= l;
    dev = random( 0.02f, 0.3f);
  }
  
  public void update() {
    pvx += random( -dev, dev );
    pvy += random( -dev, dev );
    /*
    float l = sqrt( pow(pvx,2) + pow(pvy,2) );
    pvx /= l;
    pvy /= l;
    */
    px += pvx;
    py += pvy;
    
    if ( dist( cx,cy, px,py ) > cr ) {
      
      float tx = px - cx;
      float ty = py - cy;
      float tl = sqrt( pow(tx,2) + pow(ty,2) );
      tx /= tl;
      ty /= tl;
      px = cx - tx * cr * 0.99f;
      py = cy - ty * cr * 0.99f;
      
    }
    
  }
}

