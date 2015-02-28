
// size
int val=250;
void setup() {

  size(600, 600);
  smooth();
  background(255);
}
//240-280
void draw() {
  float mx=map(mouseX, 50, 550, 245, 280);
  float mw=dist(mouseX, mouseY, pmouseX, pmouseY);
  background(255);


  //FACE - does not move
  if (mousePressed == true) {
    strokeWeight(mw/3);
    stroke(0+mw*5, 0, 0);
  }
  noFill();
  beginShape();
  vertex(490, 30);
  vertex(215, 300);
  vertex(215, 520);
  vertex(385, 520);
  vertex(385, 300);
  vertex(110, 30);
  endShape();

  //RIGHT EYE
  if (mousePressed == true) {
    strokeWeight(mw/3);
    stroke(0+mw*5, 0, 0);
  }

  noFill();
  strokeCap(SQUARE);
  beginShape();
  vertex(320, 250);
  vertex(390, 320);
  vertex(495, 215);
  vertex(430, 150);
  vertex(385, 200);
  vertex(480, 200);
  endShape();
  fill(0);
  noStroke();
  triangle(430, 150, 385, 200, 480, 200);
  //UNDER RIGHT EYE
  strokeWeight(1);
  stroke(0);

  fill(255);

  triangle(385, mx-40, 480, mx-40, 430, mx+10);

  //LEFT EYE
  strokeCap(SQUARE);
  noFill();
  if (mousePressed == true) {
    strokeWeight(mw/3);
    stroke(0+mw*5, 0, 0);
  }
  beginShape();
  vertex(280, 250);
  vertex(210, 320);
  vertex(105, 215);
  vertex(170, 150);
  vertex(215, 200);
  vertex(120, 200);
  endShape();
  strokeWeight(1);
  fill(0);
  noStroke();
  triangle(120, 200, 215, 200, 170, 150);

  //UNDER LEFT EYE
  stroke(0);
 fill(255);
  triangle(120, mx-40, 215, mx-40, 170, mx+10);

  // NOSE does not move

  fill(255-mw*5, 0, 0);
  noStroke();
  quad(300, 295, 322, 317, 300, 339, 279, 317);
  noFill();
  stroke(0);
  quad(300, 338, 266, 304, 300, 270, 334, 304);
  if (mousePressed == true) {
    strokeWeight(mw/3);
    stroke(0+mw*5, 0, 0);
  }
  beginShape();
  vertex(220, 30);
  vertex(315, 125);
  vertex(245, 200);
  vertex(245, 320);
  vertex(300, 375);
  vertex(355, 320);
  vertex(355, 200);
  vertex(285, 125);
  vertex(380, 30);
  endShape();

  //MOUTH TOP *
  stroke(0);
  strokeWeight(1);
  fill(255);
  beginShape();
  vertex(300, 685-mx);
  vertex(245, 630-mx);
  vertex(245, 585-mx);
  vertex(300, 640-mx);
  vertex(355, 585-mx);
  vertex(355, 630-mx);
  endShape(CLOSE);

  //MOUTH BOTTOM *
  beginShape();
  fill(255);
  vertex(300, mx+205);
  vertex(245, mx+260);
  vertex(355, mx+260);
  endShape(CLOSE);




  //MOUTH RIGHT *
  fill(0);
  noStroke();
  beginShape();
  vertex(mx+60, 445);
  vertex(mx+115, 390);
  vertex(mx+160, 390);
  vertex(mx+105, 445);
  vertex(mx+160, 500);
  vertex(mx+115, 500);
  endShape(CLOSE);



  //MOUTH LEFT *
  fill(0);
  noStroke();
  beginShape();
  vertex(540-mx, 445);
  vertex(485-mx, 390);
  vertex(440-mx, 390);
  vertex(495-mx, 445);
  vertex(440-mx, 500);
  vertex(485-mx, 500);
  endShape(CLOSE);

  //WHISKERS *
  noFill();
  stroke(0);
  line(365, 310, mx+150, mx+95);
  line(365, 325, mx+150, mx+110);
  line(365, 340, mx+150, mx+125);

  line(450-mx, mx+95, 235, 310);
  line(450-mx, mx+110, 235, 325);
  line(450-mx, mx+125, 235, 340);
}



