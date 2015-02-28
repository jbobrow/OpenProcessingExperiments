
//Mut

void setup () {
  size (400, 400);
  background(255);
}


int k = 380;


void draw () {
  fill(0);
  for (int i = 20; i <= 400; i = i + 20) {
      triangle (k-10, i-10, k+10, i+10, k+10, i-10);
      k = k - 20;
    }
  
}
