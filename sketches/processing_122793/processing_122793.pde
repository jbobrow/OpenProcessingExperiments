
/**
 * Speed. 
 *
 * Use the Movie.speed() method to change
 * the playback speed.
 * 
 */

import processing.video.*;

Movie mov;
int w = 120;

float v = 1.0 / 9.0;
float[][] matrix = { {v, v, v }, 
                    { v, v, v }, 
                    { v, v, v } }; 
void setup() {
  size(960, 540);
  background(0);
  mov = new Movie(this, "SpaceVenture LogoConverted.mov");
  mov.loop();
}

void movieEvent(Movie movie) {
  mov.read();  
}

void draw() {    
  image(mov, 0, 0);
    
  float newSpeed = map(mouseX, 0, width, 0.1, 2);
  mov.speed(newSpeed);
  
  fill(255);
  text(nfc(newSpeed, 2) + "X", 10, 30); 
 
  // Calculate the small rectangle we will process
 
  int xstart = constrain(mouseX - w/2, 0, mov.width);
  int ystart = constrain(mouseY - w/2, 0, mov.height);
  int xend = constrain(mouseX + w/2, 0, mov.width);
  int yend = constrain(mouseY + w/2, 0, mov.height);
  int matrixsize = 3;
  loadPixels();
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ) {
      color c = convolution(x, y, matrix, matrixsize, mov);
      int loc = x + y*mov.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
 //filter(BLUR,2);
  filter(GRAY); 
}

  
  color convolution(int x, int y, float[][] matrix, int matrixsize, Movie mov)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + mov.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc,0,mov.pixels.length-1);
      // Calculate the convolution
      rtotal += (red(mov.pixels[loc]) * matrix[i][j]);
      gtotal += (green(mov.pixels[loc]) * matrix[i][j]);
      btotal += (blue(mov.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
  
 
}





