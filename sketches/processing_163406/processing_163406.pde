
void setup() {

  size(400, 400);

  background(255);

  fill(0);

  noStroke();
  

}

void draw() {

  for (int i=0; i<=400; i+=30) {

    for (int j=0; j<=400; j+=30) {
      
      ellipse(i, j, dist(i, j, 200, 200)/8, dist(i, j, 200, 200)/8);

    }

  }

}
