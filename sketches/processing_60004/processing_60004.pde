
/**
 * The Mandelbrot Set
 * by Daniel Shiffman.  
 * 
 * Simple rendering of the Mandelbrot set.
 * Modified by Evan weinberg to allow for pixelated versions of the set.
 */
 
// Establish a range of values on the complex plane
// A different range will allow us to "zoom" in or out on the fractal
// float xmin = -1.5; float ymin = -.1; float wh = 0.15;
float xmin = -2.5; 
float ymin = -2; 
float wh = 4;
int x_pixels = 70;
int y_pixels = 10;

void setup() {
  size(900 , 450);
  noLoop();
  background(255);
  // Make sure we can write to the pixels[] array. 
  // Only need to do this once since we don't do any other drawing.
  //loadPixels();
}

void draw() {
  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 200;

  // x goes from xmin to xmax
  float xmax = xmin + wh;
  // y goes from ymin to ymax
  float ymax = ymin + wh;
  
  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (x_pixels);
  float dy = (ymax - ymin) / (y_pixels);
  print(dx);
  // Start y
  float y = ymin;
  for (int j = 0; j < y_pixels; j++) {
    // Start x
    float x = xmin;
    for (int i = 0;  i < x_pixels; i++) {
      
      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        // Infinty in our finite world is simple, let's just consider it 16
        if(aa + bb > 16) {
          break;  // Bail
        }
        n++;
      }
      
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      //println(n);
      if (n == maxiterations) {
        fill(0);
        
        rect(i*width/x_pixels,j*height/y_pixels,width/x_pixels,height/y_pixels);
       // print("Black");
        
      } else {
        //fill(16*n%5,16*n%5,255);
        
        //rect(i*width/x_pixels,j*height/y_pixels,width/x_pixels,height/y_pixels);
        
      }
      //println(x);
      x += dx;
    }
    y += dy;
  }
  
}

