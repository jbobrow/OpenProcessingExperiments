
/**
 * The Mandelbrot Set
 * by Daniel Shiffman.  
 * 
 * Simple rendering of the Mandelbrot set.
 */
 
// Establish a range of values on the complex plane
// A different range will allow us to "zoom" in or out on the fractal
// float xmin = -1.5; float ymin = -.1; float wh = 0.15;
float xmin = -2.5; 
float ymin = -2; 
float wh = 16;
float z=0;
void setup() {
  size(800, 800, P2D);
  background(255);
  // Make sure we can write to the pixels[] array. 
  // Only need to do this once since we don't do any other drawing.
  loadPixels();
}

void draw() {
  if(mousePressed==true){// Maximum number of iterations for each point on the complex plane

  wh*=.99;

  xmin+=map(mouseX,0,800,-.01*wh,.01*wh);

  ymin+=map(mouseY,0,800,-.01*wh,.01*wh);
  // x goes from xmin to xmax
  float xmax = xmin + wh;
  // y goes from ymin to ymax
  float ymax = ymin + wh;
 
  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);

  // Start y
  float y = ymin;
  for (int j = 3*height/8; j < 5*height/8; j++) {
    // Start x
    float x = xmin;
    for (int i = 3*width/8;  i < 5*width/8; i++) {
        int maxiterations = 100;
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
        if(aa + bb > 16.0) {
          break;  // Bail
        }
        n++;
      }
      
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(255);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        pixels[i+j*width] = color(n*16 % 255);  
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
}else {
    int maxiterations = 100;
  float xmax = xmin + wh/4;
  // y goes from ymin to ymax
  float ymax = ymin + wh/4;
 
  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);

  // Start y
  float y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin;
    for (int i = 0;  i < width; i++) {
      
      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = sq(a) - sq(b) + x;
        b = twoab + y;
        // Infinty in our finite world is simple, let's just consider it 16
        if(aa + bb > 16.0) {
          break;  // Bail
        }
        n++;
      }
      
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(255);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        pixels[i+j*width] = color(n*16 % 200,z*3%255,n*15 % 255);  
      }
      x += dx;
    }
    y += dy;
  }
}
z++;
}
void keyPressed(){
  if(key==' '){
    xmin = -2.5; 
    ymin = -2; 
    wh = 16;
  }
}
    


