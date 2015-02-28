
PFont font;
String str;
float[] charRot;
float[] charTrans;

void setup() {
  size( 256, 256 );
  background( 223 );
  smooth();
  
  font = loadFont( "Aharoni-Bold-48.vlw" );
  textFont( font );
  fill( 31 );
  
  str = "massage";
  charRot = new float[7];
  charTrans = new float[7];
  for( int i = 0; i < 7; i++ ) {
    charRot[i] = 0.0;
    charTrans[i] = 0.0;
  }
}

void draw() {
  background( 223 );
  
  PVector mousePos = new PVector( mouseX, mouseY );
  float xPos = width/2 - textWidth(str)/2;
  int closestLetter = 0;
  float closestLetterDist = 512.0;
  
  for( int i = 0; i < 7; i ++ ) {
    float charWidth = textWidth( str.charAt( i ) );
    float charHeight = textAscent();
    PVector charMidpoint = new PVector( xPos + charWidth/2, 128 - charHeight/2 );
    float dist = PVector.dist( mousePos, charMidpoint );
    
    charTrans[i] = cos( PI/4 * (charMidpoint.x - mousePos.x)/16 ) * 16;
    charTrans[i] *= min( 16 / abs(charMidpoint.x - mousePos.x), 1.0 );
    charTrans[i] *= min( 8 / abs(charMidpoint.y - mousePos.y), 1.0 );
    
    charRot[i] = radians( mousePos.x - charMidpoint.x );
    charRot[i] *= (64 - min( abs(charMidpoint.x - mousePos.x), 64 )) / 64;
    charRot[i] *= min( 8 / abs(charMidpoint.y - mousePos.y), 1.0 );
    
    xPos += charWidth;
  }  
  
  xPos = width/2 - textWidth(str)/2;
  for( int i = 0; i < 7; i++ ) {
    float charWidth = textWidth( str.charAt( i ) );
    float charHeight = textAscent();
    PVector charMidpoint = new PVector( xPos + charWidth/2, 128 - charHeight/2 );
    
    pushMatrix();
    translate( xPos, 128 + charTrans[i] );
    translate( charWidth/2, -charHeight/2 );
    rotate( charRot[i] );
    translate( -charWidth/2, charHeight/2 );
    text( str.charAt( i ), 0, 0 );
    popMatrix();

    xPos += charWidth;
  }
}

