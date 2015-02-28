
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/124919*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int second = 0;
boolean cols = false;
int count = 0;
boolean dir = false;
int speed = 3;
int x;
int c1;
int snelheid = 1;


void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
    background(255);
    updateX();
    monster( x, c1 );
    testRand();
    


}

void monster(int i, color c1){
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

void updateX(){
    x = x + snelheid;
    c1 = color(102, 204, 0);
}

void testRand(){
  if ( x > width || x < 0 ){
    snelheid = -snelheid;
  }
  }
