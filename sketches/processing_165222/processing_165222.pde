
int i;
int j;


void setup() {
  size(300,300);
  background(127,129,129);
  stroke(0);

  i = 20;
  j=20;

  
}

void draw(){

  for (int i = 20; i < width; i = i+95) {
    for (int j = 20; j < height; j = j+95) {
     fill(i,j,255);
     rect(i,j,70,70);

    }
  }
 
}


