
int n = 50000;

int clrsN=5;
int[] numbers=new int[clrsN];
int[] allNumbers= {
  2, 3, 5, 7, 11, 13, 17, 19,21,23,27
};
color defaultC;
color  colors[]=new int[clrsN];

void setup() {
  size(800, 800);
  noStroke();
  smooth();
  create();
}

void create() {
  setNumbers();
  background(0);
  for (int i=0; i<n; i++) {
    float    phi= sqrt(i)*TWO_PI;
    float r= sqrt(i*PI);
    boolean found=false;
    for (int j=0; j < clrsN;j++)
      if (i%numbers[j] ==0) {
        fill(colors[j]);
        found=true;
        break;
      }
    if (!found)
      fill(defaultC);
    ellipse(width/2+cos(phi)*r, height/2+sin(phi)*r, 5, 5);
  }
}


void mousePressed() {
  if (mouseButton==RIGHT)
    saveFrame();
  create();
}


void setNumbers() {
  for (int i=0; i<clrsN; i++) {
    numbers[i] = allNumbers[(int) random(allNumbers.length)];
    colors[i] = color((int) random(256), (int) random(256), (int) random(256));
  }
  defaultC= color((int) random(256), (int) random(256), (int) random(256));
}

void draw() {
}



