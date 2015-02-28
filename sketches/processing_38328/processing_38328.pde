
int x=50;
int y=50;
int d=10;
int spacing=50;

void setup () {
  size (500, 500);
  background (0);
}

void draw () {
  smooth();
  fill(255);
  for (int i = 0; i < 450; i = i+spacing) {
    for (int j = 0; j < 450; j = j+spacing) {
      ellipse (x+i, y+j, 5+i/12, 5+i/12);
      fill (0,100-j/10, 100-j/10);
    }
  }
  }

                
                
