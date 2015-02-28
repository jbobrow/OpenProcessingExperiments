
PImage img;                    
float haze = 0.0;
int canvas = 300;

void setup() {
size(canvas,canvas);
img = loadImage("water3.jpg");
smooth();
}

void draw() {
  background(img);
    if (haze < 100.0) {
  haze += 0.1;
}
filter(BLUR, haze);
blend(0,0,200,200,0,0,canvas,canvas,LIGHTEST);
}
              

