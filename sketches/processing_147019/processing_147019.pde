
int num = 40; 
int[] x = new int[num];
int[] y = new int[num];
int indexPosition = 0;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  frameRate(30);
}

void draw() {
  int k = 55;
  int j = 55;
  int h = 112;
  int a;
  
  background(255);
 if (key =='1') {
        background(255);
        k = 55;
        j = 55;
       h = 112;
  }
  if (key =='2') {
    background(0);
       k = 120;
       h = 112;
  }
  if (key =='3') {
    background(160,0,20);
        k = 120;
        j = 255;
        h = 112;
  }
    if (key =='4') {
    background(160,160,20);
        k = 190;
        j = 190;
        h = 190;
  }
    if (key =='5') {
    background(51,153,204);
        k = 250;
        j = 250;
        h = 190;
  }

  x[indexPosition] = mouseX;
  y[indexPosition] = mouseY;

  indexPosition = (indexPosition + 1) % num;

a = mouseY % 200;

      fill(j,112,mouseX/2-50);
      
      if(mousePressed) {
      if(a > 100) {
      fill(k,h,mouseX/2-50);
      }
      if(a < 100) {
      fill(j,190,mouseX/2-50);
      }
      }
      
      float plus = 0;
        plus = 15;

  for (int i = 0; i<num; i++) {
    int pos = (indexPosition +i) % num;
    float radius = (num-i);
//center
ellipse(x[pos], y[pos], radius-15, radius-15);
//cross
ellipse(x[pos], y[pos]+i*2, radius-plus, radius-plus);
ellipse(x[pos]+i*2, y[pos], radius-plus, radius-plus);
ellipse(x[pos]-i*2, y[pos], radius-plus, radius-plus);
ellipse(x[pos], y[pos]-i*2, radius-plus, radius-plus);
//xline
ellipse(x[pos]-i*2, y[pos]-i*2, radius-plus, radius-plus);
ellipse(x[pos]+i*2, y[pos]+i*2, radius-plus, radius-plus);
ellipse(x[pos]-i*2, y[pos]+i*2, radius-plus, radius-plus);
ellipse(x[pos]+i*2, y[pos]-i*2, radius-plus, radius-plus);
//smaller cross
ellipse(x[pos]-i, y[pos]-i, radius-plus, radius-plus);
ellipse(x[pos]+i, y[pos]+i, radius-plus, radius-plus);
ellipse(x[pos]-i, y[pos]+i, radius-plus, radius-plus);
ellipse(x[pos]+i, y[pos]-i, radius-plus, radius-plus);
  }
}

