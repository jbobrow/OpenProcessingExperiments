
int noOfInvaderRows = 2;        //Number of invaders for one column
int noOfInvaderColumns = 10;    //Number of invaders for one line
int noOfInvaders = noOfInvaderRows * noOfInvaderColumns;
float[][][] invad = new float[noOfInvaderRows ][noOfInvaderColumns ][2];
int noOfBullets = 20;
float[][] bullet = {{-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}, {-100, 0}};
float rx, ry;
float invaderY = 20;
int sz = 20;
int shoot = 0;
int point = 0;

void setup() {
    size(500, 500);
    rx = 240;    //defense
    ry = 480;
    //invaders
    for(int i=0; i<noOfInvaderRows; i++){
        for(int j=0; j<noOfInvaderColumns; j++){
            invad[i][j][0] = invaderY+j*30;
            invad[i][j][1] = invaderY+i*30;
        }
    }

    rectMode(CENTER);
    frameRate(30);
}

void draw() {
    background(225);
    invaders();
    defense();
}

int direction = 0;
float yStep = 20;
void invaders(){
    fill(0, 0, 255);
    for(int i=0; i<noOfInvaderRows; i++){
        for(int j=0; j<noOfInvaderColumns; j++){
            hitCheck(i, j);
            ellipse(invad[i][j][0], invad[i][j][1], sz, sz);
            if(direction == 0){
              if(invad[i][j][0] > 0){
                invad[i][j][0]+=2;
                if(invad[i][j][0] > (width-sz/2)){
                  direction = 1;
                  invaderY += yStep;
                }
              }
            }else{
              if(invad[i][j][0] > 0){
                invad[i][j][0]-=2;
                if(invad[i][j][0] < sz/2){
                  direction = 0;
                  invaderY += yStep;
                }
              }
            }
        }
    }
    if(invaderY >= ry){    //game over
      gameOver();
      text(" You LOSE!", 130, 260);
      
    }
    for(int i=0; i<noOfInvaderRows; i++){
        for(int j=0; j<noOfInvaderColumns; j++){
            invad[i][j][1] = invaderY+i*30;
        }
    }

}

void gameOver(){
  fill(255, 0, 0);
  textSize(48);
  text("Game Over", 130, 210);
}

void hitCheck(int i, int j){
  for(int k=0; k<noOfBullets; k++){
    if(abs(invad[i][j][1] - bullet[k][1])<sz/2){
      if(abs(invad[i][j][0] - bullet[k][0])<sz/2){
        invad[i][j][0] = -100;
        noOfInvaders--;
        point += 100;
      }
    }
  }
  if(noOfInvaders <= 0){
    gameOver();
    text(" You WIN!", 130, 260);
  }
    textSize(12);
    text("POINT ="+point, 20,20);
}

void defense(){
    fill(0, 255, 0);
    rect(rx, ry, sz, sz);
    if(shoot != 0){
        shoot--;
        for(int i=0; i<noOfBullets; i++){
          if(bullet[i][0] < 0){
            bullet[i][0] = rx;
            bullet[i][1] = ry;
            break;
          }
        }
    }
    for(int i=0; i<noOfBullets; i++){
      if(bullet[i][0] >= 0){
        ellipse(bullet[i][0], bullet[i][1]-=3, 3, 3);
      }
      if(bullet[i][1] < 0){
        bullet[i][0] = -100;
      }
    }
}

void mousePressed() {
    if (mouseButton == LEFT) {
        rx -= 10;
        if(rx < sz/2){
          rx = sz/2;
        }
    } else if (mouseButton == RIGHT) {
        rx += 10;
        if(rx > (width-sz/2)){
          rx = width-sz/2;
        }
    } else {
        shoot++;
    }
}
