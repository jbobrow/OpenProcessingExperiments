
int monsterY;
int monsterX;
//boolean switcher;
//int switches;

void setup()
{
  size(1000,300);
  monsterY = height/4;
}


void draw()
{
  background(0,150,0);
  drawMonster();
  
  for (int i = 0; i < 500; i++)
  {
    monsterX += 200;
    drawMonster();
  }
  monsterX = 0;
  
  //updateMonster();
  //testMonster();
}

/*
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
} */



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
