
int x;
int y;
int i;
int bar;
void setup()
{
  rectMode(CENTER);
  x=500;
  y=500;
  size(900,900);
  fill(0);
  rect(450,450,900,900);

}
void mouseClicked()
{
   bar = 0;
   while (mouseButton == RIGHT) {
     bar = bar + 1;
   }
   while (mouseButton == LEFT) {
     bar = bar - 1;
   }
}
void draw()
{
  for (int i = 0; i <10; i = i + 1) {
    x = int(random(900));
    y = int(random(900));
    if (x > (450 + bar)) {
      fill(255,random(100),0,100);
      ellipse(x,y,random(200),random(200));
    }
  }
  for (int i = 0; i <10; i = i + 1) {
    x = int(random(900));
    y = int(random(900));
    if (x < (450 + bar)) {
      fill(0,0,255,100);
      ellipse(x,y,random(200),random(200));
    }
  }
  fill(random(255),random(255),random(255),random(255));
  rect(mouseX + 75,mouseY + 75,random(75),random(75));
  fill(random(255),random(255),random(255),random(255));
  rect(mouseX + 75,mouseY - 75,random(75),random(75));
  fill(random(255),random(255),random(255),random(255));
  rect(mouseX - 75,mouseY - 75,random(75),random(75));
  fill(random(255),random(255),random(255),random(255));
  rect(mouseX - 75,mouseY + 75,random(75),random(75));
}
