
float c=2;
float speed=10;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  for (int i=0; i<50; i++) {
    if (i<10) {
      stroke (255, 0, 0);
    } else if (i>=10 && i<30){
   stroke (0,255,0);
  } else {

      stroke (0);
    }
    c=c+speed;
    noFill();
    ellipse(i*50, i*50, c, c);
  }
}

