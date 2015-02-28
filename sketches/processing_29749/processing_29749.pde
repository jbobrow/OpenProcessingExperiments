
int h = 342;
int w = 197;

float r;
float b;
float g;

PImage working;
PImage average = createImage(w, h, RGB);

int card = 0;

void setup() {
  size(197, 342);
}

void draw() {
  for (int p = 0; p < w * h; p++) {
      average.pixels[p] = color(0, 0, 0);
    }
  average.updatePixels();
  
  for (int i = 0; i < 7; i++) {
    
    working = loadImage((card + i) % 78 + ".jpg", "jpg");
    working.resize(w, h);
    working.loadPixels();
    for (int p = 0; p < w * h; p++) {
      r = ( i * red(average.pixels[p])   + red(working.pixels[p])   ) / ( i + 1.0 );
      g = ( i * green(average.pixels[p]) + green(working.pixels[p]) ) / ( i + 1.0 );
      b = ( i * blue(average.pixels[p])  + blue(working.pixels[p])  ) / ( i + 1.0 );
      average.pixels[p] = color(r, g, b);
    }
    average.updatePixels();
  }  
  image(average, 0, 0);
  card++;
  card = card % 78;
}

