
//Sydney Chan CP1 mods: 4/5 Ticklish Penguin
int y = 150;
int y2 = 70;
int y3 = 100;
int y4 = 120;
PImage arm;
void setup()
{
  size(280,280);
  fill(255,255,255,30);
  rect(0,0,300,300);
  arm = loadImage("CleaningArm.JPG");
}
void draw()
{
  noStroke();
  fill(255,255,255);
  rect(0,y-1,70+1,90+2);
  image(arm,0,y,70,90);
  y = y + int(random(-2,2));
  rect(0+70,y2-1,71,92);
  image(arm,70,y2,70,90);
  y2 = y2 + int(random(-2,2));
  rect(140,y3-1,71,92);
  image(arm,140,y3,70,90);
  y3 = y3 + int(random(-2,2));
  rect(210,y4-1,71,92);
  image(arm,210,y4,70,90);
  y4 = y4 + int(random(-2,2));
}

