
int newScene=0;

float circleX;
float circleY;
float circleA;
float circleB;
float gnomeX;
float gnomeY;

void setup()
{
  size(600, 400);
  background(255, 255, 255);
  smooth();
  textSize(36);
  frameRate(10);
  
  
  circleX = 575;
  circleY = 200;
  circleA = 300;
  circleB = 200;
  
}



void draw()
{
  
  textAlign(CENTER);

  if (newScene == 0)
  {
    fill(random(255), 0, random(255), 255);
    text("Mushroom Hunt\n press spacebar to play", 300, 200);
  }

  if (newScene == 1)
  {
    image(loadImage("scene1.png"), 0, 0);
    fill(random(255), 0, random(255), 255);
    text ("pick the highest one", 300, 25);

    fill(0, 0, 0, 0);
    noStroke();
    ellipse(circleX, circleY, 20, 20);
  }

  if (newScene == 2)
  {
    image(loadImage("scene2.png"), 0, 0);
    fill(random(255), 0, random(255), 255);
    text ("pick the blue one", 300, 25);


    fill(0, 0, 0,0);
    noStroke();
    ellipse(circleA, circleB, 300, 300);
  }
  if (newScene == 3)
  { 
    gnomeX = random(600);
    gnomeY = random(400);
    image(loadImage("scene3.png"),0,0);
    image(loadImage("gnome1.png"), gnomeX, gnomeY);
    fill(random(255), 0, random(255), 255);
    text ("catch the gnome", 300, 375);
  }
  if (newScene == 4)
  {
  background(255,255,255);
  fill(random(255), 0, random(255), 255);
  text ("YOU WIN!", 300, 200);
  }
}

void mousePressed()
{
  if ((dist(circleX, circleY, mouseX, mouseY) <= 20) && (newScene == 1))
  {
    newScene++;
  }

  if ((dist(circleA, circleB, mouseX, mouseY) <= 100) && (newScene == 2))
  {
    newScene++;
  }
  
  if ((dist(gnomeX, gnomeY, mouseX, mouseY) <= 50) && (newScene == 3))
  {
    newScene++;
  }

}


void keyPressed()
{
  if ((key == ' ') && (newScene == 0))
  {
    newScene++;
  }
}

