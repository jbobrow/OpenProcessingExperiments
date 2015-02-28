
monster monster1;
monster monster2;
monster monster3;

void setup()
{
  size(1000,300);
  monster1 = new monster(200, 150);
  monster2 = new monster(500, 100);
  monster3 = new monster(700, 200);

}


void draw()
{
  background(0,150,0);
  
  monster1.drawMonster();  
  monster1.updateMonster();
  monster1.testMonster();
  
  monster2.drawMonster();  
  monster2.updateMonster();
  monster2.testMonster();
  
  monster3.drawMonster();  
  monster3.updateMonster();
  monster3.testMonster();
}

class monster
{
  int monsterY;
  int monsterX;
  boolean switcher; 
  
  monster(int tempX, int tempY)
  {
    monsterX = tempX;
    monsterY = tempY;
    switcher = true;
  }
  
  
  void updateMonster()
  {
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
}
