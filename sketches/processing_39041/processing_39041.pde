
void setup() {
  size(500, 300);
  background(94,99,170);
}

void draw() {
  pushMatrix();
  for (int a=-50; a<width; a+=50) {
    for (int b=0; b<100; b+=50) {
      angryParris(random(a), b);
    }
  }
  popMatrix();
  smooth();
  
  //clouds
  fill(100);
  noStroke();
  ellipse(280,0,30,50);
  ellipse(260,20,40,25);
  ellipse(290,10,60,30);
  ellipse(290,20,30,30);
  
    ellipse(480,0,30,50);
  ellipse(460,20,40,25);
  ellipse(420,10,60,30);
  ellipse(440,0,30,30);
  
  //boat
  fill(255);
  arc(250, 150, 60, 60, PI/2, PI);
  arc(300, 150, 60, 60, 0, PI/2);
  rect(270, 180, 60, 30);
  //helpless man
  fill(0);
  rect(268, 74, 34, 33);
  fill(255, 250, 242);
  rect(270, 80, 30, 40);

  strokeWeight(1.2);
  stroke(0);
  line(273, 90, 280, 88);
  line(285, 88, 292, 90);
  strokeWeight(5);
  point(278, 95);
  point(288, 95);
  
  strokeWeight(1);
  line(284,88,284,105);
  line(284,105,280,105);
  fill(111,27,38);
  ellipse(280,108,6,6);
  
  strokeWeight(3);
  line(285,120,285,178);
  line(285,140,260,120);
  line(285,140,295,115);
}

void angryParris(float x, float y) {
  translate(x, y);

  //hair
  ellipseMode(CORNER);
  fill(0);
  stroke(0);
  ellipse(50, 10, 100, 100);

  //face
  fill(245, 165, 143);
  noStroke();
  rect(70, 30, 60, 80);
  stroke(0);
  strokeWeight(2);

  //eyes
  line(83, 50, 92, 55);
  line(109, 55, 118, 50);
  strokeWeight(5);
  stroke(72, 18, 4);
  point(87.5, 61);
  point(113.5, 61);

  //facial features
  stroke(0);
  strokeWeight(1);
  line(100, 55, 100, 80);
  line(100, 80, 106, 80);
  line(106, 80, 106, 77);
  line(92, 77, 92, 80);
  line(92, 80, 96, 80);
  fill(245, 165, 143);
  rect(90, 90, 20, 3);
  rect(89, 93, 22, 5);
  strokeWeight(6);
  stroke(0, 0, 0, 170);
  line(100, 101, 100, 110);
  line(70, 109, 130, 109);
  strokeWeight(4);
  line(89, 88, 111, 88);
}


