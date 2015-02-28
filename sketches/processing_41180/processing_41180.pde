
int x=30;
int y=20;
int speedY = 8;
int speedX = 2;

void setup () {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  background(150);
  if (y > 20 || y < 2) {
    speedY = speedY *-1;
  }

  if (x > 32 || x < 10) {
    speedX = speedX * -1;
  }

  y = y + speedY;
  x = x + speedX;

  fill(60, 82, 142);
  ellipse(100, 200, 170, 170);
  fill(0);
  ellipse(160, 230, x+random(3), y+random(2));
  ellipse(160, 185, 10, 10);
  stroke(0);
  strokeWeight(5);
  line(170, 160, 140, 180);

  //destra
  fill(200, 137, 137);
  ellipse(width-100, 200, 170, 170);
  fill(0);
  ellipse(width-160, 230, x+random(2), y+random(3));
  ellipse(width-160, 185, 10, 10);
  fill(0, 70);
  noStroke();
  ellipse(width/2, 330, 370, 30);
  stroke(0);
  strokeWeight(5);
  line(width-170, 180, width-140, 160);

  if (mousePressed) {

    background (255, 175, 219);

    fill(69, 30, 255);
    ellipse(100, 200, 170, 170);
    fill(0); /*-----------------------------------*/
    line(160, 230, 150, 220);
    stroke(0);
    strokeWeight(5);
    line(140, 180, 150, 170);
    line(150, 170, 160, 180);
    line(130, 155, 130, 175);
    line(120, 155, 120, 175);

    //destra
    fill(255, 88, 166);
    ellipse(width-100, 200, 170, 170);
    fill(0);
    ellipse(width-160, 230, x+random(2), y+random(3));
    stroke(0);
    strokeWeight(5);
    line(width-170, 180, width-160, 170);
    line(width-160, 170, width-150, 180);

    fill(0, 70);
    noStroke();
    ellipse(width/2, 330, 370, 30);
  }
}

