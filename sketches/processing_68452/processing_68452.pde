
void bball() {

  for (int a = 0; a < num; a++) {
    if (ballxPos[a] >=width || ballxPos[a] <= 0) {
      ballxVel[a] *= -1;
    }
    if (ballyPos[a] >= height || ballyPos[a] <= 0) {
      ballyVel[a] *= -1;
    }

    ballxPos[a] += ballxVel[a];
    ballyPos[a] += ballyVel[a];
    fill(255, 97, 3);
    ellipse(ballxPos[a], ballyPos[a], 35, 35);

    if (dist(xPos, mouseY, ballxPos[a], ballyPos[a]) <= 20) {
      xPos = 1;
    }
  }
}


