
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import glitchP5.*;
GlitchP5 glitchP5;
Minim minim;
AudioInput input;
void setup()
{
size(500,500, P2D);
background(255);
minim = new Minim(this);
glitchP5 = new GlitchP5(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  input = minim.getLineIn(Minim.STEREO, 512);
}
void draw()
{
  int cols = 500;
int rows = 500;
int glitchx=0;
int glitchy=0;

// Declare 2D array
int[][] myArray = new int[cols][rows];
// Initialize 2D array values
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = int(input.left.get(j)*50);
    glitchx = int(input.left.get(j)*50);
    
  }
}

// Draw points
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
   stroke(myArray[i][j]);
    point(i,j);
    glitchy=i;
   
    
  }
} glitchP5.run();

   glitchP5.glitch(glitchx, glitchy, glitchx, glitchy, 1200, 1200, 1, 1.0f, 10, 5);
}
void mousePressed()
{
  
 saveFrame("output-####.jpg");
 }
