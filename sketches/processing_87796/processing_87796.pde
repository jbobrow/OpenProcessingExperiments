
void setup() {
  background(220, 231, 243);
  size(640, 480);
  smooth();
}

void draw() {
  background(220, 231, 243);
  noStroke();
  //ears
  float b = map(mouseX, 0, height, 177, 187);
  fill(250, 180, 180);
  ellipse(153, b, 50, 50);
  ellipse(480, b, 50, 50);
  //face
  fill(158, 153, 159);
  rect(155, 15, 325, 280);
  ellipse(318, 300, 326, 324);

  //eyes
  fill(255);
  ellipse(240, 150, 90, 90);
  ellipse(400, 150, 90, 90);

  //negspace
  fill(158, 153, 159);
  float a = map(mouseX, 0, width, 80, 50);
  ellipse(240, 120, 90, a);
  ellipse(400, 120, 90, a);

  //pupils
  fill(0);
  ellipse(240, 175, 10, 10);
  ellipse(400, 175, 10, 10);

  //mustache
  fill(0);
  quad(330, 225, 330, 255, 450, 275, 435, 255);
  quad(310, 225, 310, 255, 190, 275, 205, 255);

  //nose
  stroke(250, 180, 180);
  smooth();
  strokeCap(SQUARE);
  strokeWeight(7);
  line(310, 255, 310, 191);
  line(330, 255, 330, 191);

  //brows
  stroke(115, 0, 0);
  strokeWeight(15);
  smooth();
  strokeCap(SQUARE);

  float c = map(mouseX, 0, width, 105, 90);
  float f = map(mouseX, 0, width, 85, 70);
  line(195, c, 278, f);
  line(360, f, 443, c);

  //hair
  fill(0);
  noStroke();
  triangle(155, 15, 155, 75, 271, 15);
  triangle(271, 15, 480, 75, 480, 15);
  //goatee
  triangle(310, 419, 330, 419, 320, 437);


  //mouth
  fill(180, 6, 6);
  float d = map(mouseX, 0, width, 65, 225);
  float e = map(mouseX, 0, width, 55, 165);
  ellipse(320, 337, d, e);

  //lightning!!!
  float g = map(mouseX, 0, width, -130, 255);  
  fill(215, 223, 31,g);
  triangle(15, 217, 83, 248, 80, 270);
  triangle(70, 220, 67, 243, 146, 267);
  //
  triangle(56, 322, 130, 326, 134, 348);
  triangle(113, 326, 196, 322, 108, 303);
  //
  triangle(131, 425, 149, 438, 206, 376);
  triangle(107, 475, 181, 438, 163, 426);
  //
  triangle(444, 366, 501, 427, 518, 415);
  triangle(469, 427, 488, 415, 543, 464);
  //
  triangle(453, 321, 540, 303, 536, 326);
  triangle(518, 326, 514, 347, 592, 322);
  //
  triangle(626, 218, 561, 270, 557, 248);
  triangle(571, 220, 574, 242, 495, 266);
}



