
int longsnake = 30;
int foodX = int(random(267))*3;
int foodY = int(random(200))*3;
boolean moveleft = false;
boolean moveright = true;
boolean moveup = false;
boolean movedown = false;

int[][] snakepos = new int[10000][2];
void setup() {
  size(800,600);
}
void draw() {
  background(0);
  for(int a = longsnake-1; a>0; a--) {
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
  } else if (snakepos[c][0] >= 797) {
    snakepos[c][0] = 3;
  } else if (snakepos[c][1] <= 0) {
    snakepos[c][1] = 596;
  } else if (snakepos[c][1] >= 597) {
    snakepos[c][1] = 3;
  }
  }
  for(int b = 0; b<longsnake; b++) { //formation
  fill(int(random(255)),int(random(255)),int(random(255)));
  rectMode(CENTER);
  rect(snakepos[b][0], snakepos[b][1], 10, 10);
  }
  fill(255);
  ellipseMode(CENTER);
  ellipse(foodX,foodY,10,10);
  for(int d = 0; d<longsnake-1; d++)
  {
    if (snakepos[0][0] <= foodX + 7 && snakepos[0][0] >= foodX - 7 && snakepos[0][1] <= foodY + 7 && snakepos[0][1] >= foodY - 7) // 5 for leniency
    {
      longsnake += 20;
      println("test");
      foodX = int(random(267))*3;
      foodY = int(random(200))*3;

    }
    if (snakepos[d][0] <= foodX + 5 && snakepos[d][0] >= foodX - 5 && snakepos[d][1] <= foodY + 5 && snakepos[d][1] >= foodY - 5)
    {
      foodX = int(random(267))*3;
      foodY = int(random(200))*3;
    }
  }
  
  for(int e = 3; e<longsnake; e++){
    if (snakepos[0][0] <= snakepos[e][0] + 2 && snakepos[0][0] >= snakepos[e][0] - 2 && snakepos[0][1] <= snakepos[e][1] + 5 && snakepos[0][1] >= snakepos[e][1] - 5)
    {
      longsnake = e;
    }
  }
  
}


void keyPressed() {
  if ((key == 'a' || key == 'A') && moveright == false) {
   moveleft = true;
   movedown = false;
   moveup = false;
 }
 
  if ((key == 'w' || key == 'W') && movedown == false) {
   moveleft = false;
   moveright = false;
   moveup = true;
 }
 
  if ((key == 's' || key == 'S') && moveup == false) {
   moveleft = false;
   moveright = false;
   movedown = true;
 }
 
  if ((key == 'd' || key == 'D') && moveleft == false) {
   moveup = false;
   moveright = true;
   movedown = false;
 }

}




