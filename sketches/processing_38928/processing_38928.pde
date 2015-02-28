

int line1 = 10;
int line2 = 10;
int linex = 10;
int liney = 10;
int circle = 10;

int i = 10;


void setup () {


  size (1000, 1000);
  smooth();
  background(255, 145);

  for (int i = 10; i < width; i = i + 20) {
    for (int y = 10; y < height; y = y + 20) {
      line(i, y, i, height);
    }
  }




  for (int liney = 10; liney < height-10; liney = liney + 40) {
    for (int linex = 10; linex < width-10; linex = linex + 40) {
      rect(linex, liney, line1, line2);
      ellipse(linex, liney, circle, circle);
    }
  }
}

/*void setup() {
  size(600,600);
  for(int r = 10; r < 590; r = r + 30) {
    for(int j = 10; j < 590; j = j + 30) {
      rect(r,j,10,10);
    }
  }
}*/


                
                                
