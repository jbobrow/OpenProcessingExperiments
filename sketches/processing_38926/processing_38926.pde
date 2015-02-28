
int liney1=10;
int liney2=200;
int linex=10;

int linexx1=10;
int linexx2=200;
int lineyy=10;

void setup() {
  size(200, 200);

  //as long as linex fits on the screen draw lines
  while (linex<200) {
    line(linex, liney1, linex, liney2);
    linex=linex+10;
  }
  while (lineyy<200) {
    line(linexx1, lineyy, linexx2, lineyy);
    lineyy=lineyy+10;
  }
  
}

                
                                
