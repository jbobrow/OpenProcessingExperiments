
float grid[][][];
PGraphics boundary;
int page = 0;
int sides = 3;
float w = PI/2;

public void setup() {
  size(512, 512, P2D);
  colorMode(HSB,255);
  grid = new float[2][width-1][height-1];
  boundary = createGraphics(width,height,P2D);
  makeBoundary(sides);
  loadPixels();
}

void makeBoundary(int sides) {
  for(int i=0; i<width-1; i++) {
    for(int j=0; j<height-1; j++) {
      grid[page][i][j] = 0;
      grid[page^1][i][j] = 0;
    }
  }
  boundary.beginDraw();
  boundary.background(0);
  boundary.fill(255);
  boundary.strokeWeight(4);
  boundary.stroke(255);
  int radius = 240;
  float px = (width-1)/2+radius*cos(0), py = (height-1)/2+radius*sin(0);
  for (float i=0; i<=2*PI; i+= TWO_PI/sides) {
    float x = ((width-1)/2)+radius*cos(i); 
    float y = ((height-1)/2)+radius*sin(i);
    boundary.line(px,py,x,y);
    px = x;
    py = y;
  }
  boundary.endDraw();
}

public void draw() {
  oscilator((width-1)/2,(height-1)/2);
  for(int i=1; i<width-2; i++) {
    for(int j=1; j<height-2; j++) {
      int wa = boundary.pixels[i+width*j];
      float dx =  (wa == 0xffffffff) ? 0: grid[page][i-1][j] + grid[page][i+1][j];  
      float dy =  (wa == 0xffffffff) ? 0: grid[page][i][j-1] + grid[page][i][j+1];  
      float value = (((dx+dy )/2)) - grid[page^1][i][j];
      grid[page^1][i][j] = value;
      int y = value < 0 ? (int)(-value*512): 0;
      int b = value > 0 ? (int)(value*512): 0;
      y = y > 255 ? 255 : y;
      b = b > 255  ? 255 : b;
      pixels[i+j*width] = 0xFF000000 | y << 16 | y << 8 | b;	
    }
  }
  page ^= 1;
  updatePixels();
}

public void oscilator(int cx,int cy) {
  grid[page][cx][cy] = cos(w);
  w += PI/32;
}

public void mousePressed() {
  makeBoundary(++sides);
}

public void keyPressed() {
  if (key == ' ') {
    sides = 3;
    makeBoundary(sides);
  }
}


