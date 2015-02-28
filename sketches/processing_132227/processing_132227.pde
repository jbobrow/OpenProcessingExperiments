
int monsterY;
boolean switcher;

void setup()
{
  size(300,300);
  monsterY = 310;
}


void draw()
{
  background(0,150,0);
  stroke(0);
  fill(0);

  rect(mouseX,monsterY,50,50);
  rect(mouseX+100,monsterY,50,50);
  rect(mouseX+50,monsterY+50,50,25);
  rect(mouseX+25,monsterY+75,100,50);
  rect(mouseX+25,monsterY+125,25,25);
  rect(mouseX+100,monsterY+125,25,25);
  
  if(monsterY > 300) { switcher = false; }
  if(monsterY < -150) { switcher = true; }
  if(switcher == false) { monsterY -= 8; }
  if(switcher == true) { monsterY += 8; }
}
