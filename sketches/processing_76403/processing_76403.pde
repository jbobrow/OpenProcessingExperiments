
//Allison Wong, Doubling Shapes, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

void setup()
{
  size(300,300);
  frameRate(10);
}
void draw()
{
  background(0);
  int x = 1;
  while(x<=100)
  {
    ellipse(int(random(150)),int(random(200)),10,10);
    stroke(107,209,211);
    strokeWeight(5);
    fill(167,110,198);
    x++;
    ellipse(int(random(50)),int(random(100)),20,20);
    stroke(229,93,191);
    strokeWeight(5);
    fill(94,232,127);
    x--;
    ellipse(int(random(100)),int(random(150)),21,21);
    stroke(232,115,82);
    strokeWeight(5);
    fill(232,197,82);
    x++;
    ellipse(int(random(200)),int(random(250)),30,30);
    stroke(13,23,191);
    strokeWeight(5);
    fill(180,18,48);
    x--3;
    ellipse(int(random(250)),int(random(300)),40,40);
    stroke(219,31,163);
    strokeWeight(5);
    fill(0,255,253);
    x++;
    ellipse(int(random(300)),int(random(350)),50,50);
    stroke(118,4,103);
    strokeWeight(5);
    fill(245,149,5);
    x--4;
  }
}
