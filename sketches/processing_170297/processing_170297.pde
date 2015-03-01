
float delta = 0.01;
float xnoise = 0;
float ynoise = 0;
float znoise = 0;
float xstart = 0;
float ystart = 0;
 
void setup() {
  size(800,600);
  background(255);
  smooth();
  frameRate(30);
  colorMode(HSB);
  xnoise = random(200);
  xstart = xnoise;
  ynoise = random(30);
  ystart = ynoise;
  znoise = random(30);
  for(int i = 0; i < width; sin(i++)){
    ynoise += delta;
    xnoise = xstart;
    for(int j = 0; j < height; j++){
      xnoise += delta;
      stroke(360*noise(xnoise,ynoise,znoise),255*noise(ynoise,xnoise,znoise),255);
      point(i,j);
    }
  }
}
 
void draw() {
  background(255);
  xnoise = xstart;
  ynoise = ystart;
  znoise += 0.01;
  for(int i = 0; i < width; i++){
    ynoise += delta;
    xnoise = xstart;
    for(int j = 0; j < height; j++){
      xnoise += delta;
      stroke(360*noise(xnoise,ynoise,znoise),255*noise(ynoise,xnoise,znoise),255);
      point(i,j);
    }
  }
 
}
