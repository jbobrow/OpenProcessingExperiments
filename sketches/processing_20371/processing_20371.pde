
void setup() {
  size(800,600);
  smooth();
  background(129,4,4);
}
void draw() {
  noFill();
  stroke(255);
  strokeWeight(3);
  rect(150,50,500,500);
  rect(250,150,300,300);

  line(150,50,250,150);
  line(650,50,550,150);
  line(150,550,250,450);
  line(650,550,550,450);

  beginShape();
  vertex(250,450);
  bezierVertex(282,444,298,450, 303, 416);
  bezierVertex(294,368,306,357, 334,367);
  bezierVertex(362,372,358,354, 348,314);
  endShape();

  beginShape();
  vertex(150,50);
  bezierVertex(156,23,142,17, 121, 37);
  bezierVertex(98,59,88,46, 85, 24);
  bezierVertex(85,0,82,-10, 38, 42);
  endShape();

  beginShape();
  vertex(650,50);
  bezierVertex(640,28,655,20, 667,40);
  bezierVertex(695,85,710,95, 710,32);
  bezierVertex(700,-30,747,8, 752,20);
  endShape();

  beginShape();
  vertex(650,550);
  bezierVertex(680,584,692,592, 710,576);
  bezierVertex(746,534,755,526, 751,587);
  bezierVertex(750,610,775,638, 810,540);
  endShape();
}


