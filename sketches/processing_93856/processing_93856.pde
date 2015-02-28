
float x;
float y;
float easing = 0.02;
int r = 8;
int gameCase = 1;
int num = 35;
float[] bugx = new float [num];
float[] bugy = new float [num];
int[] bugr = new int [num];
float[] speedx = new float [num];
float[] speedy = new float [num];
float a = 0.05;
 
void setup() {
  size (800, 600);
  smooth();
  ellipseMode (CENTER); 
  for (int i=0; i<num; i++) {
    bugx[i] = random (0, width);
    bugy[i] = random (0, height);
    bugr[i] = int (random (0, 35));
  }
  x = random (0, width);
  y = random (0, height);
}
 
void draw() {
  background (73, 125, 178);
  noStroke();
  fill (0);
  for (int i=0; i<num; i++) {
    ellipse (bugx[i], bugy[i], bugr[i]*2, bugr[i]*2);
  }
  fill (254, 252, 150);
  ellipse (x, y, r*2, r*2); 
  for (int i=0; i<num; i++) {
    float z=(bugx[i]-x)*(bugx[i]-x)+(bugy[i]-y)*(bugy[i]-y)-(bugr[i]+r)*(bugr[i]+r);
    if (z<0 && bugr[i]>r) {
      gameCase = 0;
    }
  } 
  if (gameCase == 0) {
    gameover();
  } else {
    float targetX = mouseX;
    float targetY = mouseY;
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;
      for (int i=0; i<num; i++) {
      move (i);
    }
  } 
  for (int i=0; i<num; i++) {
    if ((bugx[i]-x)*(bugx[i]-x)+(bugy[i]-y)*(bugy[i]-y)-(bugr[i]+r)*(bugr[i]+r)<0 && bugr[i]<r) {
      r = int (sqrt (r*r + bugr[i]*bugr[i]));
      bugr[i] = 0;
    }
  } 
  int sum = 100;
  for (int i=0; i<num; i++) {
    sum += bugr[i];
  }
  if (sum == 100) {
    win();
  }
}
void move(int i) {
    speedx[i] += random (-a, a);
    speedy[i] += random (-a, a);
    bugx[i] += speedx[i];
    bugy[i] += speedy[i];
    if (bugx[i]<-10) {
      bugx[i] += width;
    }
    if (bugx[i] > width+10) {
      bugx[i] -= width;
    }
    if (bugy[i] < -10) {
      bugy[i] += height;
    }
    if (bugy[i] > height+10) {
      bugy[i] -= height;
    }
  }
void gameover() {
  fill (240, 40, 40);
  textSize (65);
  textAlign(CENTER);
  text ("Game Over", width/2, height/2);
}
void win() {
  fill (255);
  textSize (65);
  textAlign(CENTER);
  text ("Congratulations!", width/2, height/2);
  textSize (30);
  text ("Blobs Cleared!", width/2, height/2+50);
}



