
void setup(){
  size(500,500);
  background(255);
  colorMode(RGB,256);
  noStroke();
  smooth();
  frameRate(15);
}

void draw(){
  
  
  int x = int(random(width));
  int y = int(random(height));
  int sz = int(random(100));
  fill( randomRGBColor() );
  ellipse(x,y,sz,sz);
}

color randomRGBColor(){
  color c = color(random(256),random(256),random(256),60);
  return c;
}


