


float col1;
float col2;
float col3;
float armLX;
float armLY;
float armRX;
float armRY;

//int used to generate a chance of spawning something
int randomNum;
//for staffs
int randomNum2;
//for eye
int randomNum3;

//used for saving multiple files
int counter;

//currentcol holds the attributes from the randomly generated
//colours
//
float[] currentCol = new float[3];
float[] currentPos = new float[4];


void setup() {
  size(500, 500);

  smooth();

}

void eyes1() {

  //randomise spawning of eyes (set 1, set 2) and mouth
  //left eye
  fill(0);
  ellipse(width/2-85, height/2-70, 20, 35);
  fill(255);
  ellipse(width/2-92, height/2-80, 10, 10);

  //right eye
  fill(0);
  ellipse(width/2-45, height/2-75, 20, 35);
  fill(255);
  ellipse(width/2-53, height/2-85, 10, 10);
}
void eyes2() {
  fill(0);
  ellipse(width/2-85, height/2-70, 20, 35);
  fill(255);
  ellipse(width/2-92, height/2-80, 10, 10);

  //right eye
  fill(0);
  ellipse(width/2-45, height/2-75, 20, 35);
  fill(255);
  ellipse(width/2-53, height/2-85, 10, 10);  

  fill(currentCol[0], currentCol[1], currentCol[2]);
  triangle(width/2-100, height/2 -80, width/2 -60, height/2 -75, width/2 - 80, height/2 - 100);

  fill(currentCol[0], currentCol[1], currentCol[2]);
  triangle(width/2-90, height/2 -80, width/2 -80, height/2 -75, width/2 - 25, height/2 - 100);
}

void eyes3() {
  //if eyes 3, no mouth
  fill(255);
  ellipse(width/2-55, height/2 - 60, 100, 100);
  fill(currentCol[0], 255, currentCol[2]);
  ellipse(width/2-45, height/2 - 70, 50, 50);
  fill(255);
  ellipse(width/2-55, height/2 - 85, 20, 20);
}
void mouth1() {
  // width/2  -7,height/2 +48
  fill(50, currentCol[1], currentCol[2]);
  beginShape(TRIANGLES);
  vertex(width/2-55, height/2-55);
  vertex(width/2 -80, height/2-50);
  vertex(width/2-60, height/2-20);
  endShape();
}

void mouth2() {
  fill(0, currentCol[1]-100, currentCol[2]-100);
  ellipse(width/2 -65, height/2 -30, 20, 35);
}
void sword() {
  fill(50, 50, 50);
  //handle
  rect(width/2-currentPos[0] - 20, height/2-currentPos[1]-35, 10, 30);

  //blade
  fill(200);
  rect(width/2- currentPos[0] -25, height/2 -currentPos[1]-132, 20, 100);

  fill(50, 50, 50);
  rect(width/2-currentPos[0] - 30, height/2 - currentPos[1] -35, 30, 10);
}
void staff() {
  fill (#FF3399);
  rect(width/2-currentPos[0] - 15, height/2 - currentPos[1] -120, 10, 120);

  fill(255);
  rect(width/2-currentPos[0] - 15, height/2 - currentPos[1] -120, 10, 10);
  rect(width/2-currentPos[0] - 15, height/2 - currentPos[1] -100, 10, 10);
  rect(width/2-currentPos[0] - 15, height/2 - currentPos[1] -80, 10, 10);
  rect(width/2-currentPos[0] - 15, height/2 - currentPos[1] -60, 10, 10);
  rect(width/2-currentPos[0] - 15, height/2 - currentPos[1] -40, 10, 10);
  rect(width/2-currentPos[0] - 15, height/2 - currentPos[1] -20, 10, 10);

  fill(#FFFF00);
  ellipse(width/2-currentPos[0]-10, height/2-currentPos[1]-120, 30, 30);
  fill(255);
  ellipse(width/2-currentPos[0]-13, height/2-currentPos[1]-125, 10, 10);
}
void hat() {
  fill(currentCol[0] -80, currentCol[1] -80, currentCol[2] - 80);
  ellipse(width/2-50, height/2 - 140, 50, 50);
  ellipse(width/2-10, height/2 - 130, 50, 50);
  ellipse(width/2+30, height/2 - 110, 50, 50);
  ellipse(width/2+30, height/2 - 150, 50, 50);
  ellipse(width/2, height/2 - 160, 50, 50);
  ellipse(width/2-25, height/2 - 165, 50, 50);
}
void hat2() {
  fill(currentCol[0]-100, 155, currentCol[2] - 100);
  beginShape();
  vertex(width/2, height/2-125);
  vertex(width/2-30, height/2-180);
  vertex(width/2+10, height/2-220);
  vertex(width/2-60, height/2-180);
  vertex(width/2-60, height/2-130);
  endShape();

  fill(currentCol[0]+150, currentCol[1]+150, currentCol[2]+150);
  ellipse(width/2, height/2-215, 30, 30);
}

void kirby() {
  randomNum =int(random(0, 100));
  randomNum2 = int(random(0, 100));
  randomNum3 = int(random(0, 100));
  noLoop();
  col1 = random(255);
  col2 = random(255);
  col3 = random(255);
  armLX = random(105, 115);
  armLY = random(5, 70);
  armRX = random(-40, -65);
  armRY = random(-10, 85);
  currentPos[0] = armLX;
  currentPos[1] = armLY;
  currentPos[2] = armRX;
  currentPos[3] = armRY;
  currentCol[0] = col1;
  currentCol[1] = col2;
  currentCol[2] = col3;
  noStroke();
  //Background
  fill(random(255),random(255),random(255));
  rect(0, 0, 500, 500);
  //armLeft
  fill(currentCol[0]-30, currentCol[1]-30, currentCol[2]-30);
  ellipse(width/2 - currentPos[0], height/2 - currentPos[1], 55, 55);
  fill(currentCol[0], currentCol[1], currentCol[2]);
  ellipse(width/2 - currentPos[0]-3, height/2 - currentPos[1]-3, 50, 50);

  //leg left
  fill(currentCol[0]-30, currentCol[1]+90, currentCol[2]-30);
  ellipse(width/2 -90, height/2 +10, 95, 55);
  fill(currentCol[0], currentCol[1]+130, currentCol[2]);
  ellipse(width/2 -90, height/2+5, 90, 50);

  //Body

  fill(currentCol[0]-30, currentCol[1]-30, currentCol[2]-30);
  ellipse(width/2-35, height/2 - 60, 150, 150);
  fill(currentCol[0], currentCol[1], currentCol[2]);
  ellipse(width/2-35, height/2 - 65, 145, 145);
  print (currentCol);

  //rightleft
  fill(currentCol[0]-30, currentCol[1]+90, currentCol[2]-30);
  ellipse(width/2  -7, height/2 +48, 60, 100);
  fill(currentCol[0], currentCol[1]+130, currentCol[2]);
  ellipse(width/2-10, height/2+38, 55, 95);


  //Right arm
  fill(currentCol[0]-30, currentCol[1]-30, currentCol[2]-30);
  ellipse(width/2 - currentPos[2], height/2 - currentPos[3], 60, 60);
  fill(currentCol[0], currentCol[1], currentCol[2]);
  ellipse(width/2 - currentPos[2]-3, height/2 - currentPos[3]-3, 55, 55);
  //currentCol[2] = col3;
  // ellipse(width/2 - 100,height/2 - 60,50,50);
  noLoop();
}

void draw() {

  
  if (keyPressed) {
      if (key == ENTER) {
       counter++;
      String fileName = "myKirby-"+nf(counter,3)+".png";
      save(fileName);
      }
  
    }
  
  if (mousePressed && (mouseButton == LEFT)) {
    int randomNum = int (random(0, 100));
    kirby();
    // eyes1();
    // mouth1();
    //eyes3();
    // mouth2();
    //eyes2();
    //sword();
    // staff();
    //hat2();
    //hat();
  }
  if (mousePressed && (mouseButton == LEFT)) {
    //chances of drawing each item
    //  if (randomNum >80){
    // eyes3();
    //  mouth1(false);
    //  mouth2(false);

    if (randomNum<= 50) {
      eyes1();
    }
    else { 
      eyes2();
    }
    if (randomNum<=50) {
      mouth1();
    }
    else {
      mouth2();
    }

    if (randomNum >=75) {
      hat();
    }
    if (randomNum <=25) {
      hat2();
    }
    if (randomNum2 >=80) {
      sword();
    }
    else if (randomNum2 <=20) {
      staff();
    }
    if (randomNum3 <=24) {
      eyes3();
    }
    }
}

void mouseReleased() {
  loop();
}


