
//Michelle Z, CP1 4-5, Functions and Animation (Ladybugs)

float x = 0;
int y = 0;
float xChange = 0.2;
float ladybugX = 0;
float secondLadybugX = 0;
int antennaeTwitch1 = 0;
int antennaeTwitch2 = 0;

void setup()
{
  size(500, 600);
  smooth();
}

void draw()
{
  fill(92, 219, 252);
  rect(0, 0, 500, 600);
  cloud();
  flowers();
  hill();
  leafAndLadybugs();
}

void mouseClicked()
{
  x = 0;
  y = 0;
  xChange = 0.2;
  ladybugX = 0;
  secondLadybugX = 0;
}

void cloud()
{
  fill(255);
  noStroke();
  ellipse(300, 120, 300, 150);
  ellipse(220, 70, 85, 85);
  ellipse(290, 60, 85, 85);
  ellipse(360, 70, 80, 70);
  ellipse(420, 100, 90, 90);
  ellipse(410, 150, 80, 70);
  ellipse(350, 180, 80, 80);
  ellipse(275, 175, 90, 80);
  ellipse(200, 170, 80, 80);
  ellipse(150, 150, 80, 80);
  ellipse(160, 100, 90, 90);
}

void flowers()
{
  noStroke();
  fill(0, 180, 7);
  rect(70, 400, 5, 100);
  rect(170, 370, 5, 100);
  rect(270, 350, 5, 100);
  rect(370, 337, 5, 100);
  rect(470, 330, 5, 100);
  fill(255, 141, 0);
  ellipse(55, 400, 25, 30);
  ellipse(90, 400, 25, 30);
  ellipse(72.5, 382.5, 30, 25);
  ellipse(72.5, 417.5, 30, 25);
  ellipse(272.5-17.5, 350, 25, 30);
  ellipse(272.5+17.5, 350, 25, 30);
  ellipse(272.5, 350+17.5, 30, 25);
  ellipse(272.5, 350-17.5, 30, 25);
  ellipse(472.5-17.5, 330, 25, 30);
  ellipse(472.5+17.5, 330, 25, 30);
  ellipse(472.5, 330+17.5, 30, 25);
  ellipse(472.5, 330-17.5, 30, 25);
  fill(186, 0, 255);
  ellipse(172.5-17.5, 370, 25, 30);
  ellipse(172.5+17.5, 370, 25, 30);
  ellipse(172.5, 370-17.5, 30, 25);
  ellipse(172.5, 370+17.5, 30, 25);
  ellipse(372.5-17.5, 337, 25, 30);
  ellipse(372.5+17.5, 337, 25, 30);
  ellipse(372.5, 337-17.5, 30, 25);
  ellipse(372.5, 337+17.5, 30, 25);
  fill(255, 217, 0);
  ellipse(72.5, 400, 25, 25);
  ellipse(172.5, 370, 25, 25);
  ellipse(272.5, 350, 25, 25);
  ellipse(372.5, 337, 25, 25);
  ellipse(472.5, 330, 25, 25);
}

void hill()
{
  fill(64, 209, 21);
  stroke(0, 113, 4);
  ellipse(500, 600, 1100, 400);
} 

void leafAndLadybugs()
{
  //leaf
  stroke(0, 113, 4);
  fill(0, 180, 7);
  beginShape();
  curveVertex(50+x, 50+y);
  curveVertex(50+x, 50+y);
  curveVertex(100+x, 30+y);
  curveVertex(150+x, 43+y);
  curveVertex(135+x, 60+y);
  curveVertex(100+x, 70+y);
  curveVertex(67+x, 66+y);
  curveVertex(50+x, 50+y);
  curveVertex(50+x, 50+y);
  endShape();

  //line on leaf
  noFill();
  curveTightness(-.2);
  beginShape();
  curveVertex(40+x, 46+y);
  curveVertex(40+x, 46+y);
  curveVertex(50+x, 50+y);
  curveVertex(80+x, 57+y);
  curveVertex(130+x, 50+y);
  curveVertex(130+x, 50+y);
  endShape();

  //ladybug
  stroke(0);
  fill(0);
  ellipse(99+x+ladybugX, 41+y, 26, 20);
  fill(255, 0, 0);
  ellipse(100+x+ladybugX, 40+y, 26, 20);
  fill(0);
  ellipse(113+x+ladybugX, 40+y, 12, 12);
  ellipse(100+x+ladybugX, 35+y, 5, 5);
  ellipse(92+x+ladybugX, 40+y, 5, 5);
  ellipse(98+x+ladybugX, 45+y, 5, 5);
  line(87+x+ladybugX, 40+y, 113+x+ladybugX, 40+y);
  line(113+x+ladybugX, 40+y, 122+x+ladybugX, 35+y+antennaeTwitch1);
  line(113+x+ladybugX, 39+y, 122+x+ladybugX, 34+y+antennaeTwitch1);
  line(113+x+ladybugX, 40+y, 122+x+ladybugX, 45+y+antennaeTwitch2);
  line(113+x+ladybugX, 39+y, 122+x+ladybugX, 46+y+antennaeTwitch2);

  //second ladybug
  stroke(0);
  fill(0);
  ellipse(531+secondLadybugX, 541, 26, 20);
  fill(255, 0, 0);
  ellipse(530+secondLadybugX, 540, 26, 20);
  fill(0);
  ellipse(530-13+secondLadybugX, 540, 12, 12);
  ellipse(530+secondLadybugX, 535, 5, 5);
  ellipse(538+secondLadybugX, 540, 5, 5);
  ellipse(528+secondLadybugX, 545, 5, 5);
  line(530-13+secondLadybugX, 540, 543+secondLadybugX, 540);
  line(530-13+secondLadybugX, 540, 530-22+secondLadybugX, 495+40+antennaeTwitch2);
  line(530-13+secondLadybugX, 540, 530-22+secondLadybugX, 494+40+antennaeTwitch2);
  line(530-13+secondLadybugX, 540, 530-22+secondLadybugX, 545+antennaeTwitch1);
  line(530-13+secondLadybugX, 540, 530-22+secondLadybugX, 546+antennaeTwitch1);

  //movement
  frameRate(50);
  x = x + xChange;
  if (x > 250)
  {
    xChange = xChange - 0.2;
  }
  if (x < 50)
  {
    xChange = xChange + 0.2;
  }

  y = y + 1;
  if (y > 500)
  {
    frameRate(10);
    y = y - 1;
    xChange = 0;
    ladybugX = ladybugX + 0.7;
    secondLadybugX = secondLadybugX - 0.7;
    if (ladybugX > 120)
    {
      frameRate(5);
      ladybugX = ladybugX - 0.7;
      secondLadybugX = secondLadybugX + 0.7;
      antennaeTwitch1 = antennaeTwitch1 + 1;
      antennaeTwitch2 = antennaeTwitch2 - 1;
      if (antennaeTwitch1 == 1)
      {
        antennaeTwitch1 = antennaeTwitch1 - 2;
        antennaeTwitch2 = antennaeTwitch2 + 2;
      }
    }
  }
}

