
PImage kitty;
int kw;
int kh;
int black = 5;

color fillIn;
float r, g, b;
int nColorsToAvg;

void setup(){
  kitty = loadImage("cream_kitten.jpg");
  kitty.loadPixels();
  kw = kitty.width;
  kh = kitty.height;
  size (kw, kh);
}

void draw(){
  background(255);
  image(kitty, 0, 0);

  for (int y=0; y<kh; y++){
    for (int x=0; x<kw; x++){
      color c = getColor(x, y, kitty);
      float spot = (red(c) + green(c) + blue(c))/3.0;

      r = g = b = 0;
      nColorsToAvg = 0;

      fillIn = get(x, y+1);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      fillIn = get(x+1, y+1);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      fillIn = get(x+1, y);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      fillIn = get(x+1, y-1);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      fillIn = get(x, y-1);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      fillIn = get(x-1, y-1);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      fillIn = get(x-1, y);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      fillIn = get(x-1, y+1);
      r += red(fillIn);
      g += green (fillIn);
      b += blue (fillIn);
      nColorsToAvg ++;

      if (spot <= black){
        fillIn = color(r/nColorsToAvg, g/nColorsToAvg, b/nColorsToAvg);
        set(x,y, fillIn);
      }
    }
  }
}

color getColor(int x, int y, PImage pic){
  int maxLoc = pic.width*pic.height;
  int loc = (y*pic.width) + x;
  if (loc < maxLoc){
    return pic.pixels[loc];
  } else {
    return 0;
  }
}

