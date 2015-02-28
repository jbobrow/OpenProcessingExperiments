
int [] circleX = {
  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610
};

int [] circleY = {
  50, 20, 5, 100, 50, 550, 400, 170, 300, 70, 350, 210, 510
};

int [] speedX = {
  5, 20, 12, 16, 8, 14, 30, 6, 2, 13, 7, 3, 9
};
  
int [] speedY = {
  9, 3, 7, 13, 2, 6, 30, 14, 8, 16, 12, 20, 5
};


void setup () {

  size (800, 610);
  noStroke ();
  smooth ();
 
}

void draw () {
  background (40);

  for (int i=0; i < 13; i++) {
    fill (random(255), random (255), 255);
    ellipse (circleX[i], circleY[i], 40, 40);
  
    circleX[i] += speedX[i];
    circleY[i] += speedY[i];


  if ((circleX[i] >= 800) || (circleX[i] <= 0)) {
    speedX[i] *= -1;
  }

  if ((circleY[i] >= 600) || (circleY[i] <= 0)) {
    speedY[i] *= -1;
  }
}
}


