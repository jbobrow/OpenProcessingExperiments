
void setup() {
  size(500,500);
  background(255);
  smooth();
}

float r= 200;
int num=17;
float sc=1;
float xpos=0;
float ypos=0;

void draw() {
  scale(sc);
  strokeWeight(10/num);
  background(255);
  float[] xval = new float[num];
  float[] yval = new float[num];
  translate(width/(2*sc)+xpos*20, height/(2*sc)+ypos*20);
  for (int i=0;i<num;i++) {
    xval [i] = r * cos(i*TWO_PI/num);
    yval [i] = r * sin(i*TWO_PI/num);
    fill(0);
    ellipse (xval[i],yval[i],5/sc,5/sc);
  }
  for (int i=0;i<num;i++) {
    for (int j=0;j<num;j++) {
      line (xval[i],yval[i],xval[j],yval[j]);
    }
  }
}

void keyPressed() {
  switch (key) {
    case 'w':
    num+=1;
    break;
    case 's':
    num=max(num-1,0);
    break;
    case 'r':
    r= 200;
    num=17;
    sc=1;
    xpos=0;
    ypos=0;
    break;
    case'+':
    case'=':
    sc=2*sc;
    break;
    case '-':
    case '_':
    sc=sc/2;
    break;
  }
  if (key == CODED) {
    switch (keyCode) {
      case UP:
      ypos-=1;
      break;
      case DOWN:
      ypos+=1;
      break;
      case RIGHT:
      xpos+=1;
      break;
      case LEFT:
      xpos-=1;
      break;
    }
  }
}


