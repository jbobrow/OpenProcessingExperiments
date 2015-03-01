
int turkeyXvel;
int turkeyYvel;
int turkeyXpos;
int turkeyYpos;

PImage turkey;

void setup()
{
  size(700,700);
  background(255);
  turkey = loadImage("turkey.png");
  turkeyXpos = 300;
  turkeyYpos = 300;
  turkeyXvel = int(random(10)) - 5;
  turkeyYvel = int(random(10)) - 5;
  imageMode(CENTER);
}

void draw()
{
  background(255);
  moveTurkey();
  image(turkey,turkeyXpos,turkeyYpos);
}

void moveTurkey()
{
  if ((turkeyXpos > width) || (turkeyXpos < 0))
  {
    turkeyXvel = turkeyXvel * -1;
  }
  if ((turkeyYpos > height) || (turkeyYpos < 0))
  {
    turkeyYvel = turkeyYvel * -1;
  }
  
  turkeyXpos += turkeyXvel;
  turkeyYpos += turkeyYvel;
}

void mousePressed()
{
  if ((abs(mouseX - turkeyXpos) < 25) && (abs(mouseY - turkeyYpos) < 22))
  {
    turkeyXvel = 0;
    turkeyYvel = 0;
  }
}
  



