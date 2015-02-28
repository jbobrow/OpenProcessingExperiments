
//http://processing.org/tutorials/2darray/

int num;
int cols =15;
int rows =10;

float[][] r = new float[cols][rows];
float[][] g = new float[cols][rows];
float[][] b = new float[cols][rows];

float[][] r1 = new float[cols][rows];
float[][] g1 = new float[cols][rows];
float[][] b1 = new float[cols][rows];

void setup() {
  size(800, 600);
  frameRate(10);
}
void draw () {
  noStroke();
  if (mousePressed) {
    for (int i =0; i <cols; i++) {
      for (int j =0; j < rows; j++) {
        fill(r1[i][j], g1[i][j], b1[i][j]);
        rect(i*100, j*100, 100, 100);
      }
    }
  }else {
    for (int i =0; i < cols; i++) {
      for (int j =0; j < rows; j++) {
        r[i][j]= random (255);
        g[i][j]= random(255);
        b[i][j]= random(255);
        r1[i][j] =  r[i][j];
        g1[i][j] = g[i][j];
        b1[i][j] = b[i][j];
        fill(r[i][j], g[i][j], b[i][j]);
        rect(i*100, j * 100, 100, 100);
      }
    }
  }
}
