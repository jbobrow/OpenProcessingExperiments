
void setup() {
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  //size(displayWidth, displayHeight-48);
  //background(0);
}

int x=150;
int y=50;
int nX=6;
int nY=3;
int limY=height-5;
int limX=width-5;

void draw() {

  background(0);
  ellipse(x, y, 10, 10);

  if (y < limY) {
    fill(255, 0, 0);
    //y+=sqrt(round(random(nY)));
    y++;
  }
  else {
    limY=5;
    if (y > limY) {
      //y-=sqrt(round(random(nY)));
      y--;
      fill(255, 255, 0);
    }
    else {
      limY=height-5;
      fill(255, 0, 0);
    }
  }

  if (x < limX) {
    fill(255, 0, 255);
    //x+=sqrt(round(random(nX)));
    x++;
  }
  else {
    limX=5;
    if (x > limX) {
      //x-=sqrt(round(random(nX)));
      x--;
      fill(0, 255, 255);
    }
    else {
      limX=width-5;
      fill(0, 255, 0);
    }
  }
}

