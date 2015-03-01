
int sizeX;
int size = 0;
int coler;
int r;
int r2;

void setup() {
  size(500, 500);
}

void draw() {

  r = int(random(0, 500));  
  r2 = int(random(0, 500));  
  coler = int(random(0, 256)); 
  stroke(coler, 100, 100);
  strokeWeight(5);
  size = size + 50;
  sizeX = sizeX + 50;
  line(sizeX, 0, r2, size);

  if (sizeX >= 500) {
    sizeX = r;
  }

  if (size >= 500) {
    size = 0;
  }
}


