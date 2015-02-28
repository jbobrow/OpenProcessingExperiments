
float counter = 5;
float square_counter = 1;
float r = 50;
float distance;
boolean listener;
boolean shooterListener;

int shooterY;
int rectangleY;
int currentRectTop;
int currentRectBottom;

int damage;
int lifeColor;


void keyPressed() {
  if (keyCode == DOWN) {
    rectangleY += 15;
  }
  if (keyCode == UP) {
    rectangleY -= 15;
  }
  
  if (key == 's' || key == 'S') {
    shooterY += 10;
  }
  if (key == 'w' || key == 'W') {
    shooterY -= 10;
  }
}

//void mousePressed() {
//  if (listener == false && mouseX > 3*width/4 - 75 && mouseX < 3*width/4 + 75 && mouseY > height/2 - 50 && mouseY < height/2 + 50) {
//    listener = true;
//  }
//}
//void mouseReleased() {
//  listener = false;
//}


void setup() {
  size(800, 400);
  background(0);
  noStroke();
  smooth();
  
  shooterY = height/4;
  rectangleY = height/2;
  damage = 3;
  lifeColor = 20;
  frameRate(120);
  
}



void draw() {
  background(0);
  
  currentRectTop = rectangleY - 50;
  currentRectBottom = rectangleY + 50;
  
// CIRCLE ---------------------------
//  strokeWeight(1);
//  stroke(0);
  fill(80, 185, 72);
  ellipse(width/4, shooterY, 100, 100);



// RECTANGLE ---------------------------
  fill(lifeColor, 0, 140);
//  stroke(255);
//  strokeWeight(2);
  rectMode(CENTER);
  rect(3*width/4, rectangleY, 150, 100);



  distance = dist(width/4, shooterY, mouseX, mouseY);

  if (mousePressed == true && distance < r) {
    // background(80, 185, 72);
    float abc = counter + width/4;
    if (abc < 3*width/4) {
      fill(255);
      ellipse(abc, shooterY, 20, 20);
      counter *= 1.8;
    }
  }

  if (mousePressed == false) {
    counter = 1;
    square_counter = 1;
  }


  // RECTANGLE ------------------------------------
//  if (mousePressed == true && listener == true) {
//    background(0);
//    fill(238, 49, 36);
//    rectMode(CENTER);
//    rect(3*width/4, height/2, 150 + square_counter, 100 + square_counter);
//    square_counter *= 1.5;
//  }
  
  if (mousePressed == true && distance < r && shooterY >= currentRectTop && shooterY <= currentRectBottom) {
    println("BOOM");
    lifeColor += damage;
  }
  if (lifeColor >= 255) {
    text("Spaceship destroyed!", width/2 - 70, height/4);
  }
}








// Check to see if bullet hits RECTANGLE

// If it does, then SOMETHING


