
void setup() {
  size(720, 480);
}

void draw() {
  background(171, 171, 171);
  //neck
  smooth();
  noStroke();
  fill(150);
  rect(350, 190, 25, 50);

  //head
  fill(0);
  arc(360, 150, 150, 150, PI, TWO_PI);

  arc(mouseX, mouseY, 75, 75, 0, PI);

  //eyes
  fill(255);
  ellipse(400, 130, 15, 15);

  ellipse(325, 120, 35, 35);

  fill(0);
  arc(410, 60, 40, 40, 0, PI+HALF_PI);

  //body
  strokeWeight(20);
  fill(50);
  rect(312, 240, 100, 110);

  noStroke();
  fill(225);
  rect(332.5, 300, 60, 30);

  //shoulders
  fill(0);
  ellipse(312, 240, 40, 40);

  ellipse(412, 240, 40, 40);

  //arms
  rect(210, 235, 120, 10);

  rect(400, 235, 120, 10);

  //hands
  ellipse(205, 240, 15, 15);

  ellipse(520, 240, 15, 15);

  //leg
  rect(296.5, 350, 130, 60);

  ellipse(430, 380, 60, 60);

  ellipse(300, 380, 60, 60);

  //wheels
  fill(255);
  ellipse(300, 380, 30, 30);

  ellipse(345, 380, 30, 30);

  ellipse(390, 380, 30, 30);

  ellipse(432.5, 380, 30, 30);
  
  //beepboop lights!
   fill(random(255), random(255), random(255));
   frameRate(5);
   ellipse(383, 315, 10, 10);
   ellipse(363, 315, 10, 10);
   ellipse(343, 315, 10, 10);

}


