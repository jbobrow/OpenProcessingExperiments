
void setup () {
  size(350, 518);
  background(#586232);
  smooth();

  noStroke();
  int counterBG = 0;

  counterBG = 0;
  while (counterBG < 300) {
    fill(100-random(10), 200-random(200), 50-random(50), 10);
    float r = (random(100)); 
    ellipse(random(width), random(height), r, r); 
    counterBG = counterBG + 1;
  }

  noStroke();
  fill(#6b7250, 100);
  ellipse(150, 80, 250, 250);

  fill(#616334, 100);
  ellipse(130, 80, 140, 170);

  fill(#6d6a37, 100);
  ellipse(10, 250, 200, 400);

  fill(#817a36, 100);
  ellipse(210, 220, 240, 300);

  fill(#595727, 100);
  arc(170, 160, 250, 250, PI/2, 3*PI/2);

  fill(#7f8a60, 100);
  ellipse(50, 350, 150, 150);

  fill(#525c3a, 100);
  ellipse(150, 200, 150, 200);

  fill(#525c3a);
  ellipse(80, 270, 70, 50);

  fill(#525c3a);
  ellipse(130, 270, 130, 130);

  fill(#556236);
  ellipse(250, 518, 300, 100);

  fill(#505e3b);
  ellipse(10, 500, 150, 200);

  fill(#505e3b);
  ellipse(340, 470, 220, 300);

  fill(#57663b, 150);
  ellipse(160, 450, 170, 70);
  fill(#69783d, 150);
  ellipse(160, 450, 150, 60);
  fill(#81854a, 150);
  ellipse(160, 450, 130, 50);

  // OUTSKIRT SHAPES

  // upper right L
  fill(#342a0f);
  noStroke();
  rect(295, 7, 38, 90);

  // covers up L with bg color
  fill(#586232);
  rect(300, 7, 40, 85);

  // small brown rectangle
  fill(#483f22);
  rect(300, 40, 25, 10);

  // horizontal yellow rectangle
  fill(#a9965e);
  stroke(#342a0f);
  rect(299, 30, 35, 2);

  // lower left rect
  fill(#7a6a49);
  stroke(#433518);
  rect(20, 468, 15, 25);

  // MAIN SHAPE

  //orange half-circle
  fill(#d16d21);
  arc(200, 160, 230, 235, PI/2, 3*PI/2);

  fill(#cbad57);
  noStroke();
  beginShape();
  vertex(140, 100);
  vertex(140, 255);
  vertex(135, 252);
  vertex(130, 247);
  vertex(125, 242);
  vertex(120, 237);
  vertex(118, 220);
  vertex(119, 200);
  vertex(120, 185);
  vertex(123, 170);
  endShape(CLOSE);

  //red rectangle interior
  noStroke();
  fill(#d65f25);
  beginShape();
  vertex(140, 215); // upper left
  vertex(160, 215); // upper right
  vertex(160, 270); // lower right
  vertex(140, 260); // lower left
  endShape();

  // covers up exposed right side of orange circle
  noStroke();
  fill(#616334, 255); // dark green
  beginShape();
  vertex(160, 33);
  vertex(170, 36);
  vertex(180, 38);
  vertex(190, 40);
  vertex(200, 42);
  vertex(205, 45);
  vertex(210, 50);
  vertex(215, 60);
  vertex(217, 70);
  vertex(160, 80);
  endShape();
  fill(#817a36); // light green
  rect(160, 70, 50, 200);

  // blue quarter circle
  fill(#d0c6ab);
  stroke(#342a0f);
  arc(160, 220, 260, 250, 3*PI/2, 2*PI);

  //yellow rectangle
  fill(#e8c776);
  rect(140, 95, 20, 120);

  // red quarter circle
  fill(#e5c191);
  arc(160, 215, 260, 250, 0, PI/2);
  noStroke();
  fill(#e6a683);
  arc(170, 215, 210, 220, 0, PI/2);
  fill(#da9979);
  arc(170, 215, 210, 170, 0, PI/2);

  fill(#de8a6e);
  beginShape();
  vertex(170, 215);
  vertex(275, 215);
  vertex(274, 235);
  vertex(170, 235);
  endShape();

  fill(#d18062);
  beginShape();
  vertex(170, 215);
  vertex(275, 215);
  vertex(274, 230);
  vertex(170, 230);
  endShape();

  // small pink rectangle
  noStroke();
  fill(#d18c55);
  beginShape();
  vertex(140, 260);
  vertex(160, 270);
  vertex(160, 285);
  vertex(140, 285);
  endShape();

  // small darker pink rectangle
  fill(#cc734b);
  rect(140, 285, 20, 20);

  // dark pink rectangle
  fill(#b65b26);
  rect(140, 305, 20, 35);

  //skinny horizontal black rectangles
  fill(#26210b);
  rect(60, 285, 80, 4);
  fill(#5e5c29);
  rect(140, 285, 20, 4);

  // skinny red rectangles
  stroke(#342a0f);
  fill(#b84b20);
  rect(90, 305, 50, 8);
  fill(#893b17);
  rect(140, 305, 20, 8);

  stroke(#342a0f);
  line(160, 50, 160, 200);  // closes right side of orange ellipse
  line(140, 95, 140, 340);  // left side of yellow/red rectangles
  strokeWeight(2);
  line(140, 215, 290, 215); //sideways line between blue/red quarters
  strokeWeight(1);
  line(140, 340, 160, 340);
  line(160, 215, 160, 340);

  // blue behind pupil
  noStroke();
  // lighter
  fill(#b1b59e);
  ellipse(205, 165, 25, 25);
  // darker
  fill(#91978b);
  ellipse(205, 165, 20, 20);

  //eyeball
  fill(#2d2b14);
  ellipse(205, 165, 13, 13);

  stroke(#191a0c);
  fill(#191a0c);
  beginShape();
  vertex(160, 340);
  vertex(215, 370);
  vertex(185, 370);
  vertex(185, 385);
  vertex(233, 385);
  vertex(233, 408);
  vertex(178, 408);
  vertex(178, 430);
  vertex(220, 430);
  vertex(220, 460);
  vertex(160, 460);
  endShape();

  fill(#d1b66f);
  stroke(#6a632f);
  beginShape();
  vertex(160, 340);
  vertex(160, 460);
  vertex(95, 460);
  vertex(95, 385);
  endShape(CLOSE);

  noStroke();
  fill(#bda050);
  beginShape();
  vertex(160, 350);
  vertex(160, 460);
  vertex(105, 460);
  vertex(105, 390);
  endShape(CLOSE);

  int counter = 0;

  counter = 0;
  while (counter < 150) {
    fill(#6a603c, 40);
    float r = (random(3)); 
    ellipse(random(165, 225), random(395, 405), r, r); 
    counter = counter + 1;
  }

  int counter2 = 0;

  counter2 = 0;
  while (counter2 < 150) {
    fill(#6a603c, 30);
    float r = (random(3)); 
    ellipse(random(165, 190), random(385, 405), r, r); 
    counter2 = counter2 + 1;
  }

  int counterWhite = 0;

  counterWhite = 0;
  while (counterWhite < 400) {
    fill(#9b783e, 100);
    float r = (random(3)); 
    ellipse(random(97, 158), random(385, 458), r, r); 
    counterWhite = counterWhite + 1;
  }

  int counterWhite2 = 0;

  counterWhite2 = 0;
  while (counterWhite2 < 300) {
    fill(#9b783e, 150);
    float r = (random(3)); 
    ellipse(random(97, 158), random(420, 458), r, r); 
    counterWhite2 = counterWhite2 + 1;
  }
  
  int counterWhiteR = 0;

  counterWhiteR = 0;
  while (counterWhiteR < 300) {
    fill(#b88337, 100);
    float r = (random(3)); 
    ellipse(random(97, 158), random(385, 458), r, r); 
    counterWhiteR = counterWhiteR + 1;
  }
  
  
  
}


