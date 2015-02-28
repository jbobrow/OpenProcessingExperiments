

float[] enemyPosY = new float[5];
float[] enemyPosX = new float[5];

PVector playerPos = new PVector(width/2, height/2);

PVector coin = new PVector(0, 0);
PVector gravity = new PVector(0, 0);
PVector gravEnemyPos = new PVector(width/2, height/2);
PVector gravSpeed = new PVector(0.5, 0.5);
PVector playerWeight = new PVector(0.25, 0.25);

float gravDistance;
float enemySpeed = 2;
float playerSize = 25;
float distance;
float ySpeed = 0.001; 
float acc;
float xSpeed = 0.001; 
float xacc;
float cutoff = 1;
float distFix = 2;
float pull = 5000;

float bgx; //background X
float bgy; //background Y
float R, G, B;
float prevR = 200;
float prevG = 200;
float prevB = 200;
float deadX ,deadY;
float deadPosX, deadPosY;

int score;
Boolean dead = false;

void setup() {
  size(800, 800);

  strokeWeight(3);

  for (int i = 0; i < 5; i++) {
    enemyPosY[i] = random(0, height);
    enemyPosX[i] = random(-1200, -500);
  }

  R = random(0, 255);
  G = random(0, 255);
  B = random(0, 255);
  coin.x = random(0, width);
  coin.y = random(0, height);
  playerPos.x = width/2;
  playerPos.y = height/2;
  gravEnemyPos.x = random(-200, -1000);
  gravEnemyPos.y = random(0, height);
}

void draw () {
  fill(200, 200, 200);
  background(prevR, prevG, prevB);
  fill(R, G, B);
  if(dead == false){
  rect((width/2)-bgx/2, (height/2)-bgy/2, bgx, bgy);
  bgx += 20;
  bgy += 20;
  }
  if (bgx>(width)) {
    bgx = 0;
    bgy = 0;
    prevR = R;
    prevG = G;
    prevB = B;
    R = random(0, 255);
    G = random(0, 255);
    B = random(0, 255);
  }

  //
  // MAKE THE PLAYER
  //
  //line(mouseX, mouseY, playerPos.x, playerPos.y);       
  smooth();
  fill(100, 100, 100);
  ellipse(playerPos.x, playerPos.y, playerSize, playerSize);

  //
  // PLAYER SPRING
  //
  acc = (-(playerWeight.y)*(playerPos.y - mouseY))/15;       
  ySpeed += acc;                      
  ySpeed *= 0.95;                     
  playerPos.y += ySpeed/3;

  xacc = (-(playerWeight.x)*(playerPos.x - mouseX))/15;
  xSpeed += xacc;
  xSpeed *= 0.95;
  playerPos.x += xSpeed/3;


  //
  // BOUNDARIES FOR PLAYER
  //
  if (playerPos.x < -10) {
    playerPos.x = (-9);
    xSpeed *= -0.8;
  }
  if (playerPos.x > (width)) {
    playerPos.x = (width-1);
    xSpeed *= -0.8;
  }
  if (playerPos.y < 0) {
    playerPos.y = 1;
    ySpeed *= -0.6;
  }
  if (playerPos.y > height) {
    playerPos.y = (height-1);
    ySpeed *= -0.6;
  }


  //
  // MOVING ENEMIES
  //
  for (int i = 0; i < 5; i++) {
    fill(100, 100, 100);
    rect(enemyPosX[i], enemyPosY[i], 15, 15);
    enemyPosX[i] += enemySpeed;
    if (enemyPosX[i] > width) {
      enemyPosY[i] = random(0, height);
      enemyPosX[i] = random(-900, 0);
    }
    //
    // DETECTING HITS
    //
    distance = (dist(playerPos.x, playerPos.y, enemyPosX[i], enemyPosY[i])) + distFix;
    if (distance < playerSize) {
      // println("HIT");
      fill(255, 0, 0);
      ellipse(playerPos.x, playerPos.y, playerSize, playerSize);
      enemyPosY[i] = random(0, height);
      enemyPosX[i] = random(-900, 0);
      if (dead == false) {
        score -= 5;
      }
    }
  }

  //
  // ORBITING ENEMIES
  //
  fill(150, 0, 0);
  rect(gravEnemyPos.x, gravEnemyPos.y, 20, 20);
  gravDistance = (playerPos.dist(gravEnemyPos)) + distFix;

  gravity.x = (((playerPos.x - gravEnemyPos.x))/pow(gravDistance, 3))*pull;
  gravity.y = (((playerPos.y - gravEnemyPos.y))/pow(gravDistance, 3))*pull;

  gravSpeed.add(gravity);
  gravEnemyPos.add(gravSpeed);

  if (gravSpeed.x > cutoff) {
    gravSpeed.x = cutoff;
  }
  if (gravSpeed.y > cutoff) {
    gravSpeed.y = cutoff;
  }
  if (gravSpeed.x < -cutoff) {
    gravSpeed.x = -cutoff;
  }
  if (gravSpeed.y < -cutoff) {
    gravSpeed.y = -cutoff;
  }

  if (gravDistance < playerSize) {
    gravEnemyPos.x = random(-200, -1000);
    gravEnemyPos.y = random(0, height);
    deadPosX = playerPos.x;
    deadPosY = playerPos.y;
    dead = true;
  }
  if (dead == true) {
    rect(deadPosX-(deadX/2), deadPosY-(deadY/2), deadX, deadY);
    deadX += 15;
    deadY += 15;
    coin.x = 1000;
    if (deadX > width) {
      fill(255, 255, 255);
      textSize(100);
      text("SCORE", 240, 300);
      text(score, 340, 500);
    }
  }


  //
  // COINS
  //
  fill(255, 255, 0);
  ellipse(coin.x, coin.y, 15, 15);
  distance = (playerPos.dist(coin))+distFix;
  if (distance < playerSize) {
    // println("COIN");
    fill(255, 255, 0);
    ellipse(playerPos.x, playerPos.y, playerSize, playerSize);
    coin.y = random(0, height);
    coin.x = random(200, width);
    enemySpeed += 0.05;
    playerSize += 1.5;
    playerWeight.x -= 0.003;
    playerWeight.y -= 0.003;
    distFix += 0.75;
    cutoff += 0.06;
    pull += 500;
    score += 1;
  }
  if (dead == false) {
    fill(255);
    textSize(32);
    text(score, 20, 790);
  }
}



