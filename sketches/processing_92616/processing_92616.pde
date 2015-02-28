
int number_of_ellipses=200;
float []elX=new float[number_of_ellipses];
float[] elY =new float[number_of_ellipses];
float []elSpeed=new float[number_of_ellipses];
float gravity = .2;

int currentClick=0;
void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  for (int i=0; i< number_of_ellipses; i++) {
    noStroke();
    fill(0, 200, 0, 100);
    ellipse(elX[i], elY[i], 10, 20);
    stroke(255, 90, 0);
    line(elX[i], elY[i], width/2, width/2);
    elY[i]+= elSpeed[i];
    elSpeed[i] += gravity;
  }
}

void mouseDragged() {
  elX[currentClick]=mouseX;
  elY[currentClick]=mouseY;
  elSpeed[currentClick]=-10;
  currentClick +=1;
  if (currentClick>= number_of_ellipses) {
    currentClick=0;
  }
}
void mousePressed() {

  elX[currentClick]=mouseX;
  elY[currentClick]=mouseY;
  elSpeed[currentClick]=-10;
  currentClick +=1;
  if (currentClick>= 200) {
    currentClick=0;
  }
}




