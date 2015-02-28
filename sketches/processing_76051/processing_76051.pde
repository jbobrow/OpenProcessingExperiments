
//Philip H cp 14/15
// 100 random shapes
int life = 500;
void setup()
{
  textSize(30);
  size(500, 500);
}
void draw()
{

  frameRate(5);
  background(255);
  tornadoMaker();

  fill(240,22,22);
  rect(0,450,life,50);
  life--;
  
  stroke(0);
  noFill();
  rect(0,449,500,51);
  stroke(10);
  fill(0);
  ellipse(mouseX,mouseY,30,30);
  fill(0);
  text("life",250,446);
  if(life<0)
  {
    background(0);
    fill(255);
    textSize(40);
    text("Game Over",30,140);
    text("Please Restart",30,200);
  }
}
void tornadoMaker()
{
    int i = 0;
  while (i<=100)
  {
    fill(int(random(0,226)),int(random(0,226)),int(random(0,226)));
    ellipse(int(random(0, 501)), int(random(0, 501)), int(random(10,100)),int(random(10,100)));
    i++;
  }
}
