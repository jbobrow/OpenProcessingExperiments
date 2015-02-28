
PImage stripe = new PImage();
int x = 5;
int rate = 1;

void setup() {
  size(145, 153);
  background(0);
  fill(0);
  filter(BLUR);

  stripe = loadImage("stripe.png");
  frameRate(60);
}

void keyPressed()
{
  if (key == '+') rate++;
  else if (key == '-' && rate > 0) rate--;
  else if (key == 'r' || key == 'R') rate = 1;
}

void draw() {
  for (int i = 0; i < rate; i++)
  {
    x--;
    if (x < -stripe.width) x = 0;

    if (x % getFrameWidth() == 0 && mousePressed)
      break;
  }
  image(stripe, x, 0, stripe.width, stripe.height);
  image(stripe, x+stripe.width, 0, stripe.width, stripe.height);

  if (x % getFrameWidth() != 0 && mousePressed) {
    stroke(0);
    fill(0);
    rect(5, 5, width - 10, height - 10);
    filter(BLUR);
  }

  stroke(255);
  fill(255);
  text((int)frameRate, 0, 10);  

  if (frameCount % 10 == 0 && rate < 60) rate++;
  if (frameCount % 10 == 0 && rate > 60) rate--;
}

int getFrameWidth()
{
  return (int)(stripe.width/11);
}

