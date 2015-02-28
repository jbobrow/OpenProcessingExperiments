
//many thx to David!! ^^
//can you tell who this is?

PImage face;

void setup(){
  size(400, 400);
  background(255);
  face = loadImage("tom-cruise.jpg");
  face.loadPixels();
}

void draw(){
  int x = (int) random(width);
  int y = (int) random(height);
  
  color c = getColor(x,y,face);

  float pixBrightness = (red(c) + green(c) + blue(c))/3.0/255.0;
  float circSize = pixBrightness * 10 + 10;
  
  noStroke();
  fill(red(c), green(c), blue(c));
  ellipseMode(CENTER);
  ellipse(x,y,circSize,circSize);
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

