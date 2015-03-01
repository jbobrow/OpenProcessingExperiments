
boolean doubleP = false;
int Y;
int Bx;
int By;

void setup()
{
  size(600, 800);
}

void draw()
{
  mainPage();
}

void mainPage() 
{
  background(0);
  buttonPlay();
}


void buttonPlay() 
{
  fill(color(0,128,102));
  rect(300,400,100,100);
   
  fill(0);
   
  if (mousePressed && (pmouseX >= 300) && (pmouseX <= 600) && (pmouseY >= 400) && (pmouseY <= 500)) {
    doubleP = true;
  }
  if (doubleP == true) {
    play();
  }
}
 
void play() 
{
  background(0);
  Y = mouseY;
  fill(color(255));
  rect(10, Y, 30, 200);
  ellipse(300, 400, 30, 30);
}




