
int value = 0;
float x,y, angle;

void setup(){
  background(0);
  size (600,600);
  colorMode(HSB,360,100,100,100);
  noStroke();
}

void draw(){
  fill(random(360),100,100,100);
for(int x = 0; x < width; x+=10){
  for(int y = 0; y < height; y+=10){
    float ellSize = sin(y*x+angle)*10;
    triangle(x,y,x,y,ellSize,ellSize);
    rect(x,y,mouseX,mouseY);
  }
}
angle+=.1;
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

