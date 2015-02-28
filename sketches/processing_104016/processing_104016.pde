
int cols = 9;
int rows = 9;
int [][]data=new int[cols][rows];
int switchNum;
int xx,yy;

void setup() {
  size(310, 300);
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0 ; i< cols; i++) {
    for (int j = 0; j< rows; j++) {
      data[i][j]=(i+1)*(j+1);
      fill(#2FC8CB);
      textSize(10);
      text(data[i][j], (i+1)*30, (j+1)*30);
      if (switchNum==1) {   
          fill(255, 1);
          rect(xx, 0, 20, height);
          rect(0, yy, width, 20);       
      }
    }
  }
}

void mousePressed() {
    for (int i = 0 ; i< cols; i++) {
    for (int j = 0; j< rows; j++) {
      if (dist(mouseX, mouseY, (i+1)*30, (j+1)*30)<20) {
          println(dist(mouseX, mouseY, (i+1)*30, (j+1)*30));
           xx=(i+1)*30-4;
           yy = (j+1)*30-12;
           switchNum=1;
        }
      }
}
}


