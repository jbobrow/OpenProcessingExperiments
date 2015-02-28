
// Simple example of Diffusion-Limited Aggregation
// http://en.wikipedia.org/wiki/Diffusion-limited_aggregation

// This implements the algorithm described here:
// http://classes.yale.edu/fractals/Panorama/Physics/DLA/DLA2.html

// Tom Heath 2009

color c = color(255);

void setup() {
  size(500,500);
  background(80);
  set(width/2,height/2,c);
}

void draw() {
  loadPixels();
  for (int i=0;i<100;i++) {
    float r = random(TWO_PI);
    int x = width/2 + int(width/3*sin(r));
    int y = height/2 + int(height/3*cos(r));
    while (x>2 && x<width-2 && y>2 && y<height-2) {
      int move = (int)random(4);
      if (move == 0) { 
        x++;
      } 
      else if (move == 1) { 
        x--;
      } 
      else if (move == 2) { 
        y++;
      } 
      else if (move == 3) { 
        y--;
      }
      if (pixels[y*width+x-1]==c || pixels[y*width+x+1]==c || pixels[(y+1)*width+x]==c || pixels[(y-1)*width+x]==c) {
        pixels[y*height+x] = c;
        break;
      }
    }
  }
  updatePixels();
}

void mousePressed() {
  //saveFrame("dla###.png");
  background(80);
  set(width/2,height/2,c);
}




