
import processing.opengl.*;

// Sine Wave
// Daniel Shiffman <http://www.shiffman.net>


//wave object
Wave[] wave = new Wave[50];
PVector orig;


void setup() {
  size(screen.width, screen.height, OPENGL);
  smooth();
  // Initialize a wave with starting point, width, amplitude, and period

  for (int i=0; i<wave.length; i++){
     
    orig = new PVector (0, random(100, height-100));
    wave[i] = new Wave(orig,100);
  }
}

void draw() {
  fill(255);
  rect(0,0,width, height);

  // Update and display waves
  for (int i=0; i<wave.length; i++){
  wave[i].calculate();
  wave[i].display();
  wave[i].update();
  }
}




