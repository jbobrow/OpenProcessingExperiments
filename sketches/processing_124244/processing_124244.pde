
int ballCount = 10;
float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] speedX = new float[ballCount];
float[] speedY = new float[ballCount];

void setup() {
  size(600, 600);
  frameRate(100);
  background(255);

  for (int i = 0; i<ballCount; i++) {
    x[i] = mouseX+random(10,590);
    y[i] = mouseY+random(10,590);
    speedX[i] = random(1, 2);
    speedY[i] = random(1, 2);
  }
}

void draw() {
  background(255);
  if (mousePressed) {
  
  for (int i = 0; i<ballCount; i++) {
    stroke(0);  
    ellipse(x[i], y[i], 5, 5);

    for (int j = 0; j<ballCount; j++) { 
      line(x[i], y[i], 300, 250);
    }

    x[i] = x[i]+speedX[i];
    y[i] = y[i]+speedY[i];

    if (x[i]>width)speedX[i] = speedX[i]*-1;
    if (x[i]<0)speedX[i] = speedX[i]*-1;
    if (y[i]>height)speedY[i] = speedY[i]*-1;
    if (y[i]<0)speedY[i] = speedY[i]*-1;
  }
  }

  
  noStroke();
  fill(0);
  ellipse(300, 250, 120, 120);

  if (mousePressed) {
    fill(255);
  ellipse (300,280,10,15);
  }
  
  scale (6);
  fill (255);
  ellipse (46, 40, 4, 4);
  ellipse (54, 40, 4, 4);
  fill (0);
  ellipse (map(mouseX, 0, width, 44.5, 47.5), map(mouseY, 0, width, 38.5, 41.5), 2, 2);
  ellipse (map(mouseX, 0, width, 52.5, 55.5), map(mouseY, 0, width, 38.5, 41.5), 2, 2);

}



