
int curTime;
int prevTime;
float deltaTime;

PFont font;
String str;

float breathAccum;
float ramp;

void setup() {
  size( 512, 512 );
  background( 223 );
  smooth();
  
  font = loadFont( "Moire-48.vlw" );
  textFont( font );
  textAlign( CENTER );
  fill( 31 );
  
  str = "HyperventilatE";
  
  breathAccum = 0.0;
  ramp = 0.0;
}


void draw() {
  prevTime = curTime;
  curTime = millis();
  deltaTime = ( curTime - prevTime ) / 1000.0f;
  
  breathAccum += deltaTime * 10;
  
  if( mouseX > width/2 - textWidth(str)/2
    && mouseX < width/2 + textWidth(str)/2
    && mouseY > height/2 - textAscent()
    && mouseY < height/2 + textDescent() ) {
      ramp += deltaTime;
      if( ramp > 1.0 )
        ramp = 1.0;
    }
    else {
      ramp -= deltaTime/5;
      if( ramp < 0.0 )
        ramp = 0.0;
    }
  
  
  
  background( 223 );
  
  pushMatrix();
  translate( width/2.0, height/2.0 + ( ramp * (sin(breathAccum+PI-(PI/4))+1.0) * textAscent()/2.0 ) );
  scale( 1.0 + ( ramp * sin(breathAccum)/2.0 ), 1.0 + ( ramp * (sin(breathAccum+PI-(PI/4))+1.0) * 2.0 ) );
  text( str, 0, 0 );
  popMatrix();
}

