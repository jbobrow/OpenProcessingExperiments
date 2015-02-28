
int home = 0;
int longsnake = 30;
int foodX = int(random(267))*3;
int foodY = int(random(200))*3;
boolean moveleft = false;
boolean moveright = true;
boolean moveup = false;
boolean movedown = false;
int redness = 0;

int[][] snakepos = new int[10000][2];
void setup() {
  size(800,600);
  for(int f = 0; f < longsnake; f++) {
    snakepos[f][0] = 400;
  snakepos[f][1] = 300;
}
}
void draw() {
  if(redness > 0) {
    redness --;
  }
  
  background(redness, 0, 0);
  for(int a = longsnake+19; a>0; a--) {
    snakepos[a][0] = snakepos[a-1][0];
    snakepos[a][1] = snakepos[a-1][1];
  }
  if(moveleft == true) { //movement
    snakepos[0][0] -= 3;
  } else if(moveright == true) {
    snakepos[0][0] += 3;
  } else if(moveup == true) {
    snakepos[0][1] -= 3;
  } else if(movedown == true) {
    snakepos[0][1] += 3;
  }
  for (int c = 0; c < longsnake; c++) {
  if(snakepos[c][0] <= 0) { //limitations, makes snake start at bottom
    snakepos[c][0] = 796;
    longsnake = longsnake/2;
    redness = 100;
  } else if (snakepos[c][0] >= 797) {
    snakepos[c][0] = 3;
    longsnake = longsnake/2;
    redness = 100;
  } else if (snakepos[c][1] <= 0) {
    snakepos[c][1] = 596;
    longsnake = longsnake/2;
    redness = 100;
  } else if (snakepos[c][1] >= 597) {
    snakepos[c][1] = 3;
    longsnake = longsnake/2;
    redness = 100;
  }
  }
  for(int b = 0; b<longsnake; b++) { //formation
  fill(int(random(255)),int(random(255)),int(random(255)));
  ellipseMode(CENTER);
  ellipse(snakepos[b][0], snakepos[b][1], 20, 15);
  }
  fill(255);
  ellipseMode(CENTER);
  ellipse(foodX,foodY,20,20);
  for(int d = 0; d<longsnake-1; d++)
  {
    if (snakepos[0][0] <= foodX + 15 && snakepos[0][0] >= foodX - 15 && snakepos[0][1] <= foodY + 15 && snakepos[0][1] >= foodY - 15) // 10 for leniency
    {
      longsnake += 20;
      
      
      foodX = int(random(267))*3;
      foodY = int(random(200))*3;

    }
    if (snakepos[d][0] <= foodX + 7 && snakepos[d][0] >= foodX - 7 && snakepos[d][1] <= foodY + 7 && snakepos[d][1] >= foodY - 7)
    {
      foodX = int(random(267))*3;
      foodY = int(random(200))*3;
    }
  }
  
  for(int e = 3; e<longsnake; e++){
    if (snakepos[0][0] <= snakepos[e][0] + 2 && snakepos[0][0] >= snakepos[e][0] - 2 && snakepos[0][1] <= snakepos[e][1] + 5 && snakepos[0][1] >= snakepos[e][1] - 5)
    {
      longsnake = e;
      redness = 100;
    }
  }
  
  if(longsnake < 3) {
    gameover();
  }
  
}


void keyPressed() {
  if ((key == 'a' || key == 'A' || keyCode == LEFT) && moveright == false) {
   moveleft = true;
   movedown = false;
   moveup = false;
 }
 
  if ((key == 'w' || key == 'W' || keyCode == UP) && movedown == false) {
   moveleft = false;
   moveright = false;
   moveup = true;
 }
 
  if ((key == 's' || key == 'S' || keyCode == DOWN) && moveup == false) {
   moveleft = false;
   moveright = false;
   movedown = true;
 }
 
  if ((key == 'd' || key == 'D' || keyCode == RIGHT) && moveleft == false) {
   moveup = false;
   moveright = true;
   movedown = false;
 }
}

void gameover() {
  exit();
}


