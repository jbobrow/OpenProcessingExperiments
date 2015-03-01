
void setup () {
  size(640, 500);
  noStroke();
}

void draw () {
  background(0);
  fill(#FFFFFF);
for (int i = 0; i <30; i++) {
for (int j = 0; j <30; j++) {
star=("processingStar.png");
image(star,20*i,40*j,30,30); 
}
}
 //head//
 fill(#c4ff10);
  ellipse(325, 177, 300, 150);

 //ears//
  fill(#c4ff10);
  ellipse(260, 160, 50, 150);

  fill(#c4ff10);
  ellipse(382, 160, 50, 150);

 //eyes//
  fill(255);
  ellipse(382, 160, 75, 25);

  fill(255);
  ellipse(260, 160, 75, 25);

  fill(0);
  ellipse(260, 160, 25, 25);

  fill(0);
  ellipse(382, 160, 25, 25);

  fill(255);
  ellipse(267, 160, 20, 7);

  fill(255);
  ellipse(390, 160, 20, 7);

  fill(0);
  ellipse(344, 195, 20, 5);

  fill(0);
  ellipse(344, 195, 20, 5);


  fill(0);
  ellipse(305, 195, 20, 5);

  fill(#c4ff10);
  ellipse(323, 258, 30, 50);

  fill(#c4ff10);
  ellipse(323, 340, 150, 150);

  fill (255);
  text(mouseX + "," + mouseY, 20, 20);
}



