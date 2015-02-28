
int a;
int b;

void setup()
{
  size(500, 500);
  smooth();
}

void draw()
{
  background(135, 190, 255);  //sky
  noStroke();

  fill(30, 125, 36); 
  rect(0, 250, 500, 50);
  ellipse(150, 275, 250, 300);
  ellipse(350, 320, 250, 300);

  fill(255);
  rect(80, 50, 100, 40, 90);
  ellipse(90, 50, 60, 60);
  ellipse(135, 60, 80, 70);
  ellipse(90, 80, 100, 75);
  ellipse(150, 80, 100, 60);
  rect(320, 80, 100, 60, 90);
  ellipse(340, 80, 80, 70);
  ellipse(390, 90, 70, 70);
  ellipse(340, 120, 115, 80);
  ellipse(400, 120, 80, 60);

  fill(162); //ground
  rect(0, 350, 500, 150);

  fill(30, 185, 40); //light green
  rect(0, 300, 500, 50);

  fill(255, 230, 0); //yellow stripe
  rect(50, 410, 100, 30, 20);
  rect(200, 410, 100, 30, 20);
  rect(350, 410, 100, 30, 20);

  noStroke();
  fill(255, 66, 78);
  beginShape();
  vertex(80+a, 260+b);
  vertex(60+a, 370+b);
  vertex(460+a, 370+b);
  vertex(450+a, 270+b);
  vertex(380+a, 270+b);
  vertex(375+a, 190+b);
  vertex(200+a, 170+b);
  vertex(150+a, 270+b);
  endShape(CLOSE);

  noStroke();
  fill(227, 242, 255);
  beginShape();
  vertex(210+a, 185+b);
  vertex(275+a, 192+b);
  vertex(260+a, 265+b);
  vertex(170+a, 260+b);
  endShape(CLOSE);

  noStroke();
  fill(227, 242, 255);
  beginShape();
  vertex(290+a, 195+b);
  vertex(360+a, 200+b);
  vertex(365+a, 270+b);
  vertex(275+a, 265+b);
  endShape(CLOSE);

  fill(52);
  ellipse(180+a, 370+b, 90, 90);
  fill(52);
  ellipse(350+a, 370+b, 90, 90);
  fill(110);
  ellipse(180+a, 370+b, 60, 60);
  fill(110);
  ellipse(350+a, 370+b, 60, 60);
  fill(220);
  ellipse(180+a, 370+b, 50, 50);
  fill(220);
  ellipse(350+a, 370+b, 50, 50);

  stroke(0);
  fill(220);
  rect(45+a, 340+b, 70, 30, 18, 10, 16, 20);
  fill(220);
  rect(420+a, 340+b, 50, 30, 18, 10, 16, 20);
  fill(252, 255, 124);
  ellipse(100+a, 300+b, 30, 40);
  fill(126, 36, 3);
  ellipse(440+a, 300+b, 20, 40);
  fill(220);
  ellipse(240+a, 280+b, 30, 10);

  a-=3;
}



