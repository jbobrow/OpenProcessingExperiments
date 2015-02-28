
int max_x = 500;
int max_y = 500;
int red = 255;
int green = 255;
int mY = 0;
int mX = 0;

void setup() {
  size(max_x,max_y);
  smooth();
}

void draw() {
  background(100);

  for(int y=0; y<max_y; y+=10) {
    for (int x=0; x<max_x; x+=10) {
      fill(color(random(0,red),
                 random(0,green),
                 random(0,255)));
      noStroke();
      rect(x,y,10,10);
    }
  }
}

void mouseClicked() {
    red = 255;
    green = 255;
}

void mouseMoved() {
  if (mX<mouseX && green>0) {
    green-=5;
  } else if (mX>mouseX && green<255 && green!=0) {
    green+=5;
  }
  
  if (mY<mouseY && red>0) {
    red-=5;
  } else if (mY>mouseY && red<255 && red!=0) {
    red+=5;
  }
  mX = mouseX;
  mY = mouseY;
}
