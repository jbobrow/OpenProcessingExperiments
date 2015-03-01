
int h=0;
int m=0;
int s=0;
int ms=0;
 
void setup() {
  size(700, 700);
}

String displayDigit( int digit ) {
  if( digit < 10 ) {
    return "0" + digit;
  }
  return "" + digit;
}
 
void draw() {
  h = int(hour());
  m = int(minute());
  s = int(second());
  ms = int(millis());  
  
  background(0);
 
  translate(width/2, height/2);
 
  textFont(createFont("Open24DisplaySt", 35) );
  
  stroke(0, 255, 0);
  
  //line(200, 0, 0, 0);
  drawSeparators();
  drawHours();
  drawMins();
  drawSeconds();
}

void drawSeparators() {
  fill(0);
  if( ( s % 2 ) == 0 ) {
    fill(0,255,0);
  }
  text( ':', 252, 0);
  text( ':', 292, 0);
}

void drawHours() {
  int hour=0;
  float aInc = 360/24;

  pushMatrix();
  rotate( radians(aInc*h ) );
  for (int i=0; i<360; i+= aInc ) {
    fill(75);
    text( displayDigit( hour ), 220, 0);
    hour+=1;
    rotate( radians(360-aInc) );
  }
  popMatrix();
  
  fill(0,255,0);
  text( displayDigit( h ), 220, 0);
}
 
void drawMins() {
  int min=0;
  float aInc = 360/60;
 
  pushMatrix();
  rotate( radians(aInc*m ) );
  for (int i=0; i<360; i+= aInc ) {
    fill(75);
    text( displayDigit( min ), 260, 0);
    min+=1;
    rotate( radians(360-aInc) );
  }
  popMatrix();
  
  fill(0,255,0);
  text( displayDigit( m ), 260, 0);
}
 
void drawSeconds() {
  int sec=0;
  float aInc = 360 / 60;
  
  pushMatrix();
  rotate( radians( aInc*s ) );
  for (int i=0; i<360; i+= aInc ) {
    fill(75);
    text( displayDigit( sec ), 300, 0);
    sec+=1;
    rotate( radians(360-aInc) );
  }
  popMatrix();
  
  fill(0,255,0);
  text( displayDigit( s ), 300, 0);
}
  

