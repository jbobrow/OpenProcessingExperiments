

void setup() {
  size(500, 500);

   for (int i = 10; i< 1000; i +=50 ) {
    ellipse(250, i*2, i/5+10, i/5+10);
  }

    for (int j = 10; j< 1000; j +=50 ) {
    ellipse(500-j*2, 250, j/5+10, j/5+10);
  }


 // for (int k = 5; k< 1000; k +=10 ) {
   // ellipse(k, k*2, k/5+10, k/5+10);
// }
}

void draw() {
}

