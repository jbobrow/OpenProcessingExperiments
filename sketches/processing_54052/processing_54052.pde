
PImage legblack;
PShape candy;
PShape drink;
PShape heart;
PShape lunch;
PShape question;
PShape work;
PFont font1;
String shadow = "if shadows revealed your inner thoughts...";

int counter = 0;


void setup() {
  size(600, 300);
  smooth();
  legblack = loadImage("legblack.png");
  candy = loadShape("candy.svg");
  drink = loadShape("drink.svg");
  heart = loadShape("heart.svg");
  lunch = loadShape("lunch.svg");
  question = loadShape("question.svg");
  work = loadShape("work.svg");
  font1 = loadFont("Handwriting-Dakota-30.vlw");
  textFont(font1);
  frameRate(1);
  imageMode(CENTER);
}

void draw() { 
  if (counter == 0) {
    background(255);
    shape(drink, 70, 0, 600, 300);
    image(legblack, 230, 130, 1000, 750);
    fill(0);
    textSize(25);
    text(shadow, 40, 260);
  }

  if (counter == 1) {
    background(255);
    shape(work, 60, -10, 600, 300);
    image(legblack, 230, 130, 1000, 750);
    fill(0);
    textSize(25);
    text(shadow, 40, 260);
  }

  if (counter == 2) {
    background(255);
    shape(question, 70, 0, 600, 300);
    image(legblack, 230, 130, 1000, 750);
    fill(0);
    textSize(25);
    text(shadow, 40, 260);
  }

  if (counter == 3) {
    background(255);
    shape(candy, 70, 0, 600, 300);
    image(legblack, 230, 130, 1000, 750);
    fill(0);
    textSize(25);
    text(shadow, 40, 260);
  }

  if (counter == 4) {
    background(255);
    shape(heart, 70, 0, 600, 300);
    image(legblack, 230, 130, 1000, 750);
    fill(0);
    textSize(25);
    text(shadow, 40, 260);
  }

  if (counter == 5) {
    background(255);
    shape(lunch, 70, 0, 600, 300);
    image(legblack, 230, 130, 1000, 750);
    fill(0);
    textSize(25);
    text(shadow, 40, 260);
  }

  counter = counter + 1;
  if (counter >= 6) {
    counter = 0;
  }
}


