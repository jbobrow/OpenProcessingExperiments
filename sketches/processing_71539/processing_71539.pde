
//A cute cat aka I FUCKING LOVE BEZIER CURVES
//by Luo
float bx = 220;
float by = 30;
int burgerSize = 50;
int bWidth = 60;
int bHeight = 50;
int eatCount = 0;
boolean overBurger = false;
boolean overMouth = false;
boolean back = false;
PImage burger, burger1, burger2, burger3;
PFont msg;

void setup() {
  size(500, 500);
  msg = createFont("Impact", 16);
  burger1 = loadImage("http://i.imgur.com/7VBxE.png");
  burger2 = loadImage("http://i.imgur.com/qZlxG.png");
  burger3 = loadImage("http://i.imgur.com/Zpeu0.png"); 
  burger = burger1;
  smooth();
}

void draw() {
  background(150, 250, 250);
  noStroke();
  //background circles
  for (int i = 10; i > 0; i--) {
    fill(25*i, 150, 120*i);
    ellipse(300, 350, 100*i, 100*i);
  }
  stroke(0);
  strokeWeight(2);
  drawCat();

  if (eatCount > 2) drawFull();

  else {  
    //test if over mouth
    if (mouseX < 370 && mouseX > 300 && 
      mouseY < 320 && mouseY > 270) 
      overMouth = true;
    else overMouth = false;  

    //test mouse over burger
    if (mouseX > bx - bWidth && mouseX < bx + bWidth && 
      mouseY > by - bHeight && mouseY < by + bHeight) 
      overBurger = true;
    else overBurger = false;

    if (mousePressed && overBurger) {
      if (overMouth) {
        snap();
        if(eatCount < 3)
          drawEat();
      }
      else if (eatCount < 3) drawHappy();
    }
    else if (eatCount == 0) drawSad();
    else drawEat();

    //BURGER
    image(burger, bx, by);

  }
}

void mouseDragged() {
  if (overBurger && eatCount < 3) { 
    bx = mouseX - 30; 
    by = mouseY - 25;
  }
}

void mouseReleased() {
  if (eatCount < 3) {
    bx = 220;
    by = 30;
    back = false;
  }
}

void snap() { 
  if (eatCount > 2) 
    drawFull();
  else if (eatCount == 0) {
    eatCount = 1;
    burger = burger2;
    back = true;
  }
  else if (eatCount == 1 && back == false) {
    eatCount = 2;
    burger = burger3;
    back = true;
  }
  else if (eatCount == 2 && back == false) {
    eatCount = 3;
  } 
  if(eatCount < 3) {
    bx = 220;
    by = 30;
  }
  else drawFull();
}

void pawIn() {
  fill(255, 197, 50);
  pushMatrix();
  translate(285, 300);
  rotate(PI/2.5);
  arc(0, 0, 30, 70, PI, TWO_PI);
  popMatrix();
}

void pawOut() {
  fill(255, 197, 50);
  pushMatrix();
  translate(275, 275);
  rotate(-PI/8);
  arc(0, 0, 30, 70, PI, TWO_PI);
  popMatrix();
}

//:3
void drawMeow() {
  fill(255, 197, 50);
  beginShape();
  vertex(340, 285);
  bezierVertex(325, 290, 325, 310, 355, 295);
  vertex(355, 295);
  bezierVertex(340, 310, 360, 325, 375, 310);
  endShape();
}

void drawCat() {  
  fill(255, 197, 50);
  //FUCK YEAH BEZIERS
  //tail
  beginShape();
  vertex(80, 350);
  bezierVertex(-20, 400, -10, 500, 130, 470);
  vertex(130, 470);
  bezierVertex(150, 460, 140, 450, 100, 450);
  vertex(100, 450);
  bezierVertex(30, 450, 20, 410, 90, 390);
  endShape();

  //body 
  strokeJoin(ROUND);
  beginShape();
  vertex(350, 210);
  bezierVertex(300, 300, 175, 300, 110, 270);
  vertex(110, 270);
  bezierVertex(90, 200, 70, 230, 75, 270);
  vertex(75, 270);
  bezierVertex(0, 530, 500, 530, 470, 250); 
  vertex(430, 270);  
  bezierVertex(410, 240, 400, 230, 350, 240);
  endShape(CLOSE);

  //stomach
  noStroke();
  fill(255, 237, 178);
  beginShape();
  curveVertex(350, 300);
  curveVertex(300, 310);
  curveVertex(250, 310);
  curveVertex(150, 300);
  curveVertex(125, 330);
  curveVertex(150, 380);
  curveVertex(250, 390);
  curveVertex(330, 370);  
  curveVertex(350, 340);
  curveVertex(330, 310);
  curveVertex(300, 310);
  curveVertex(300, 310);
  endShape();
  stroke(0);

  fill(255, 197, 50);
  //feet
  arc(380, 380, 30, 70, PI, TWO_PI);
  pushMatrix();
  translate(175, 397);
  rotate(-PI/8);
  arc(0, 0, 30, 70, PI, TWO_PI);
  popMatrix();

  //left whiskers
  line(310, 270, 270, 230);
  line(315, 267, 290, 220);
  line(320, 265, 310, 210);
  //right whiskers
  line(405, 310, 455, 320);
  line(400, 315, 450, 340);
  line(400, 325, 440, 360);
}

void drawHappy() {
  pawOut();
  //eyes
  fill(0, 0, 0);
  pushMatrix();
  translate(400, 290);
  rotate(PI/5);
  ellipse(0, 0, 10, 15);
  popMatrix();

  pushMatrix();
  translate(350, 265);
  rotate(PI/5);
  ellipse(0, 0, 10, 15);
  popMatrix();

  fill(255, 255, 255);
  noStroke();
  ellipse(402, 286, 7, 7);
  ellipse(352, 261, 7, 7);
  stroke(0);

  //mouth
  fill(200, 76, 66);
  pushMatrix();
  translate(351, 303);
  rotate(PI/4);
  arc(0, 0, 20, 37, 0, PI+0.3);
  popMatrix();
  drawMeow();

  fill(0);
  textFont(msg, 24);
  text("Can I haz cheezburger?", 250, 200);
}

void drawSad() {  
  pawOut(); 
  //eyes
  fill(0, 0, 0);
  ellipse(400, 290, 7, 10);
  ellipse(350, 265, 7, 10);
  //mouth
  strokeWeight(2);
  noFill();
  beginShape();
  vertex(340, 300);
  vertex(355, 295);
  vertex(360, 310);
  endShape();

  textFont(msg, 26);
  text("I hungry. . .", 300, 200);
}

void drawEat() {
  pawIn();  
  drawMeow();
  fill(0, 0, 0);
  //eyes
  ellipse(400, 290, 7, 10);
  ellipse(350, 265, 7, 10);  
  //nom
  fill(255, 197, 50);
  pushMatrix();
  translate(375, 320);
  rotate(PI/1.5);
  arc(0, 0, 25, 30, 0, PI);
  popMatrix();

  fill(0);
  textFont(msg, 24);
  text("nomnomnomnom", 300, 200);
}

void drawFull() {
  pawIn();
  //eyes
  pushMatrix();
  translate(400, 290);
  rotate(PI/6);
  arc(0, 0, 20, 20, 0, PI);
  popMatrix();

  pushMatrix();
  translate(350, 265);
  rotate(PI/6);
  arc(0, 0, 20, 20, 0, PI);
  popMatrix();
  drawMeow();

  fill(0);
  textFont(msg, 24);
  text("I eated it", 350, 200);
  textFont(msg, 18);
  text("press r to feed me again", 300, 480);

  //Reset button
  if (keyPressed) { 
    if (key == 'r') {
      eatCount = 0;
      burger = burger1;
      bx = 220;
      by = 30;
    }
  }
}

