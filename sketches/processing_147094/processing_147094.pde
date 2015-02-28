
void setup() {
  size(400, 400);
}

void draw() {

  for (float i=1.1;i<width*1;i=i*1.1) {
    for (float j=1.1;j<height*j;j=j*1.1) {



      stroke(1, 2, 3, 3);
      line(j, i, i, j);

      line(i*3, i, j, j*3);
    }
  }
}



