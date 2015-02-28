
float colourIndex=0;
float c =0;
void setup() {
  size(800, 400);
  //frameRate(1);

  background(255);
  colorMode(HSB, 100);
}
int s=24;
int x=0;
int y=0;
int yFlip=s;
boolean xFlip=true;

void draw() {



  strokeWeight(random(0.1, 5));
  stroke(c, 100, 100, colourIndex);

  if (colourIndex >100) {
    colourIndex=0;
  }
  else {
    colourIndex+=0.1;
  }
  yFlip*=(-1);

  if (yFlip <0) {
    y+=(2*s);
  }

  if (y>height) {
    x+=(2*s);
    if (xFlip) {
      xFlip=false;
      y=-s;
    }
    else {
      y=0;
      xFlip=true;
    }
  }
    line(x, y, x+(2*s), y+yFlip);
  line(x, y, x, y+yFlip*2);
}

void mouseClicked() {
  c=random(100);
  colourIndex=0;
  s = int(map(mouseX, 0, width, 5, 40));
  x=0;
  y=0;
  yFlip=s;
  xFlip=true;
  colorMode(RGB,255);
  background(255);
  
  
}

