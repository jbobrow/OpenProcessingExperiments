
int num = 1;  
int speed = 1;
int d = 20;

int[] x = new int[100];
int[] y = new int[100];
int eggx = 100;
int eggy = 200;

void setup() {
  size (800, 600); //Num: 20 x 15; egg: 20x20
  smooth();
  ellipseMode (CENTER);
  x[0] = 20* int (random (1, 39));
  y[0] = 20* int (random (1, 39)); 
}

void draw() {
  background (20);
  
  if (x[0]<=0 || x[0]>= width || y[0]<=0 || y[0]>=height) {
    gameover();
  } else if (keyPressed && (key == CODED)) {
    for (int i=num-1; i>0; i--) {
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
  
  if (x[0]==eggx && y[0]==eggy) {
    num ++;
    eggx = 20 * int (random(1, 39));
    eggy = 20 * int (random(1, 29));
  }
  
  fill (212, 255, 203);
  noStroke ();
  for(int i=0; i<num; i++) {
      ellipse (x[i], y[i], d, d);
  }
  fill (247, 255, 203);
  ellipse (eggx, eggy, d, d);
}

void gameover() {
  fill (240, 40, 40);
  textSize (65);
  textAlign(CENTER);
  text ("Game Over", width/2, height/2);
  fill (255);
  textSize (30);
  text (num, width/2, height/2+100);
}
      

