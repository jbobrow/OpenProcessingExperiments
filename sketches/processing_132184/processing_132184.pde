
//Sam Legros, Exercise 3, Question 2

int dice1 = (int)random(1, 7);
int dice2 = (int)random(1, 7);
int dice3 = (int)random(1, 7);

void setup() {
  size(800, 300);
  background(0, 129, 14);
  fill(232, 33, 33);
  rect(100, 100, 100, 100, 5);
  rect(225, 100, 100, 100, 5);
  rect(350, 100, 100, 100, 5);
  noStroke();
}
   //-----------------------------------------------------
   
void draw() {
  
  float x = random(width);
  float y = random(height);
  float c = random(100, 180);
  float diameter = random(25, 100);
  
  //-----------------------------------------------------
  
  if (dice1 == 1) {
    fill(255);
    ellipse(150, 150, 20, 20);
  }
  if (dice1 == 2) {
    fill(255);
    ellipse(123, 180, 20, 20);
    ellipse(177, 120, 20, 20);
  }
  if (dice1 == 3) {
    fill(255);
    ellipse(123, 180, 20, 20);
    ellipse(150, 150, 20, 20);
    ellipse(177, 120, 20, 20);
  }
  if (dice1 == 4) {
    fill(255);
    ellipse(123, 120, 20, 20);
    ellipse(123, 180, 20, 20);
    ellipse(177, 120, 20, 20);
    ellipse(177, 180, 20, 20);
  }
  if (dice1 == 5) {
    fill(255);
    ellipse(123, 120, 20, 20);
    ellipse(123, 180, 20, 20);
    ellipse(177, 120, 20, 20);
    ellipse(177, 180, 20, 20);
    ellipse(150, 150, 20, 20);
  }
  if (dice1 == 6) {
    fill(255);
    ellipse(123, 120, 20, 20);
    ellipse(123, 180, 20, 20);
    ellipse(123, 150, 20, 20);
    ellipse(177, 120, 20, 20);
    ellipse(177, 180, 20, 20);
    ellipse(177, 150, 20, 20);
  }
  
  //-----------------------------------------------------
  
  if (dice2 == 1) {
    fill(255);
    ellipse(275, 150, 20, 20);
  }
  if (dice2 == 2) {
    fill(255);
    ellipse(248, 180, 20, 20);
    ellipse(302, 120, 20, 20);
  }
  if (dice2 == 3) {
    fill(255);
    ellipse(248, 180, 20, 20);
    ellipse(275, 150, 20, 20);
    ellipse(302, 120, 20, 20);
  }
  if (dice2 == 4) {
    fill(255);
    ellipse(248, 120, 20, 20);
    ellipse(248, 180, 20, 20);
    ellipse(302, 120, 20, 20);
    ellipse(302, 180, 20, 20);
  }
  if (dice2 == 5) {
    fill(255);
    ellipse(248, 120, 20, 20);
    ellipse(248, 180, 20, 20);
    ellipse(302, 120, 20, 20);
    ellipse(302, 180, 20, 20);
    ellipse(275, 150, 20, 20);
  }
  if (dice2 == 6) {
    fill(255);
    ellipse(248, 120, 20, 20);
    ellipse(248, 180, 20, 20);
    ellipse(248, 150, 20, 20);
    ellipse(302, 120, 20, 20);
    ellipse(302, 180, 20, 20);
    ellipse(302, 150, 20, 20);
  }
  
  //-----------------------------------------------------
  
  if (dice3 == 1) {
    fill(255);
    ellipse(400, 150, 20, 20);
  }
  if (dice3 == 2) {
    fill(255);
    ellipse(373, 180, 20, 20);
    ellipse(427, 120, 20, 20);
  }
  if (dice3 == 3) {
    fill(255);
    ellipse(373, 180, 20, 20);
    ellipse(400, 150, 20, 20);
    ellipse(427, 120, 20, 20);
  }
  if (dice3 == 4) {
    fill(255);
    ellipse(373, 120, 20, 20);
    ellipse(373, 180, 20, 20);
    ellipse(427, 120, 20, 20);
    ellipse(427, 180, 20, 20);
  }
  if (dice3 == 5) {
    fill(255);
    ellipse(373, 120, 20, 20);
    ellipse(373, 180, 20, 20);
    ellipse(427, 120, 20, 20);
    ellipse(427, 180, 20, 20);
    ellipse(400, 150, 20, 20);
  }
  if (dice3 == 6) {
    fill(255);
    ellipse(373, 120, 20, 20);
    ellipse(373, 180, 20, 20);
    ellipse(373, 150, 20, 20);
    ellipse(427, 120, 20, 20);
    ellipse(427, 180, 20, 20);
    ellipse(427, 150, 20, 20);
  }
  
  //----------------------------------------------------- 
  
  if (dice1 == dice2 && dice1 == dice3 && dice2 == dice3) {
    textSize(30);
    fill(255, 243, 0);
    text("YAHTZEE!", 550, 160);
    stroke(1);
    fill(c, 255, 255, 20);
    ellipse(x, y, diameter, diameter);
  }
  else {
    textSize(24);
    fill(0);
    text("BETTER LUCK NEXT TIME!", 475, 160);
  }
}



