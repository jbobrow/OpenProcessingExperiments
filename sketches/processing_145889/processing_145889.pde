
void setup () {
  size (500, 500);
  background (#000000);
  stroke (10, 255, 200);
  smooth ();
}

int startx=50;
int starty=0;
int endx=500;
int endy = 50;

void draw () {
  for (int i=0; i<500; i=i+25) {
    line (startx+i, starty, endx, endy+i);
  }
}


