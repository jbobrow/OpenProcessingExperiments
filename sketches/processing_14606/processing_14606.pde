
PImage img;
int n = 1;
int s = 0;
int diam = 4;

void setup() {
  size(1000,600);
  background(0);
  frameRate(50);
}

void draw() {
  img = loadImage("MGM"+n+".jpg");
  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  for (int y = 0; y < height; y+=3 ) {
    for (int x = 0; x < width; x+=3 ) {
      int loc = x + y*width;

      //The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      //      r=r-dist(mouseX,mouseY,x,y)/3;
      //      g=g-dist(mouseX,mouseY,x,y)/3;
      //      b=b-dist(mouseX,mouseY,x,y)/3;
      //      pixels[loc] = color(r,g,b);

      noStroke();
      fill(img.pixels[loc]);
      ellipse(x,y,diam,diam);

      if (x>400 && x<600 && y>200 && y<380) { 
        //              ellipse(x,y,diam,diam);
      }
    }
  }


  //  println(s);
  s++;
  n = (n + 1);
  if (n>19) {
    n=1;
  }
}


