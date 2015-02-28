
float wallx1;
float wallx2;
float wally1, wally2;
float birdx, birdy;
float birdlerp;
float top;
float bottom;
float testx = 100;
float testy = 100;
int gameover = 0;
int score;
PFont f;
int m = millis();


void setup() {
  size(900, 600);
  noStroke();
  smooth();
  rectMode(CENTER);
  frameRate(60);

  f = createFont("Dotum-48", 24);
  textFont(f);
  textAlign(CENTER, CENTER);

  birdlerp = height/2;
  wallx1 = width*2;
  wallx2 = width*100;
  score = 0;


  wally1 = random(50, ((height/4)*3)+50);
  wally2 = random(50, ((height/4)*3)+50);
}

/*------------------------------------------------------------------------*/

void draw() {
  background(225); //%90 of white

  /*----------------------------lerp of walls------------------------------*/

  if (wallx1 > width/3) {
    wallx1 = lerp(wallx1, width/4, 0.01);
  }
  else {
    wallx1 = lerp(wallx1, -(width/4)*3, 0.01);
  }

  if (wallx2 > width/3) {
    wallx2 = lerp(wallx2, width/4, 0.01);
  }
  else {
    wallx2 = lerp(wallx2, -(width/4)*3, 0.01);
  }

  /*-------------------wall restart with a new random spot------------------*/

  if (wallx1 < -24) {
    wallx1 = width + 25;
    wally1 = random(50, ((height/4)*3)+50);
  }
  if (wallx2 < -24) {
    wallx2 = width + 25;
    wally2 = random(50, ((height/4)*3)+50);
  }

  /*-------------------------------collision-----------------------------------*/
  if (birdx <= wallx1 + 25 && birdx >= wallx1 - 25) {    //wall 1
    if (birdy <= wally1 - 50 || birdy >= wally1 +50) {
      fill(247, 177, 177);
      score = score - 20;
    }
  }
  else if (birdx <= wallx2 + 25 && birdx >= wallx2 - 25) {    //wall 2
    if (birdy <= wally2 - 50 || birdy >= wally2 +50) {
      fill(247, 177, 177);
      score = score - 20;
    }
  }

  /*----------------------------------birdy-----------------------------------*/

  birdx = width/3;
  birdy = lerp(birdy, birdlerp, 0.1);

  if (birdlerp <= 0) {
    birdlerp = 1;
  }
  if (birdlerp >= height) {
    birdlerp = height-1;
  }
  /*----------------------------------Score-------------------------------------*/

  if (birdx <= wallx1 + 25 && birdx >= wallx1 - 25) {    //wall 1
    if (birdy <= wally1 + 50 || birdy >= wally1 - 50) {
      score = score + 10;
    }
  }
  else if (birdx <= wallx2 + 25 && birdx >= wallx2 - 25) {    //wall 2
    if (birdy <= wally2 + 50 || birdy >= wally2 - 50) {
      score = score + 10;
    }
  }

  if (score < 0) {
    gameover = 1;
  }
  else if (score >= 0) {
    gameover = 0;
  }


  /*-------------------------------movement------------------------------------*/
  if (mousePressed) {
    if (mouseY <= height/2) {
      birdlerp = lerp(birdlerp, 0, 0.01);
      fill(0, 15);
     // rect(width/2, height/4, width, height/2);
    }
    else if (mouseY> height/2) {
      birdlerp = lerp(birdlerp, height, 0.01);
      fill(0, 15);
      //rect(width/2, (height/4)*3, width, height/2);
    }
    else {
      birdlerp = birdlerp;
    }
  }

  /*-----------------------------Draw it all --------------------------------*/

  rect(wallx1, wally1, 50, 100);
  rect(wallx2, wally2, 50, 100);

  if (mouseX <= testx + 25 && mouseX >= testx - 25) {
    if (mouseY >= testy + 50 || mouseY <= testy - 50) {
      fill(247, 177, 177);
    }
  }
  //rect(testx, testy, 50, 100);
  fill(46, 64, 64, 45);
  rect(wallx1, height/2, 50, height);
  rect(wallx2, height/2, 50, height);

  ellipse(birdx, birdy, 20, 20); //bird
  ellipse(birdx, birdlerp, 2, 2);  //point it follows
  //text(score,testx,testy);

  text(score, width/2, height/2-30);

  if (gameover == 1) {
    gameover();
  }
}




void keyPressed() {

  /* if (key == 'w') {
   birdlerp = lerp(birdlerp,0,0.1);
   }
   else if (key == 's') {
   birdlerp = lerp(birdlerp,height,0.1);
   }
   else {
   birdlerp = birdlerp-10;*/
  //}
  if (key == 'p') {
    score = score - score;
  }
  if (key == 'o') {
    score = score - 1000000;
  }
}

void gameover() {

  wallx1 = width*2;
  wallx2 = width*100;


  fill(225);
  rect(width/2, height/2, width, height);

  fill(0, 75);
  text("Game Over", width/2, height/2);
  text("use w and s to move up and down", width/2, (height/8)*6);
  text("press p to reset your score", width/2, (height/8)*7);
}



