
int numCols=600;
int col;
int j=0;
int width=numCols;
int height=width;
int[] H=new int[numCols];

void setup() {
  smooth();
//  loop();
  frameRate(10);
  size(600, 600);
  background(255);
  stroke(125);
  point(20, 20);
  translate(0, height);
  for (int i=0;i<numCols;i++) {
    H[i]=0;
  }
}

void draw() {
  translate(0,height);
  for (int i=1;i<300;i++) {
    col=floor(random(numCols)); 
    H[col]=max(H[col]+1, H[max(col-1, 0)], H[min(col+1, numCols-1)]);
    point(col, -H[col]);
  }
}


