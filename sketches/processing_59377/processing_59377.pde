
PShape f;
PShape b;
PShape bee;
PShape r;





void setup() { 
  f = loadShape("flower.svg");
  b = loadShape("bolt.svg");
  bee = loadShape("bee.svg");
  r = loadShape("rain.svg");
  size(1000, 500);
  smooth();
  noLoop();
}

void draw() {


  background(#63A4FC);// paint the background a nice sky blue
  //rays
  fill(12, 77, 193, 100);
  noStroke();
  ellipse(300, 100, 250, 250);
  //sun
  fill(#F6FA21);
  noStroke();
  ellipse(300, 100, 110, 110);

  fill(255);
  noStroke();
  // cloud 1
  ellipse(150, 100, 40, 40);
  ellipse(160, 130, 40, 40);
  ellipse(120, 140, 80, 80);
  ellipse(90, 150, 60, 60);

  //cloud 3
  ellipse(450, 100, 30, 30);
  ellipse(480, 115, 50, 50);
  ellipse(450, 145, 70, 70);
  ellipse(525, 130, 100, 100);
  ellipse(540, 100, 30, 30);

  //cloud 5
  ellipse(790, 55, 40, 40);
  ellipse(860, 80, 40, 40);
  ellipse(820, 90, 80, 80);
  ellipse(790, 100, 60, 60);

  // cloud 2 and 4
  ellipse(210, 210, 40, 40);
  ellipse(230, 220, 60, 60);
  ellipse(250, 215, 70, 70);
  ellipse(270, 225, 50, 50);

  ellipse(695, 200, 80, 80);
  ellipse(700, 225, 70, 70);
  ellipse(730, 210, 50, 50);
  ellipse(660, 230, 60, 60);

  fill(#63A4FC);
  ellipse(230, 220, 40, 40);
  ellipse(210, 210, 20, 20);
  ellipse(250, 215, 50, 50);
  ellipse(270, 225, 30, 30);

  ellipse(695, 200, 60, 60);
  ellipse(700, 225, 50, 50);
  ellipse(730, 210, 30, 30);
  ellipse(660, 230, 40, 40);


  //mountains
  fill(#18621B);
  arc(300, 500, 400, 400, PI, TWO_PI);
  arc(850, 500, 400, 400, PI, TWO_PI);
  fill(#18931D);
  noStroke();
  arc(150, 500, 400, 400, PI, TWO_PI);
  arc(550, 500, 450, 450, PI, TWO_PI);
  fill(#3EC144);
  arc(300, 500, 300, 300, PI, TWO_PI);
  arc(600, 500, 350, 350, PI, TWO_PI);
  arc(800, 500, 300, 300, PI, TWO_PI);
  fill(#5FEA64);
  arc(500, 500, 200, 200, PI, TWO_PI);
  arc(900, 500, 250, 250, PI, TWO_PI);

  //bee

  shape(bee, 170, 200);
  
  //bolt
  shape(b, 100, 600);

  //flowers

  shape(f, 200, 400);
  shape(f, 300, 440);
  shape(f, 500, 300);
  shape(f, 400, 350);
  shape(f, 100, 320);
  shape(f, 50, 450);
  shape(f, 500, 450);
  shape(f, 600, 350);
  shape(f, 650, 450);
  shape(f, 800, 470);
  shape(f, 800, 370);
  shape(f, 940, 420);


}



