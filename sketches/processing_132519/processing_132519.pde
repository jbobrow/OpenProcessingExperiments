
int monsterY;
int monsterX;
boolean switcher;
int switches;
boolean test = true;
short kleur = 0;

void setup()
{
  size(300,300);
  monsterY = 310;
}


void draw()
{
  background(0,150,0);
  drawMonster();
  updateMonster();
  testMonster();
}

void updateMonster()
{
  monsterX = mouseX;
  if(switcher == false) { monsterY -= 8; }
  if(switcher == true) { monsterY += 8; }
}

void testMonster()
{
  if(monsterY > 300) { switcher = false; }
  if(monsterY < -150) { switcher = true; }
}

void drawMonster()
{
  stroke(0);
  fill(0);

  rect(monsterX,monsterY,50,50);
  rect(monsterX+100,monsterY,50,50);
  rect(monsterX+50,monsterY+50,50,25);
  rect(monsterX+25,monsterY+75,100,50);
  rect(monsterX+25,monsterY+125,25,25);
  rect(monsterX+100,monsterY+125,25,25);
}
