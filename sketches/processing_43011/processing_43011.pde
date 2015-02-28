
int oldMouseX, oldMouseY;
color pen1, pen2;
int myPenWeight;
PFont bobsfont;
int bunny, bunnyY;

void setup() {
  size(600, 600);
  smooth();
  oldMouseX = 0;
  oldMouseY = 0;
  pen2 = color(0, 0, 0);
  background(255);
  myPenWeight = 1;
  bobsfont = loadFont("text_36.vlw");
  bunny = 300;
  bunnyY = 40;
}

void draw() {
  fill(0);
  textFont(bobsfont, 36);
  text("Pen", 0, 20);
  strokeWeight(myPenWeight);
  stroke(pen2);
  if (mousePressed) {
    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      line(mouseX, mouseY, oldMouseX, oldMouseY);
    }
  }
  oldMouseX = mouseX;
  oldMouseY = mouseY;
  //red button
  strokeWeight(1);
  stroke(0);
  fill(255, 0, 0);
  ellipse(80, 15, 20, 20);
  //black button
  fill(0);
  ellipse(55, 15, 20, 20);
  //blue button
  fill (0, 0, 255);
  ellipse (105, 15, 20, 20);
  //green button
  fill(0, 255, 0);
  ellipse(130, 15, 20, 20);
  //orange button
  fill(255, 140, 0);
  ellipse(155, 15, 20, 20);
  //yellow button
  fill (255, 255, 0);
  ellipse(180, 15, 20, 20);
  //purple button
  fill(148, 0, 211);
  ellipse(205, 15, 20, 20);
  //random button
  fill(255);
  ellipse(230, 15, 20, 20);
  fill(0);
  text("?", 226, 24);
  //current color rect
  fill(pen2);
  rect(570, 5, 20, 20);
  if (mousePressed && dist(55, 15, mouseX, mouseY) < 10) {
    pen2 = color(0, 0, 0);
  }
  else if (mousePressed && dist(mouseX, mouseY, 80, 15) < 10) {
    pen2 = color(255, 0, 0);
  }
  else if (mousePressed && dist(mouseX, mouseY, 105, 15) < 10) {
    pen2 = color(0, 0, 255);
  }
  else if (mousePressed && dist(mouseX, mouseY, 130, 15) < 10) {
    pen2 = color(0, 255, 0);
  }
  else if (mousePressed && dist(mouseX, mouseY, 155, 15) < 10) {
    pen2 = color(255, 140, 0);
  }
  else if (mousePressed && dist(mouseX, mouseY, 180, 15) < 10) {
    pen2 = color(255, 255, 0);
  }
  else if (mousePressed && dist(mouseX, mouseY, 205, 15) < 10) {
    pen2 = color(148, 0, 211);
  }
  else if (mousePressed && dist(mouseX, mouseY, 230, 15) < 10) {
    pen2 = color(random(255), random(255), random(255));
  }
  //clear screen
  fill(0);
  stroke(0);
  rect(110, 32, 50, 25);
  fill(255);
  text("clear", 112, 53);
  if (mousePressed && mouseX > 110 && mouseX < 160 && mouseY > 32 && mouseY < 57) {
    background(255);
    myPenWeight = 1;
    pen2 = color(0, 0, 0);
  }
  //thin line button
  /*stroke(0);
   strokeWeight(1);
   line (10, 120, 10, 160);
   if(mousePressed && mouseX > 0 && mouseX < 20 && mouseY > 120 && mouseY < 160) {
   if(myPenWeight > 0) {
   myPenWeight --;
   }
   }
   //thick line button
   strokeWeight(5);
   line(20, 120, 20, 160);
   if(mousePressed && mouseX > 10 && mouseX < 30 && mouseY > 120 && mouseY < 160) {
   myPenWeight ++;
   }*/
  //stroke weight buttons
  fill(255);
  strokeWeight(1);
  rect(60, 35, 20, 20);
  rect(85, 35, 20, 20);
  if (mousePressed && mouseX > 85 && mouseX < 105 && mouseY > 35 && mouseY < 55) {
    if (myPenWeight > 1) {
      myPenWeight --;
    }
  }
  fill(0);
  text("+", 65, 50);
  text("-", 92, 52);
  if (mousePressed && mouseX > 60 && mouseX < 80 && mouseY > 35 && mouseY < 55) {
    myPenWeight ++;
  }

  //strokeWeight(myPenWeight);
  //line(580, 40, 580, 60);
  //eraser
  fill(255, 128, 114);
  strokeWeight(1);
  quad(20, 40, 50, 40, 40, 50, 10, 50); 
  if (mousePressed && mouseX > 10 && mouseX < 50 && mouseY > 40 && mouseY < 50) {
    myPenWeight ++;
    pen2 = color(255);
  }
  //bunny
  fill(255);
  ellipse(565, 40, 3, 20);
  ellipse(575, 40, 3, 20);
  ellipse(585, 53, 25, 10);
  ellipse(570, 50, 15, 15);
  ellipse(590, 60, 5, 5);
  ellipse(580, 60, 5, 5);
  if (mousePressed && mouseX > 565 && mouseX < 590 && mouseY > 35 && mouseY < 65) {
    fill(255);
    strokeWeight(1);
    bunny = int(random(600));
    bunnyY = int(random(700));
    ellipse(bunny, bunnyY - 100, 3, 20);
    ellipse(bunny + 10, bunnyY - 100, 3, 20);
    ellipse(bunny + 20, bunnyY - 87, 25, 10);
    ellipse(bunny + 5, bunnyY - 90, 15, 15);
    ellipse(bunny + 25, bunnyY - 80, 5, 5);
    ellipse(bunny + 15, bunnyY - 80, 5, 5);
  }
}


