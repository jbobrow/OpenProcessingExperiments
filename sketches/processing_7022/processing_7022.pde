

int len = 200;
int offset;
float average;
float[] val = new float[len*len];
float[] deriv = new float[len*len];
int oldX,oldY;
float spd=0;

void setup() {
  size(200,200);
  cursor(CROSS);
  oldX = mouseX;
  oldY = mouseY;
}

void draw() {
  spd = 3*sqrt((mouseX-oldX)*(mouseX-oldX)+(mouseY-oldY)*(mouseY-oldY));
  boolean in = ((mouseX > 1) && (mouseX < width-1)) && ((mouseY > 1) && (mouseY < height-1));
  if (in) {
    val[(mouseY+1)*len + mouseX-1] = spd;
    val[(mouseY+1)*len + mouseX] = spd;
    val[(mouseY+1)*len + mouseX+1] = spd;
    val[(mouseY)*len + mouseX-1] = spd;
    val[(mouseY)*len + mouseX] = spd;
    val[(mouseY)*len + mouseX+1] = spd;
    val[(mouseY-1)*len + mouseX-1] = spd;
    val[(mouseY-1)*len + mouseX] = spd;
    val[(mouseY-1)*len + mouseX-1] = spd;
  }
  for (int j=0;j<(len*len);j++) {
    val[j] += deriv[j];
  }
  for (int j=1;j<(len-1);j++) {
    for (int i=1;i<(len-1);i++) {
      offset = len*j+i;
      average = (val[offset-1]+val[offset+1]+val[offset-len]+val[offset+len])/4;
      deriv[offset] -= 0.5*(val[offset]-average);
      deriv[offset] = deriv[offset] * 0.99;
    }
  }
  loadPixels();
  for (int j=0;j<(len*len);j++) {
    pixels[j] = color(int(map((abs(val[j])),0,2,255,0)));
  }
  updatePixels();
  
  oldX=mouseX;
  oldY=mouseY;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    for (int j=0;j<(len*len);j++) {
      val[j]=0;
      deriv[j]=0;
    }
  }
}

