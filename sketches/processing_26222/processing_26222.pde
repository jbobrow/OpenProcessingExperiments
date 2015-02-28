
int x1= 0;
int y1= 50;
int x2= 34;
int y2= 0;
int x3= 65;
int y3= 50;

int lx1= 0;
int ly1= 0;
int lx2= 34;
int ly2= 50;
int lx3= 65;
int ly3= 0;

int counter = 0;

void setup () {
  size (585,600);
  background(#FFFFFF);
  noStroke();
  smooth();
}

void draw() {
  noStroke();
  smooth();
  fill(#000000);
  rect(0, 0, width, height);

  for(int i = 0; i<200; i++) {
    for(int k = 0; k<200; k++) {
      fill (mouseX-i*22, mouseY+k*25, 70, 180);
      triangle(x1+i*65, y1+k*50, x2+i*65, y2+k*50, x3+i*65, y3+k*50);
      }
    }
    
    for(int t = 0; t<200; t++) {
    for(int v = 0; v<200; v++) {
      stroke (mouseX+t*42, mouseY-v*67, 227, 149);
      fill (0, 0, 0, 0);
      triangle(lx1+t*65, ly1+v*50, lx2+t*65, ly2+v*50, lx3+t*65, ly3+v*50);
      }
    }
  }


