
int num = 1; 
int speed = 1;
int d = 20;
 
int[] x = new int[100];
int[] y = new int[100];
int codx = 100;
int cody = 200;
 
void setup() {
  size (500, 500);
  smooth();
  ellipseMode (CENTER);
  x[0] = 20* int (random (1, 39));
  y[0] = 20* int (random (1, 39));
}
 
void draw() {
  background (20);
   
  if (x[0] <= 0 || x[0]>= width || y[0]<=0 || y[0]>=height) {
    gameover();
  } else if (keyPressed && (key == CODED)) {
    for (int i = num-1; i>0; i = i-1) {
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    if (keyCode == LEFT) {
      x[0] -= speed*d;
    } else if (keyCode == RIGHT) {
      x[0] += speed*d;
    } else if (keyCode == UP) {
      y[0] -= speed*d;
    } else if (keyCode == DOWN) {
      y[0] += speed*d;
    }
  }
   
  if (x[0]==codx && y[0]==cody) {
    num ++;
    codx = 20 * int (random(1, 39));
    cody = 20 * int (random(1, 29));
  }
   
  fill (212, 255, 203);
  noStroke ();
  for(int i = 0; i < num; i = i+1) {
      rect(x[i], y[i], d, d);
  }
  fill (247, 255, 203);
  rect(codx, cody, d, d);
}
 
void gameover() {
  
  //fill(0);
 //rect(0, 0, width, height);
  fill(255);
  textSize(65);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  fill(255);
  textSize(30);
  text(num, width/2, height/2+100);
}
