


/*

- 2 arrays mit jeweils 4 punkten

- auf interkation, lerp von A nach B


*/
boolean aufwaerts = true;
float[][] startPositions = new float[4][2];
float[][] endPositions = new float[4][2];
float fader = 0;
float speed = 0.05;


void setup() {
  size( 500, 300 );
  smooth();
  frameRate( 25 );
  stroke( 0 );
  
  importDaten();
}



void draw() {
  background(255);
  
  berechneFader();
  zeichneLinie();
}



void berechneFader() {

  if(!aufwaerts)
    fader += speed; // fader = fader + speed
  else
    fader -= speed;

  fader = constrain ( fader, 0, 1 );
}



void zeichneLinie() {

  noFill();  
  beginShape();
  for( int i = 0;   i < 4;   i++ ) {
    
    // übersetzung des fader in x und y position
    // interpolation / tweening / animation
    float x = lerp ( startPositions[i][0], endPositions[i][0], fader );
    float y = lerp ( startPositions[i][1], endPositions[i][1], fader );
    
    // vertex punkte für linie ... + ellipsenpunkt
    vertex( x, y );
    fill(0);
    ellipse( x, y, 15, 15 );
    noFill();
  }
  endShape();
  
}



void keyReleased() {
  aufwaerts = !aufwaerts;
}



void importDaten() {
  int x = 100;
  
  for( int i = 0;   i < 4;   i++ ) { // i++ ... das gleiche wie ... i = i + 1;
    
    // x werte
    startPositions[i][0] = x;
    endPositions[i][0] = x;
    x += 100; // das gleiche wie    x = x + 100;
    
    // y werte
    startPositions[i][1] = random( 25, 150 );
    endPositions[i][1] = random( 90, 275 );    

  }
  
}




