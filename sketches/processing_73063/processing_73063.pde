
//Madison Kawiecki
//Homework 6
//October 3, 2012
//Fish "eats" food if close enough

//Variables for X and Y coordinates of fish food
float foodX;
float foodY;

//Setting the counter so the program knows max value before drawing new food
final int COUNTER_VALUE = 250;
int counter =  0;

boolean wasEaten = true;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  drawFishBowl();
  drawFish();
  drawBubbles();
  drawBowlDecor();
  drawFishFood();
//When the counter hits a factor of 250 it draws a new piece of food
//and sets the counter back to 0.  It draws new food when the food
//wasn't eaten either, therefore "wasEaten = false"
  if (counter % COUNTER_VALUE == 0) {
    newFishFood();
    counter = 0;
    wasEaten = false;
  }
//When the counter is not a factor of 250 it adds "1" to the counter
  counter++;
}

void drawFishBowl() {

  noStroke();
  fill(90, 222, 212);
  ellipse(300, 300, 430, 280);
  rect(200, 420, 200, 25);
  rect(200, 160, 215, 25);
}


void drawBubbles() {
//local variables setting initial bubble width and height  
  float bubbleWidth = 15;
  float bubbleHeight = 15;

  stroke(0);
  strokeWeight(1);
//bubbles  
  ellipse(mouseX-45, mouseY - 10, bubbleWidth, bubbleHeight);
  ellipse(mouseX-35, mouseY - 20, 0.5*bubbleWidth, 0.5*bubbleHeight);
  ellipse(mouseX-45, mouseY-40, 1.5*bubbleWidth, 1.5*bubbleHeight);
}

void drawBowlDecor() {
//Seaweed
  stroke(13, 144, 29);
  strokeWeight(4);
  line(300, 443, 300, 400);
  line(299, 412, 314, 398);
  line(300, 400, 276, 385);
  line(274, 443, 239, 358);
  line(248, 384, 259, 365);
  line(259, 365, 242, 335);
  line(338, 443, 341, 386);
  line(340, 392, 360, 392);
  line(360, 392, 333, 366);
  line(341, 399, 313, 382);
  line(227, 443, 283, 358);
  line(240, 417, 222, 392);
  line(222, 392, 230, 365);
  line(377, 443, 392, 397);
  line(392, 397, 411, 405);

  stroke(0);
  strokeWeight(3);
  fill(229, 37, 153);
//Variables for furthest left marble  
  int firstMarbleX = 209;
  int marbleY = 436;
//Variables for initial marble width and height  
  int marbleWidth = 15;
  int marbleHeight = 15;
//marbles at bottom of bowl
  ellipse(firstMarbleX, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 15, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 30, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 45, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 60, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 75, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 90, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 105, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 120, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 135, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 150, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 165, marbleY, marbleWidth, marbleHeight);
  ellipse(firstMarbleX + 180, marbleY, marbleWidth, marbleHeight);
}

void drawFish() {
//fish body
  fill(247, 109, 22);
  ellipse(mouseX, mouseY, 76, 40);
  triangle(mouseX + 38, mouseY, mouseX + 60, mouseY +20, mouseX+60, mouseY - 20);
//eyeball  
  stroke(0);
  strokeWeight(5);
  point(mouseX-25, mouseY-5);
//open mouth  
  noStroke();
  fill(90, 222, 212);
  ellipse(mouseX-38, mouseY, 20, 10);
}

void drawFishFood() {

  stroke(180, 72, 18);
  strokeWeight(10);
  if ( distance() <10) {
    wasEaten = true;
  }
  if (foodY+counter < 440) {
    ellipse(foodX, foodY + counter, 10, 10);
  }
  if (wasEaten) {
    counter = 0;
  }
}

void newFishFood() {
//new food starts at a random spot along the top of the bowl  
  foodX = random(200, 400);
  foodY = 160;
}
//Method that returns the value of distance between the food and into the drawFishFood function  
float distance() {
  float yDistance = mouseY-(foodY + counter);
  float xDistance = (mouseX - 30) - foodX;
  return abs(yDistance + xDistance);
}
