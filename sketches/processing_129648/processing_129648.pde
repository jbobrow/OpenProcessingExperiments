
int sensorA = 0;
int sensorB = 0;
int sensorC = 0;
  
void setup() {
  size(1000, 1000);
  noStroke();
}

void draw() {
  background(0, 0, 0);
  fill(245);
  rect(325, 500, 350, 500); //neck
  fill(230);
  triangle(325, 750, 325, 1000, 0, 950);//right shoulder
  triangle(0, 950, 325, 1000, 0, 1000);
  triangle(675, 750, 675, 1000, 1000, 950);//left shoulder
  triangle(1000, 950, 675, 1000, 1000, 1000);
  rect(325, 750, 350, 250); //shoulder
  fill(245);
  triangle(325, 750, 675, 750, 500, 825); //neck area in shirt
  fill(255);
  ellipse(500, 400, 480, 650); //face

  // hair, nose, ears
  //nose
  fill(175);
  ellipse (500, 515, 80, 40); // center
  fill(255);
  rect(460, 522, 80, 40);
  fill(245);
  ellipse(500, 485, 50, 50);
  //nostrils
  fill(100);
  ellipse(480, 515, 24, 14); //right
  triangle(468, 515, 468, 522, 492, 522);
  ellipse(520, 515, 24, 14); //left
  triangle(532, 515, 532, 522, 508, 522);
  fill(175);
  triangle(492, 522, 492, 508, 482, 508);
  triangle(508, 522, 508, 508, 518, 508);

  //hair
  fill(160);
  rect(400, 75, 200, 120);
  rect(350, 195, 300, 50);
  triangle(400, 75, 400, 195, 300, 195);
  triangle(600, 75, 600, 195, 700, 195);
  triangle(400, 195, 300, 195, 260, 400);
  triangle(600, 195, 700, 195, 740, 400);
  triangle(260, 415, 265, 250, 300, 225);
  triangle(740, 415, 735, 250, 700, 225);



  //ears
  fill(255);
  ellipse(280, 425, 75, 150);
  ellipse(720, 425, 75, 150);


  //eyes

  if (sensorA <= 100) {
    fill(200);
    ellipse(400, 400, sensorA/20 + 55, sensorA/20 + 45);
    ellipse(600, 400, sensorA/20 + 55, sensorA/20 + 45);
  }
  if (sensorA >= 100 && sensorA <= 180) {
    fill(200);
    ellipse(400, 400, sensorA/2 + 10, sensorA/2);
    ellipse(600, 400, sensorA/2 + 10, sensorA/2);
  }
  if (sensorA >=180) {
    fill(200);
    ellipse(400, 400, sensorA/9 + 80, sensorA/9 +70);
    ellipse(600, 400, sensorA/9 + 80, sensorA/9 +70);
  }

  //inside eye stuff
  fill(160);
  ellipse(400, 400, 35, 35);
  ellipse(600, 400, 35, 35);
  fill(100);
  ellipse(400, 400, 15, 15);
  ellipse(600, 400, 15, 15);

  //eyebrows
  int eyebrowLift = 10;
  fill(160);
  //right
  rect(375, 345-(sensorA/eyebrowLift), 80, 15);
  triangle(375, 345-(sensorA/eyebrowLift), 375, 360-(sensorA/eyebrowLift), 340, 370);
  //left
  rect(545, 345-(sensorA/eyebrowLift), 80, 15);
  triangle(625, 345-(sensorA/eyebrowLift), 625, 360-(sensorA/eyebrowLift), 660, 370);



  //mouth
  int lipSmallerValue = 4;
  int lipLargerValue = 7;
  int lipMoveDown = 30;

  //chin
  fill(255);
  ellipse(500, (sensorB/lipSmallerValue)+670, 126, 76);
  triangle(437, (sensorB/lipSmallerValue)+676, 470, 660, 365, 660); //right
  triangle(563, (sensorB/lipSmallerValue)+676, 530, 660, 635, 660); //left

  //inside mouth
  fill(100);
  triangle(425, (sensorB/lipLargerValue)+ 550+lipMoveDown, 500, (sensorB/lipSmallerValue)+ 575+lipMoveDown, 500, 550+lipMoveDown);
  triangle(575, (sensorB/lipLargerValue)+ 550+lipMoveDown, 500, (sensorB/lipSmallerValue)+ 575+lipMoveDown, 500, 550+lipMoveDown);
  fill(250);
  rect(450, 550+lipMoveDown, 100, 20);

  //lips
  fill(170);
  //lower lip
  ellipse(500, (sensorB/lipSmallerValue)+ 565 +lipMoveDown, 100, 40);
  triangle(425, (sensorB/lipLargerValue)+ 550+lipMoveDown, 460, (sensorB/lipSmallerValue)+ 575+lipMoveDown, 490, (sensorB/lipSmallerValue)+ 550+lipMoveDown); //right
  triangle(575, (sensorB/lipLargerValue)+ 550+lipMoveDown, 540, (sensorB/lipSmallerValue)+ 575+lipMoveDown, 510, (sensorB/lipSmallerValue)+ 550+lipMoveDown); //left
  //upper lip
  triangle(425, (sensorB/lipLargerValue)+ 550+lipMoveDown, 510, 550+lipMoveDown, 480, 525+lipMoveDown); //right
  triangle(425, (sensorB/lipLargerValue)+ 550+lipMoveDown, 475, 550+lipMoveDown, 430, (sensorB/lipLargerValue)+ 555+lipMoveDown);
  triangle(575, (sensorB/lipLargerValue)+ 550+lipMoveDown, 490, 550+lipMoveDown, 520, 525+lipMoveDown); //left
  triangle(575, (sensorB/lipLargerValue)+ 550+lipMoveDown, 525, 550+lipMoveDown, 570, (sensorB/lipLargerValue)+ 555+lipMoveDown);



  //hands
  fill(200);

  rect(sensorC + 50, 150, 200, 500);
  rect((1000-sensorC)-250, 150, 200, 500);
  //Right Arm
  triangle(sensorC+250, 650, sensorC+25, 1000, sensorC-200, 1000);
  triangle(sensorC+50, 650, sensorC+250, 650, sensorC-200, 1000);
  //Left Arm
  triangle((1000-sensorC)-250, 650, (1000-sensorC)-25, 1000, (1000-sensorC)+200, 1000);
  triangle((1000-sensorC)-250, 650, (1000-sensorC)-50, 650, (1000-sensorC)+200, 1000);

  //for loop with grid of shapes when hands are closed

  if (sensorC >= 255) {
    for (int x= 0; x<9; x++) {
      for (int y= 0; y<9; y++) {
        fill(random(250));
        ellipse((x+1)*100, (y+1)*100, 50, 50);
      }
    }
  }

}

void keyPressed(){
  
  //sensorA
  if (key == 'a' && sensorA < 255) {
    sensorA = sensorA + 30;
  }
  if (key == 's' && sensorA > 0){
    sensorA = sensorA - 30;
  }
  
  //sensorB
  if (key == 'b' && sensorB < 255) {
    sensorB = sensorB + 30;
  }
  if (key == 'n' && sensorB > 0){
    sensorB = sensorB - 30;
  }
  
  //sensorC
  if (key == 'c' && sensorC < 255) {
    sensorC = sensorC + 30;
  }
  if (key == 'v' && sensorC > 0){
    sensorC = sensorC - 30;
  }
}

