
import processing.opengl.*;

int windowWidth = 900;
int windowHeight = 500;
int i = 0;
int j = 0;
//String txt = "O";
PFont f;
int m = 0;


void setup () {
  colorMode(HSB, 360, 100, 100);
  size(900, 500, P2D);
  smooth();
  background(0);

  //textFont(createFont("Georgia",24));
  // textAlign(CENTER, CENTER);
  f = loadFont( "ArialMT-16.vlw" );
}

void draw() {

  noStroke();

  for (j = 0; j < windowHeight / 10; j = j + 1 ) {

    for (i = 0; i < windowHeight / 5; i= i + 1 ) {
      
      textFont(f, 14); // Step 4: Specify font to be used
      fill(random(36)*10, 100, 100, 150 );   
      //ellipse(i*10, j*10, random(1, 10), random(1, 10));
      text ( "x", i*10, j*10);
    }

    if (m == 10) {

      fill (0, 10);
      noStroke();
      rect(0, 0, windowWidth, windowHeight);
      m = 0;
    } 
    else { 
      m = m + 1;
    }
  }
}



