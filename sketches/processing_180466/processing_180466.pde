
int count = 0;
int num1 = 0;
int num2 = 0;
int currentScene = 0;
//int counter = 0;
int newNum = 0;
//PImage img;
int[] xPositions = {600,10,200,400, 100, 300, 399, 280,50, 140, 330,170, 380, 250, 500,400, 80,550};
int[] yPositions = {380,100,0,250,-80, 300, 200, 390,-20, 120, 50, 180,-40, 250, 320,320,400, 270 };



void setup() {
  size(630, 400);
  //background(135, 206, 250);
  smooth();
  //img = loadImage("imgSceneNo");
  //sceneOne();
}

void draw() { 
 background(204, 247, 255);
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 15, 15);
      ellipse (440, 70, 15, 15);
      stroke(0);
      strokeWeight(10);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      ellipse(470, 320, 7, 7);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      strokeWeight(4);
      fill(255);
      arc(470, 100, 25, 20, 0, PI);
      fill(255, 165, 0);
      noStroke();
      triangle(460, 95, 470, 75, 480, 95);
      stroke(random(0, 255));
      fill(102, 178, 255);
      rect(50, 70, 120, 30);
      textSize(15);
      fill(0);
      text("Double numbers", 57, 90);
      noStroke();
      fill(204, 204, 255);
      stroke(random(0, 255));
      rect(50, 170, 120, 30);
      fill(0);
      text("Double digit", 57, 190);
      fill(102, 255, 178);
      stroke(random(0, 255));
      rect(50, 270, 120, 30);
      fill(0);
      text("Add/subtract 10", 57, 290);
      textSize(20);
      fill(random(0, 255));
      text("Tap screen to add snowflakes", 100, 380);
      text("Correct answers build a snowman", 100, 40);
      
      
  for(int i = 0; i < xPositions.length; i++) {
    noStroke();
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(xPositions[i], yPositions[i], 25, 25);
    
    yPositions[i] += 1;
    if (yPositions[i] > 599) {
      yPositions[i] = 0;
    }
  }

  if(mousePressed == true) {
    if(mouseX > 10 && mouseX < 180 && mouseY > 60 && mouseY < 120) {
 sceneTwelve(); 
   noLoop();
} else if (mouseX>10 && mouseX < 180 && mouseY > 120 && mouseY < 220){
  sceneOne();
  noLoop(); 
}else if(mouseX > 10 && mouseX <180 && mouseY >220 && mouseY < 340){
  sceneTwentyTwo();
  noLoop();
}
  
 else {
  xPositions.push(mouseX);
  yPositions.push(mouseY);
}
}
counter = 0;
count = 0;
}
void sceneOne() {
 currentScene = 1;
 background(204, 247, 255);
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 noStroke();
 ellipse(200, 100, 100, 100);
 stroke(0);
 strokeWeight(1);
  fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 //ellipse(200, 126, 40, 3);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(10, 100));
  num2 = int(random(1, 9));
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
 
  text((num1 + num2), 80, 340);
  text(num1 + num2 + (int(random(10, 39))),170, 340);
  newNum = ((num1 + num2) - 10);
  if(newNum < 0) {
    newNum = 0;
  }
  text((num1 + num2 - 3), 260, 340);
  
}


void sceneTwo() {
 currentScene = 2;
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
 num1 = int(random(20, 90));
 num2 = int(random(1, 9));
 if(num2 > num1) {
   num2 = num1 - 5;
 }
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text(num1 - num2, 260, 340);
  text((num1 - num2 + 10),170, 340);
  newNum = num1-num2 - (int(random(1, 19))); 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340);
 }

void sceneThree() {
 currentScene = 3;
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(20, 100));
  num2 = int(random(2, 9));
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num2), 80, 340);
  text(num1 + num2 + (int(random(1, 29))),170, 340);
  newNum = (num1+num2) - 10; 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 260, 340);
} 


void sceneFour() {
 currentScene = 4;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(30, 100));
  num2 = int(random(1, 9));
  if(num2 > num1) {
   num2 = num1 - 15;
 }
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 - num2, 170, 340);
  text(((num1 - num2)+ 6), 260, 340);
  newNum = ((num1- num2) + 10); 
  if(newNum < 0) {
    newNum = 1;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340); 
}


void sceneFive() {
 currentScene = 5;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(20, 100));
  num2 = int(random(1, 10));
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 + num2, 170, 340);
  text(((num1 + num2)+10), 260, 340);
  text(num1+num2-4, 80, 340); 
}


void sceneSix() {
 currentScene = 6;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(20, 100));
  num2 = int(random(2, 9));
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 + num2, 260, 340);
  text((num1 + num2)+ (int(random(1, 29))), 170, 340);
  newNum = ((num1+num2) - 10);
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340); 
}


void sceneSeven() {
 currentScene = 7;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
 num1 = int(random(20, 90));
 num2 = int(random(1, 9));
  textSize(27);
  if(num2 > num1) {
   num2 = num1 - 8;
 }
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 - num2), 80, 340);
  text(((num1 - num2) + 10),170, 340);
  newNum = num1 - num2 - (int (random(10, 29)));
  if(newNum < 0) {
    newNum = 0;
  }
  text(num1 + num2 - (int(random(10, 29))), 260, 340);
}

void sceneEight() {
 currentScene = 8;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(10, 100));
  num2 = int(random(2, 9));
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 + num2, 260, 340);
  text((num1 + num2)+ (int(random(1, 29))), 170, 340);
  int newNum = ((num1+num2)-5); 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340); 
}
void sceneNine() {
 currentScene = 9;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(20, 100));
  num2 = int(random(1, 9));
  textSize(27);
  if(num2 > num1) {
   num2 = num1 - 9;
 }
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num2), 80, 340);
  text(num1 + num2 - 10, 260, 340);
  text((num1 + num2)+ (int(random(1, 9))), 170, 340);
  int newNum = ((num1+num2) + 10); 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  //text(newNum, 80, 340); 
}

void sceneTen() {
 currentScene = 10;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(10, 100));
  num2 = int(random(1, 9));
  textSize(27);
  text(num1, 180, 210);
  text(num2, 190, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num2-10), 80, 340);
  text(num1 + num2, 170, 340);
  text(((num1 + num2)- 3), 260, 340);
  int newNum = num1+num2 - (int(random(1, 19))); 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  //text(newNum, 80, 340); 
}
void sceneEleven() {
 currentScene = 11;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
 //num1 = int(random(10, 100));
  //num2 = int(random(10, 100));
  textSize(25);
  //text(num1, 180, 210);
  //text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  //line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  //line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  //text(num1 + num2, 170, 340);
  //text(((num1 + num2)+ 20), 260, 340);
  //int newNum = num1+num2 - (int(random(1, 19))); 
  //if(newNum < 0) {
    //newNum = 0;
  //}
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  //text(newNum, 80, 340); 
  //fill(102, 255, 178);
  //stroke(random(0, 255));
  //rect(400, 380, 120, 30);
  text("You are done", 110, 220);
  text("Tap to go back", 106, 280);
}

void sceneTwelve() {
  currentScene = 12;
  background(204, 247, 255);
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(2, 15));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 80, 340);
  text(((num1+num1)+4), 170, 340);
  text(((num1+num1)-2), 260, 340);
}
void sceneThirteen() {
  currentScene = 13;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(2, 13));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 260, 340);
  text(((num1+num1)+2), 170, 340);
  text(((num1+num1)-2), 80, 340);
}

void sceneFourteen() {
  currentScene = 14;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(1, 15));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 80, 340);
  text(((num1+num1)+4), 170, 340);
  text(((num1+num1)+2), 260, 340);
}

void sceneFifteen() {
  currentScene = 15;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(1, 14));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 170, 340);
  text(((num1+num1)+2), 80, 340);
  text(((num1+num1)+3), 260, 340);
}

void sceneSixteen() {
  currentScene = 16;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(1, 15));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 170, 340);
  text(((num1+num1)+4), 80, 340);
  text(((num1+num1)+6), 260, 340);
}

void sceneSeventeen() {
  currentScene = 17;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(1, 13));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 260, 340);
  text(((num1+num1)+4), 170, 340);
  text(((num1+num1)-2), 80, 340);
}
void sceneEighteen() {
  currentScene = 18;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(2, 15));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 260, 340);
  text(((num1+num1)-4), 170, 340);
  text(((num1+num1)-2), 80, 340);
}

void sceneNineteen() {
  currentScene = 19;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(1, 12));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 170, 340);
  text(((num1+num1)+4), 80, 340);
  text(((num1+num1)-2), 260, 340);
}

void sceneTwenty() {
  currentScene = 20;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(2, 14));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 80, 340);
  text(((num1+num1)+4), 170, 340);
  text(((num1+num1)-2), 260, 340);
}
void sceneTwentyOne() {
  currentScene = 21;
  background(135, 206, 250);
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(1, 15));
  num2 = num1;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num1), 80, 340);
  text(((num1+num1)+4), 170, 340);
  text(((num1+num1)+2), 260, 340);
}
void sceneTwentyTwo() {
  currentScene = 22;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(20, 130));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num2), 170, 340);
  text(((num1+num2)+4), 80, 340);
  text(((num1+num2)+10), 260, 340);
}
void sceneTwentyThree() {
  currentScene = 23;
  background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 ellipse(200, 126, 40, 3);
 fill(255);
  num1 = int(random(10, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text(num1 + num2, 80, 340);
  text(((num1+num2)+30), 170, 340);
  text(((num1+num2)+10), 260, 340);
}

void sceneTwentyFour() {
 currentScene = 24;
 background(204, 247, 255);
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 noStroke();
 ellipse(200, 100, 100, 100);
 stroke(0);
 strokeWeight(1);
  fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 //ellipse(200, 126, 40, 3);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(30, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
 
  text((num1 + num2), 80, 340);
  text((num1 + num2 - 5),170, 340);
  newNum = (num1 + num2 - 20);
  if (newNum < 0) {
    newNum = 10;
  }
  text(newNum, 260, 340);
  
}


void sceneTwentyFive() {
 currentScene = 25;
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
 num1 = int(random(40, 100));
 num2 = 10;
 
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text(num1 - num2, 260, 340);
  text((num1 - num2 + 3),170, 340);
  newNum = (num1-num2 -10); 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340);
 }

void sceneTwentySix() {
 currentScene = 26;
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(50, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num2), 80, 340);
  text((num1 + num2 + 5),170, 340);
  newNum = (num1+num2) + 10; 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 260, 340);
} 


void sceneTwentySeven() {
 currentScene = 27;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(30, 100));
  num2 = 10;
  if(num2 > num1) {
   num2 = num1 - 15;
 }
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 - num2, 170, 340);
  text((num1 - num2-1), 260, 340);
  
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(num1-num2-10, 80, 340); 
}


void sceneTwentyEight() {
 currentScene = 28;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(40, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 + num2, 170, 340);
  text(((num1 + num2)+10), 260, 340);
  newNum = (num1+num2 - 20); 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340); 
}


void sceneTwentyNine() {
 currentScene = 29;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(50, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 + num2, 260, 340);
  text((num1 + num2)+ 20, 170, 340);
  newNum = ((num1+num2) - 2);
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340); 
}


void sceneThirty() {
 currentScene = 30;
 //background(204, 247, 255);
 background(random(160, 255),random(160, 255), random(160, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
 num1 = int(random(70, 100));
 num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 - num2), 80, 340);
  text(((num1 - num2) + 5),170, 340);
  
  text((num1 - num2 - 10), 260, 340);
}

void sceneThirtyOne() {
 currentScene = 31;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(30, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 + num2, 260, 340);
  text((num1 + num2)+ (int(random(1, 9))), 170, 340);
  int newNum = ((num1+num2)-5); 
 
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340); 
}
void sceneThirtyTwo() {
 currentScene = 32;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(50, 100));
  num2 = 10;
  textSize(27);
  if(num2 > num1) {
   num2 = num1 - 9;
 }
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  //line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2), 80, 340);
  text(num1 - num2, 170, 340);
  text((num1 - num2)- (int(random(1, 5))), 260, 340);
  int newNum = (num1-num2-4); 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 80, 340); 
}

void sceneThirtyThree() {
 currentScene = 33;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(60, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  //text((num1 + num2 - 10), 80, 340);
  text(num1 + num2, 80, 340);
  text(((num1 + num2)+ 5), 260, 340);
  int newNum = num1+num2 + 10; 
  if(newNum < 0) {
    newNum = 0;
  }
  //text(num1 + num2 - (int(random(1, 19))), 80, 340);
  text(newNum, 170, 340); 
}
void sceneThirtyFour() {
 currentScene = 34;
 //background(204, 247, 255);
 background(random(150, 255),random(150, 255), random(150, 255));
 fill(255);
 stroke(0);
 rect(50, 150, 300, 230);
 fill(0);
 rect(65, 165, 270, 200);
 fill(255, 234, 0);
 stroke(0);
 strokeWeight(1);
 ellipse(200, 100, 100, 100);
 fill(255);
 ellipse(175, 90, 25, 30);
 ellipse(225, 90, 25, 30);
 fill(0);
 ellipse(175, 97, 15, 15);
 ellipse(225, 97, 15, 15);
 fill(255);
 arc(200, 125, 50, 30, 0, PI);
  num1 = int(random(60, 100));
  num2 = 10;
  textSize(27);
  text(num1, 180, 210);
  text(num2, 180, 250);
  strokeWeight(4);
  stroke(255);
  line(145, 220, 160, 220);
  line(152, 210, 152, 230);
  line(152, 260, 242, 260);
  text((num1 + num2), 80, 340);
  //text(num1 + num2, 170, 340);
  text(((num1 + num2)+ 20), 260, 340);
  int newNum = num1+num2 + (int(random(1, 9))); 
  if(newNum < 0) {
    newNum = 0;
  }
  text(num1 + num2 + 10, 80, 340);
  //text(newNum, 80, 340); 

}


void mouseReleased() {
 counter = counter + 1;
}
int count = 0; 
 int counter = 0;
void mouseClicked() {
  
  if (currentScene == 1) {
    if (mouseX > 10 && mouseX < 160 && mouseY >280 && mouseY <380){
     
      count = count+1;
      sceneTwo();
    stroke(0);
   fill(255,0,0);
      text(count, 50, 50);
      text(counter, 50, 110);
      line(30, 70, 95, 70);
      noStroke();
      fill(255);
      ellipse(470, 80, 110, 110);
      
      fill(0);
      textSize(14);
      textFont(createFont("cursive"));
      text("Great job!", 170, 30);
    } else {
      sceneOne();
      fill(0);
      textSize(14);
     //text("Oopsy, try again!", 150, 30);
  } 
  
  }
  
  
  else if (currentScene == 2) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY <380) {
    count = count + 1;
    sceneThree();
    fill(255, 0, 0);
    stroke(0);
  text(count, 50, 50);
      text(counter, 50, 110);
      line(30, 70, 95, 70);
      fill(255);
      noStroke();
      ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
}else {
  sceneTwo();
  noStroke();
      fill(255);
      ellipse(470, 80, 110, 110);
  fill(0);
  textSize(14);
   text("Oopsy, try again!", 150, 30);
//loop();
}
  }
else if (currentScene == 3) {
  if (mouseX >10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneFour();
    fill(255, 0, 0);
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    stroke(0);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   fill(255,0,0);
   noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
     fill(255, 0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
      fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else {
    sceneThree();
    fill(0);
    textSize(14);
    text("Oopsy, try again!", 150, 30);
    fill(255);
      noStroke();
      ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
  //loop();
}
}
  else if (currentScene == 4) {
  if (mouseX >110 && mouseX < 250 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneFive();
    fill(255, 0, 0);
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //stroke(0);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //fill(0);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //textSize(14);
   //text("Great job!", 170, 30);
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      fill(255, 0, 0);
    text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
      
  }else{
  sceneFour();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
  fill(0);
  textSize(14);
  text("Oopsy, try again!", 150, 30);
  //loop();
} 
   }
   
 else if (currentScene == 5) {
  if (mouseX >110 && mouseX < 250 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneSix();
    fill(255, 0, 0);
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //fill(0);
   //text(count, 50, 70);
   //text(counter, 310, 70);
    //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
       ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
    sceneFive();
    noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
    fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
 }
else if (currentScene == 6) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneSeven();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
       ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      fill(0);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneSix();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
  fill(0);
   ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 7) {
  if (mouseX > 10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneEight();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      fill(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneSeven();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 8) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneNine();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneEight();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      stroke(118, 50, 50);
      strokeWeight(10);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 9) {
  if (mouseX > 10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneTen();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
      
  }else{
  sceneNine();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      ellipse(470, 200, 7, 7);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 10) {
  if (mouseX > 110 && mouseX < 240 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneEleven();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      ellipse(470, 320, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
      fill(255);
      arc(470, 100, 25, 20, 0, PI);
      fill(255, 165, 0);
      noStroke();
      triangle(460, 95, 470, 75, 480, 95);
  fill(0);
      textSize(18);
      text("Great job!", 170, 35);
      //stroke(random(0, 255));
      //fill(102, 255, 178);
      //rect(410, 365, 120, 30);
      //textSize(20);
      //fill(0);
      //text("Back", 440, 380);
      //if(mousePressed == true){
      //draw();
  
  }else{
  sceneTen();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      strokeWeight(10);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
     
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
} else if 
(currentScene == 11) {
  draw();
  loop();
} else if
(currentScene == 12) {
    if (mouseX > 10 && mouseX < 160 && mouseY >280 && mouseY <380){
      count = count + 1;
      sceneThirteen();
    stroke(0);
   fill(255,0,0);
      text(count, 50, 50);
      text(counter, 50, 110);
      line(30, 70, 95, 70);
      noStroke();
      fill(255);
      ellipse(470, 80, 110, 110);
      fill(0);
      textSize(14);
      text("Great job!", 170, 30);
    } else {
      sceneTwelve();
      fill(0);
      textSize(14);
     //text("Oopsy, try again!", 150, 30);
  } 
  }
 else if (currentScene == 13) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY <380) {
    count = count + 1;
    sceneFourteen();
    fill(255, 0, 0);
    stroke(0);
  text(count, 50, 50);
      text(counter, 50, 110);
      line(30, 70, 95, 70);
      fill(255);
      noStroke();
      ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
}else {
  sceneThirteen();
  noStroke();
      fill(255);
      ellipse(470, 80, 110, 110);
  fill(0);
  textSize(14);
   text("Oopsy, try again!", 150, 30);
//loop();
}
  } 
  else if (currentScene == 14) {
  if (mouseX >10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneFifteen();
    fill(255, 0, 0);
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    stroke(0);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   fill(255,0,0);
   noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
     fill(255, 0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
      fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else {
    sceneFourteen();
    fill(0);
    textSize(14);
    text("Oopsy, try again!", 150, 30);
    fill(255);
      noStroke();
      ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
  //loop();
}
}

else if (currentScene == 15) {
  if (mouseX >110 && mouseX < 250 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneSixteen();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      fill(255, 0, 0);
    text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
      
  }else{
  sceneFifteen();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
  fill(0);
  textSize(14);
  text("Oopsy, try again!", 150, 30);
  //loop();
} 
   }
   else if (currentScene == 16) {
  if (mouseX >110 && mouseX < 250 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneSeventeen();
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
       ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
    sceneSixteen();
    noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
    fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
 }   
 else if (currentScene == 17) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneEighteen();
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
       ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      fill(0);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneSeventeen();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
  fill(0);
   ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
} 
else if (currentScene == 18) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneNineteen();
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      fill(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneEighteen();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 19) {
  if (mouseX >110 && mouseX < 250 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneTwenty();
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneNineteen();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      stroke(118, 50, 50);
      strokeWeight(10);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 20) {
  if (mouseX > 10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneTwentyOne();
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      //ellipse(470, 320, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneTwenty();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      ellipse(470, 200, 7, 7);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 21) {
  if (mouseX > 10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneEleven();
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      ellipse(470, 320, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
      fill(255);
      arc(470, 100, 25, 20, 0, PI);
      fill(255, 165, 0);
      noStroke();
      triangle(460, 95, 470, 75, 480, 95);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneTwenty();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 22) {
    if (mouseX > 110 && mouseX < 250 && mouseY >280 && mouseY <380){
     counter = 0;
      counter = counter + 1;
     count = count+1;
      sceneTwentyThree();
    stroke(0);
   fill(255,0,0);
      text(count, 50, 50);
      text(counter, 50, 110);
      line(30, 70, 95, 70);
      noStroke();
      fill(255);
      ellipse(470, 80, 110, 110);
      
      fill(0);
      textSize(14);
      text("Great job!", 170, 30);
    } else {
      sceneTwentyTwo();
      fill(0);
      textSize(14);
     //text("Oopsy, try again!", 150, 30);
  } 
  
  }
  
  
  else if (currentScene == 23) {
  if (mouseX > 10 && mouseX < 160 && mouseY > 280 && mouseY <380) {
    count = count + 1;
    sceneTwentyFour();
    fill(255, 0, 0);
    stroke(0);
  text(count, 50, 50);
      text(counter, 50, 110);
      line(30, 70, 95, 70);
      fill(255);
      noStroke();
      ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
}else {
  sceneTwentyThree();
  noStroke();
      fill(255);
      ellipse(470, 80, 110, 110);
  fill(0);
  textSize(14);
   text("Oopsy, try again!", 150, 30);
//loop();
}
  }
else if (currentScene == 24) {
  if (mouseX >10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneTwentyFive();
    fill(255, 0, 0);
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    stroke(0);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   fill(255,0,0);
   noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
     fill(255, 0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
      fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else {
    sceneTwentyFour();
    fill(0);
    textSize(14);
    text("Oopsy, try again!", 150, 30);
    fill(255);
      noStroke();
      ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
  //loop();
}
}
  else if (currentScene == 25) {
  if (mouseX >200 && mouseX < 340 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneTwentySix();
    fill(255, 0, 0);
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //stroke(0);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //fill(0);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //textSize(14);
   //text("Great job!", 170, 30);
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      fill(255, 0, 0);
    text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
      
  }else{
  sceneTwentyFive();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
  fill(0);
  textSize(14);
  text("Oopsy, try again!", 150, 30);
  //loop();
} 
   }
   
 else if (currentScene == 26) {
  if (mouseX >10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
    count = count+1;
    sceneTwentySeven();
    fill(255, 0, 0);
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //fill(0);
   //text(count, 50, 70);
   //text(counter, 310, 70);
    //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
       ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
    sceneTwentySix();
    noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
    fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
 }
else if (currentScene == 27) {
  if (mouseX > 110 && mouseX < 250 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneTwentyEight();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
       ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      fill(0);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneTwentySeven();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
  fill(0);
   ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 28) {
  if (mouseX > 100 && mouseX < 250 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneTwentyNine();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      fill(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneTwentyEight();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 29) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneThirty();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneTwentyNine();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      stroke(118, 50, 50);
      strokeWeight(10);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 30) {
  if (mouseX > 10 && mouseX < 160 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneThirtyOne();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
  fill(0);
      textSize(14);
      text("Great job!", 170, 30);
  }else{
  sceneThirty();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      ellipse(470, 200, 7, 7);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
else if (currentScene == 31) {
  if (mouseX > 200 && mouseX < 340 && mouseY > 280 && mouseY < 380) {
  count = count+1;
    sceneEleven();
    //ellipse(50, 50, 30, 30);
    //ellipse(300, 50, 30, 30);
    //ellipse(60, 60, 60, 60);
    //ellipse(320, 60, 60, 60);
   //text(count, 50, 70);
   //text(counter, 310, 70);
   //stroke(255,0,0);
      //textSize(14);
      //text("Great job!", 170, 30);
      fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      noStroke();
      fill(255, 0,0);
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      strokeWeight(10);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      ellipse(470, 320, 7, 7);
      fill(255, 0, 0);
       text(count, 50, 50);
      text(counter, 50, 110);
      stroke(0);
      strokeWeight(4);
      line(30, 70, 95, 70);
      fill(255);
      arc(470, 100, 25, 20, 0, PI);
      fill(255, 165, 0);
      noStroke();
      triangle(460, 95, 470, 75, 480, 95);
  fill(0);
      textSize(14);
      text("Great Job!", 180, 35);
  }else{
  sceneThirtyOne();
  noStroke();
   fill(255);
   ellipse(470, 80, 110, 110);
      ellipse(470, 180, 170, 170);
      ellipse(470, 280, 190, 190);
      fill(0);
      ellipse (490, 70, 20, 20);
      ellipse (440, 70, 20, 20);
      stroke(0);
      strokeWeight(10);
      line(400, 50, 530, 50);
      rect(427, 10, 85, 40);
      fill(102, 204, 0);
      ellipse(470, 200, 7, 7);
      ellipse(470, 260, 7, 7);
      fill(255, 0,0);
      noStroke();
      triangle(470, 120, 410,  100, 410, 140);
      triangle(470, 120, 530, 100, 530, 140);
      stroke(118, 50, 50);
      line(430, 180, 370, 130);
      line(530, 180, 600, 130);
     
      
  fill(0);
    textSize(14);
     text("Oopsy, try again!", 150, 30);
  //loop();
}
}
}
 
 
  

























