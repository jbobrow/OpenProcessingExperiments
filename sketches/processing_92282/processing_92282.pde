
PImage vogel;

void setup() {
  size(600, 900, P3D);
  background(0);
  vogel = loadImage("vogel.jpg");
  frameRate(10);
}

void draw() {
  background(0);
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  distort();
}


void distort() {
  loadPixels();   
  vogel.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      float r = red(vogel.pixels[loc]);
      float g = green(vogel.pixels[loc]);
      float b = blue(vogel.pixels[loc]);
      int distance = (int)dist(mouseX, mouseY,x,y);
      int alphaC = (int)map(distance, 0, sqrt(sq(width)+sq(height)),0, 255);
      //print(alphaC+" ");
      float newR = map(distance, 0, 600,0, r);
      float newG = map(distance, 0, 600,0, g);
      float newB= map(distance, 0, 600,0, b);
      color c=color(r-newR, g-newG,b-newB);
      //color c=color(r, g,b);
      stroke(c);
      for(int k=0; k<2; k++){
        float z=random(-100, 100);
      point(x, y, z);
      }
    }
  }
  updatePixels();
}


