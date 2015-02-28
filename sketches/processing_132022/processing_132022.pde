
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/124919*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int second = 0;
boolean cols = false;
color c1 = color(102, 204, 0);
int count = 0;
boolean dir = false;
int speed = 3;
int posY = 500;


void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
    int posX = mouseX;
      background(255);
      stroke(0);
      fill(c1);
      rect( posX-50, posY-65, 100, 130 );
      fill(255, 102, 102);
      rect( posX-10, posY+10, 60, 40);
      fill(255, 51, 51);
      rect( posX+5, posY+40, 20, 10);
      fill(255);
      rect( posX, posY-35, 25, 40);
      fill(c1);
      ellipse( posX-50, posY+20, 30, 30);
      
      posY = posY - 1;


}
