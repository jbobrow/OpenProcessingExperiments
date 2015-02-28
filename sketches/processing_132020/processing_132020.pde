
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/124919*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int second = 0;
boolean cols = false;
color c1 = color(102, 204, 0);
int count = 0;
boolean dir = false;
int speed = 3;


void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
    for (int i = 0; i < 500; i = i + 10 ){
      stroke(0);
      fill(c1);
      rect( i-50, 250-65, 100, 130 );
      fill(255, 102, 102);
      rect( i-10, 250+10, 60, 40);
      fill(255, 51, 51);
      rect( i+5, 250+40, 20, 10);
      fill(255);
      rect( i, 250-35, 25, 40);
      fill(c1);
      ellipse( i-50, 250+20, 30, 30);

    }
}
