
PImage legblack;
//PShape candy;
PImage drink;
PImage heart;
//PShape lunch;
//PShape question;
//PShape work;
PFont font1;
String shadow = "if shadows revealed your inner thoughts...";
float x, y;
float angle = 0.0;

void setup() {
  size(800, 400, P3D);
  legblack = loadImage("legblack.png");
  //  candy = loadShape("candy.svg");
  drink = loadImage("drink.png");
  heart = loadImage("heart.png");
  //  lunch = loadShape("lunch.svg");
  //  question = loadShape("question.svg");
  //  work = loadShape("work.svg");
  font1 = loadFont("Handwriting-Dakota-30.vlw");
  textFont(font1);
  imageMode(CENTER);
}

void draw() {
  angle -= 0.01;
  background(255);
  
  float x = -100 + cos(angle) * 1000;
  float y = 200 + sin(angle) * 350;
  
  if (keyPressed)
  {
    if (key == 'd')
    {
      pushMatrix();

      translate(315, -220);
      noStroke();
      beginShape();
      texture(drink);
      vertex(x, y, 0, 0);
      vertex(x+400, y, drink.width, 0);
      vertex(400, 400, drink.width, drink.height);
      vertex(0, 400, 0, drink.width);
      endShape(CLOSE);

      popMatrix();
    }
    
    else if (key == 'h')  {
      pushMatrix();

      translate(315, -220);
      noStroke();
      beginShape();
      texture(heart);
      vertex(x, y, 0, 0);
      vertex(x+400, y, heart.width, 0);
      vertex(400, 400, heart.width, heart.height);
      vertex(0, 400, 0, heart.width);
      endShape(CLOSE);

      popMatrix();
    }
  }
  
  image(legblack, 450, 130, 1000, 750);
  fill(0);
  textSize(25);
  text(shadow, 150, 350);
}

//  translate(300, 50);
//  noStroke();
//
//  beginShape();
//  texture(drink);
//
//  //upper left
//  vertex(mouseX, mouseY, 0, 0);
//  vertex(mouseX+400, mouseY, drink.width*2, 0);
//  vertex(300, 400, drink.width*2, drink.height*2);
//  vertex(-300, 400, 0, drink.width*2);
//
//vertex(mouseX-width/2,mouseY-height/2, clouds.width, clouds.height);
//vertex(mouseX-width/2-200,mouseY-height/2, 0, clouds.width);
//
//  endShape();
//  pushMatrix();
//  translate(250, 0);
//  rotate(angle);
//  shape(drink, 300, 0, 600, 300);
//  popMatrix();
//  image(legblack, 450, 130, 1000, 750);
//  fill(0);
//  textSize(25);
//  text(shadow, 150, 550);
//}

//void draw() { 
//  if (counter == 0) {
//    background(255);
//    shape(drink, 300, 0, 600, 300);
//    image(legblack, 450, 130, 1000, 750);
//    fill(0);
//    textSize(25);
//    text(shadow, 150, 550);
//  }
//
//  if (counter == 1) {
//    background(255);
//    shape(work, 280, -10, 600, 300);
//    image(legblack, 450, 130, 1000, 750);
//    fill(0);
//    textSize(25);
//    text(shadow, 150, 550);
//  }
//
//  if (counter == 2) {
//    background(255);
//    shape(question, 300, 0, 600, 300);
//    image(legblack, 450, 130, 1000, 750);
//    fill(0);
//    textSize(25);
//    text(shadow, 150, 550);
//  }
//
//  if (counter == 3) {
//    background(255);
//    shape(candy, 300, 0, 600, 300);
//    image(legblack, 450, 130, 1000, 750);
//    fill(0);
//    textSize(25);
//    text(shadow, 150, 550);
//  }
//
//  if (counter == 4) {
//    background(255);
//    shape(heart, 300, 0, 600, 300);
//    image(legblack, 450, 130, 1000, 750);
//    fill(0);
//    textSize(25);
//    text(shadow, 150, 550);
//  }
//
//  if (counter == 5) {
//    background(255);
//    shape(lunch, 300, 0, 600, 300);
//    image(legblack, 450, 130, 1000, 750);
//    fill(0);
//    textSize(25);
//    text(shadow, 150, 550);
//  }
//
//  counter = counter + 1;
//  if (counter >= 6) {
//    counter = 0;
//  }
//}


