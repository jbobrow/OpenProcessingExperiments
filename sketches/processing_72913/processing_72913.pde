
//Sarah C, CP1 16/17, Ticklish Penguin

PImage pen1;
PImage pen2;
boolean armsIn = true;
int randNum = 2;

void setup()
{
  size(400, 400);
  background(196, 242, 242);
  pen1 = loadImage("http://flippythegreat.webs.com/TicklishPenguin/Penguin.jpg");
  pen2 = loadImage("http://flippythegreat.webs.com/TicklishPenguin/PenguinTickle.jpg");
}
void draw()
{
  frameRate(30);
  if (armsIn == false)
  {
    //ticklish Penguin
    background(196, 242, 242);
    image(pen2, 55 + randNum, 22 + randNum, 286, 292);
    
    //fish
    smooth();
    noStroke();
    fill(255, 113, 108);
    ellipse(320, 320, 24, 15);
    triangle(329, 320, 340, 314, 340, 327);
    fill(0);
    ellipse(314, 318, 2, 2);
    fill(255);
    ellipse(315, 317, 2, 1);
  }
  else
  {
    //happy Penguin
    background(196, 242, 242);
    image(pen1, 50, 20, 299, 297);
  }
  randNum = randNum + int(random(-5,6));
}

void mousePressed()
{
  armsIn = !armsIn;
}

/** To scare the penguin, click on it. <br>
Give it back its fish by clicking on it.
*/
