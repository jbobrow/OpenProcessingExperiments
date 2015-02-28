
void setup()
{
  size(500, 500);
  smooth();
  background(135, 190, 255);  //sky
}


void draw()
{
  noStroke();
  fill(30, 125, 36); //dark green
  rect(0, 250, 500, 50);
  fill(30, 125, 36); //big moutain
  ellipse(150, 275, 250, 300);
  fill(30, 125, 36); //small moutain
  ellipse(350, 320, 250, 300);
  fill(255); //cloud 1
  rect(80, 50, 100, 40, 90);
  fill(255); //white circle1
  ellipse(90, 50, 60, 60);
  fill(255); //white circle2
  ellipse(135, 60, 80, 70);
  fill(255); //white circle3
  ellipse(90, 80, 100, 75);
  fill(255); //white circle4
  ellipse(150, 80, 100, 60);
  fill(255); //cloud 2
  rect(320, 80, 100, 60, 90);
  fill(255); //white circle1
  ellipse(340, 80, 80, 70);
  fill(255); //white circle2
  ellipse(390, 90, 70, 70);
  fill(255); //white circle3
  ellipse(340, 120, 115, 80);
  fill(255); //white circle4
  ellipse(400, 120, 80, 60);
  fill(162, 162, 162); //ground
  rect(0, 350, 500, 150);
  fill(30, 185, 40); //light green
  rect(0, 300, 500, 50);
  fill(255, 230, 0); //yellow stripe1
  rect(50, 410, 100, 30, 20);
  fill(255, 230, 0); //yellow stripe2
  rect(200, 410, 100, 30, 20);
  fill(255, 230, 0); //yellow stripe3
  rect(350, 410, 100, 30, 20);

  //car-body
  fill(0);
  quad(78, 258, 452, 268, 462, 372, 58, 372 );
  fill(0);
  quad(198, 168, 377, 188, 382, 272, 148, 268 );
  fill(255, 66, 78);
  quad(80, 260, 450, 270, 460, 370, 60, 370 );
  fill(255, 66, 78);
  quad(200, 170, 375, 190, 380, 270, 150, 270);

  //car-windows
  fill(227, 242, 255);
  quad(210, 185, 275, 192, 260, 265, 170, 260);
  fill(227, 242, 255);
  quad(290, 195, 360, 200, 365, 270, 275, 265);
  //tires
  fill(52, 52, 52);
  ellipse(180, 370, 90, 90);
  fill(52, 52, 52);
  ellipse(350, 370, 90, 90);
  fill(110, 110, 110);
  ellipse(180, 370, 60, 60);
  fill(110, 110, 110);
  ellipse(350, 370, 60, 60);
  fill(220, 220, 220);
  ellipse(180, 370, 50, 50);
  fill(220, 220, 220);
  ellipse(350, 370, 50, 50);

  //others
  stroke(0);
  fill(220, 220, 220);
  rect(45, 340, 70, 30, 18, 10, 16, 20);
  fill(220, 220, 220);
  rect(420, 340, 50, 30, 18, 10, 16, 20);
  fill(252, 255, 124);
  ellipse(100, 300, 30, 40);
  fill(126, 36, 3);
  ellipse(440, 300, 20, 40);
  fill(220, 220, 220);
  ellipse(240, 280, 30, 10);
}



