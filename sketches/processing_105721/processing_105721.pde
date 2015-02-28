
int ellipseNumb = 100;
float ellipseX[] = new float[ellipseNumb];
float ellipseY[] = new float[ellipseNumb];
float ellipseSize[] = new float[ellipseNumb];


void setup() {

  size(500, 500);
  noStroke();

  
  for (int i = 0; i < ellipseNumb; i++) {
    ellipseX[i] = random(0, width);
    ellipseY[i] = random(0, height);
    colorMode(RGB, 100);
    ellipseSize[i] = random(0, 60);
  }
}

void draw() {

    background(100); 
    for (int i = 0; i < ellipseNumb; i++) {
    fill(i, 100, 200);
    ellipse(ellipseX[i], ellipseY[i], ellipseSize[i], ellipseSize[i]);
 
  }
}
