
void setup() {
  size(400,700);
  smooth();
  background(50);
}

void draw() {
  frameRate(6);
  background(0);
  int r = int(random(255));
  int x = int(random(400));
  int y = int(random(700));
  
  for (int i = 0; i < 20; i++) {
      stroke(r, r/1.7, r/4);
      strokeWeight(1.3);
      line(i, i*1.8, r, r*1.8);
      line(i, i*2.3, r, r*2.3);
      line(i, i*2.6, r, r*2.6);
  }
  circles(x, y, r);
  
}


void circles(int x, int y, int r){  
  for(int j = 0; j < 30; j++) {
    for(int k = 0; k < 50; k++) {
      noStroke();
      int col = int(random(150, 255));
      int op = int(random(1, 40));
      fill(col);
      ellipse(x , y , j, j);
      ellipse(y , x , j/2, j/2);
      ellipse(y + 300 , x + 300 , j/3, j/3);
      ellipse(y - 300 , x - 300 , j/3, j/3);
      ellipse(x * 2 , y * 2 , j/2.5, j/2.5);
      ellipse(x/2 , y/2 , j/4, j/4);



    }
  }
}
  


     



