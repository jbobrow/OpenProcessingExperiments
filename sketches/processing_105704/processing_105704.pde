
int cols;
int rows;

int size;
color c;

boolean click=false;

void setup() {
  size(640, 480);
  smooth();

  size=20;

  cols = width/size;
  rows = height/size;
}

void draw() {
  background(255);


  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*size;
      int y = j*size;

      c=int(random(255));
      
      if (click == true) {
        c+=200;
      }

      fill(c);
      stroke(0);
      rect(x, y, size, size);

    }
  }
}


void mousePressed() {
  click= true;
}



