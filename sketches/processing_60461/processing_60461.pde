
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
//  randomSeed(0);
  background(0);
  scale(0.2);

  for (float i = 0; i < 360; i = i+1) {
    for (int j = 0; j < 130; j = j+1) {

      translate(i*0.7, i*0.4);
      rotate(radians(j));
      
      fill(random(150,200),50,20);
      rect(width/2, height/2, 50, 50);
    }
  }
}


