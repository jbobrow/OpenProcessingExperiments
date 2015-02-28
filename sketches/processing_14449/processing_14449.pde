
int K;
int x;

void setup () {
  K=500;
  x=0;
  size(750,750);
  background(random(255),random(255),random(255));
}

void draw() {
  x += 1;

  if (x%60 == 0) {
    background(random(255),random(255),random(255));
  }
  fill (255,10);
  ellipse(mouseX,mouseY,K,K);
  if(K > 0) {
    K = K - 1;
  }
}






void mouseClicked() {
  K=500;
}


