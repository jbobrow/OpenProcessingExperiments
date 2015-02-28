
void setup() {
  size(400, 400);
 
}

void draw() {

  for (float i=1.1;i<width;i=i*1.1) {
    for (float j=1.1;j<height;j=j*1.1) {

   strokeWeight(2);
      fill(0, i*j, j, 3);
      rect(i*1.5, i*1.5, j, j);

    }
  }
}



