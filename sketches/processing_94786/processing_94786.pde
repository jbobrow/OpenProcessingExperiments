
int i;
float x;

void setup () {
  size(500, 500);
  background(0);
  frameRate(5);
  fill(0);
  noStroke();
}

void draw  () {
  strokeWeight(0);
    if (mousePressed == true) {
    fill(random(0, 255), random(0, 255), random(0, 255));
  } else {
    fill(255);
  }
  if (random(0,1) < 0.5) {
    stroke(100, 100, 255);
  } else {
    stroke(200, 200, 255);
  }
  for (i = 0; i < 10; i++) {
    x = random (10, 20);
    ellipse(random(1, 499), random(1, 499), x, x);
  }

  ellipse(25, 25, 10, 10);
  rolie(250, 250);
  
}


void rolie (int x, int y) {

  stroke(142);
  strokeWeight(5);
  line(250, 255, 300, 200); 
  line(200, 190, 220, 90);
  line(150, 270, 100, 200);
  line(200, 320, 250, 390);
  line(170, 400, 200, 290);
  fill(255, 0, 0);
  ellipse(145, 200, 20, 20);
  ellipse(255, 200, 20, 20);
  fill(240, 247, 60);
  ellipse(200, 200, 100, 100);
  ellipse(200, 295, 90, 90);
  ellipse(155, 265, 25, 25);
  ellipse(245, 265, 25, 25);
  fill(216, 172, 26);
  arc(200, 295, 90, 90, 0, PI);
  noStroke();
  fill(80, 50, 23);
  ellipse(190, 300, 10, 10);
  ellipse(210, 300, 10, 10);
  ellipse(200, 210, 10, 10);
  fill(0);
  ellipse(180, 190, 20, 20);
  ellipse(220, 190, 20, 20);
  fill(255);
  arc(175, 185, 5, 5, 0, PI/2);
  arc(215, 185, 5, 5, 0, PI/2);
  fill(255, 0, 0);
  arc(200, 230, 15, 15, 0, PI);
  fill(38, 18, 175);
  ellipse(220, 90, 20, 20);
}

