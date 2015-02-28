

int timer= 0;
float fx = 200;
float fy = 200;
float ex = 250;
float ey = 250; 
float px = 300;
float py = 300;
float easing = .05;
color pColor = color(#4B9B6F);

void setup() {
  size(500, 500);
  frameRate(24);
}

void draw() {
  background(0);
  bGround();
  food();
  player1();
  collisions();
  
}

void food() {
  //respawn
  timer++;
  if (timer >= 48) {
    fx= random(width);
    fy= random(height);
    timer= 0;
  }
  fill(#F1FC59);
  ellipse(fx, fy, 30, 30);
}

void player1() {
  float targetX = mouseX;
  float targetY = mouseY;
  px += (targetX - px) * easing;
  py += (targetY - py) * easing;
  fill(165, mouseX, 15);
  ellipse(px, py, 30, 30);
}

void collisions() {
  float pDist = dist(px, py, fx, fy);
  if (pDist <= 30) {
    pColor = color(#9B251B);
  }
  else {
    pColor = color(#4B9B6F);
  }
}

void bGround() {
  for (int i = 0; i < width; i += 50) {
    for (int j = 0; j < height; j += 50) {
      fill(#EBA1FC);
      rect(i, j, 50, 50);
  }
}
}








