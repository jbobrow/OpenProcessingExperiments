
int q = 255;
int[]red = new int[q];
int[]blue = new int[q];
int numCircles=3;
int[] circleX = new int[numCircles];


void setup() {
  size(500, 500);
  for (int x=0; x<q; x++) {
    red[x] = 0;
    blue[x] = 0;
  }
  
  for (int i=0; i<numCircles; i++) {
    circleX[i] = width/4;
  }
}

void draw() {
  background(0);

  for (int x=0; x<q -1; x++) {
    red[x] = red[x+1];
    blue[x] = blue[x+1];
  }

  red[q-1]=mouseX;
  blue[q-1]=mouseY;

  for (int i=0; i<numCircles; i++) {


    for (int x=0; x<q; x++) {
      fill(red[x], 0, blue[x]);
      ellipse(circleX[i], height/2, 40, 40);
    }
  }
}



