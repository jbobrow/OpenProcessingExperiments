
float mouthSize;
float pacX;
float pacY;
float Xspeed=2;
float Yspeed=0;
int score;

void setup()
{
  size(750, 750);
  background(0);
  mouthSize = PI/5;
  pacX = 100;
  pacY = height/2;
}

void draw()
{

  if (pacX>width+100)
    pacX=-100;

  background(0);
  fill(255);
  text("Score: "+score, 100, 100);
  for (int x=0; x<=675; x+=75) {
    if (pacX>=x){
      fill(0);
    }
    ellipse(x, height/2, 40, 40);
  }
  fill(255, 255, 0);
  arc(pacX, pacY, 200, 200, mouthSize, 2*PI-mouthSize);
  pacX+=Xspeed;
  pacY+=Yspeed;
  if (dist(mouseX, mouseY, pacX, pacY)<=100)
  {
    score++;
    text("YOU GET SOME POINTS!", pacX-80, 500);
  }
}

