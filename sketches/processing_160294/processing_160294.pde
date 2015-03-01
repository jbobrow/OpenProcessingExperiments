
void setup() {

  size (1000, 750);
}

void draw() {

  smooth();
  strokeJoin(ROUND);
  strokeCap(ROUND);
  background(25);

  //head
  fill(255, 100);
  rect(150, 150, 715, 500);

  //pupils
  strokeWeight(4);
  fill(255, 300);
  stroke(255, 50);
  ellipse(random(244, 246), random(189, 191), 50, 50);
  ellipse(random(754, 756), random(189, 191), 50, 50);

  //eyes
  fill(255, 150);
  ellipse(245, 225, 100, 150);
  ellipse(755, 225, 100, 150);

  //antennae
  stroke(150, 500);
  fill(100, 500); 
  rect(500, 45, 10, 105);
  rect(485, 910, 41, 10);
  rect(485, 115, 41, 10);
  rect(485, 130, 41, 10);

  //mouth
  strokeWeight(1.7);
  fill(200, 150, 150);
  stroke(75);
  arc(500, 450, 285, 285, 0, PI + PI/24, CLOSE);
  stroke(10, 100);
  line(367, 500, 623, 518);

  //legs
  strokeWeight(4);
  stroke(50, 150);
  fill(100);
  rect(400, 650, 200, 100);
  fill(99, 99);
  line(500, 700, 500, 750);
  strokeWeight(1);

  //underwear
  fill(255);
  stroke(0, 50);
  triangle(404, 652, 500, 700, 598, 652);
  stroke(0, 500);
  line(500, 652, 500, 700);
  line(500, 670, 520, 690);

  //feet
  fill(50, 120, 75);
  rect(325, 725, 150, 30);
  rect(525, 725, 150, 30);

  //arms
  fill(0, 200);
  stroke(150, 200);
  strokeWeight(5.5);
  line(398, 652, 365, 670);
  line(601, 652, 631, 670);
  strokeWeight(1);

  //hand  
  stroke(200, 200);
  fill(50);
  ellipse(634, 670, 25, 25);

  //fingers
  line(639, 663, 645, 665);
  line(640, 668, 646, 671);
  line(639, 673, 645, 676);
  line(635, 678, 641, 680);

  //claw
  arc(361, 678, 45, 45, PI, TWO_PI + HALF_PI);
  line(338, 678, 361, 678);
  line(361, 678, 361, 700);

  //clouds
  noStroke();
  fill(255);
  ellipse(900, 50, 150, 50);
  arc(900, 50, 85, 85, 0, PI * 2, CLOSE);

  ellipse(100, 50, 150, 50);
  arc(102, 50, 85, 85, 0, PI, CLOSE);
  ellipse(130, 50, 150, 50);
  arc(137, 56, 85, 85, 0, PI * 2, CLOSE);

  ellipse(480, 50, 150, 50);
  arc(485, 50, 85, 85, 0, PI * 2, CLOSE);

  ellipse(850, 50, 150, 50);
  arc(850, 50, 85, 85, 0, PI * 2, CLOSE);
}


