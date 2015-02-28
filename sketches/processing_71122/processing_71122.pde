
void setup()
{
  size(600, 600);
  background(0);
}
float x=0;
int y=0;
float changex=5.5;
int changey=10;
void draw()
{
  background(0);
  fill(255);
  noCursor();
  textSize(30);
  textAlign(CENTER);
  text("Find the black dot and shoot it", 300, 50);
  text("You have an infinite number of shots", 300,100);
  text("Press LMB or RMB to shoot", 300,575);
  fill(255, 255, 255, 100);
  ellipse(mouseX, mouseY, 300, 300);
  line(mouseX-150, mouseY, mouseX+150, mouseY);
  line(mouseX, mouseY-150, mouseX, mouseY+150);
  fill(0);
  ellipse(300+y, 300+x, 30, 30);
  y=y+changey;
  x=x+changex;
  if (x>240)
  {
    changex=changex-11;
  }
  if (x<-160)
  {
    changex=changex+11;
  }
  if (y>300)
  {
    changey=changey-20;
  }
  if (y<-300)
  {
    changey=changey+20;
  }
  if (mousePressed==true)
  {
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("You missed!", 300, 500);
    textSize(50);
    text("Mission Failed", 300, 300);
  }
}
