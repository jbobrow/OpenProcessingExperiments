

int NUM = 150;
float[] birdx = new float[NUM];
float[] birdy = new float[NUM];
float targetX = 350;
float targetY = 150;
float x = targetX;
float y = targetY;
float speedX = 0;
float speedY = 0;

int p = 300;

void setup () {
  size(700, 400);


  for (int i=0; i<NUM; i++) {
    birdx[i] = random((x-50), (x+50));
    birdy[i] = random((y-50), (y+50));
  }
  
  float angle = (float)Math.random() * TWO_PI;
  speedX = cos(angle) * 3;
  speedY = sin(angle) * 3;
}

void draw () {
  frameRate(60);
  background(255);
  fill(0);
  stroke(0);
  strokeWeight(3);



  for (int i=0; i<NUM; i++) {
    point(birdx[i], birdy[i]);
  }


  for (int i=0; i < NUM; i++) {
    birdx[i] += random(-1.5, 1.5);
    birdy[i] += random(-1.5, 1.5);
  }

  for (int i=0; i < NUM; i++) {
    birdx[i] += (x - birdx[i])/7.16;
    birdy[i] += (y - birdy[i])/7.16;

    for (int j=0; j < NUM; j++) if (i != j) {
      
        birdx[i] -= (birdx[j] - birdx[i])/1000;
        birdy[i] -= (birdy[j] - birdy[i])/1000;
      
    }
  }

  if (targetX + speedX > 650 || targetX + speedX < 50)
    speedX *= -1;
  if (targetY + speedY > 350 || targetY + speedY < 50)
    speedY *= -1;

  targetX += speedX;
  targetY += speedY;
  
  x += (targetX - x) / 50;
  y += (targetY - y) / 50;
}
