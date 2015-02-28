
//Allison Wong, One Hundred Random Shapes, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

void setup()
{
  size(300,300);
  frameRate(10);
}
void draw()
{
  background(0);
  int i = 3;
  while(i<=100)
  {
    ellipse(int(random(150)),int(random(200)),40,40);
    stroke(107,209,211);
    strokeWeight(5);
    fill(167,110,198);
    i++;
    ellipse(int(random(50)),int(random(100)),30,30);
    stroke(229,93,191);
    strokeWeight(5);
    fill(94,232,127);
    i++;
    ellipse(int(random(100)),int(random(150)),20,20);
    stroke(232,115,82);
    strokeWeight(5);
    fill(232,197,82);
    i--;
    ellipse(int(random(200)),int(random(250)),10,10);
    stroke(13,23,191);
    strokeWeight(5);
    fill(180,18,48);
    i--;
    ellipse(int(random(250)),int(random(300)),50,50);
    stroke(219,31,163);
    strokeWeight(5);
    fill(0,255,253);
    i++;
    ellipse(int(random(300)),int(random(350)),21,21);
    stroke(118,4,103);
    strokeWeight(5);
    fill(245,149,5);
    i++;
  }
}
