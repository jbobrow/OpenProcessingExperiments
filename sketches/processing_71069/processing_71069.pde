
int circleX = 400;
int circleY = 250;
int t1 = 10;
int t2 = 5;

int scoreA = 0;
int scoreB = 0;

int cpu = 213;
 
void setup ()
{
  size (800, 500);
  smooth();
}

void draw()
{
  //background
  fill (0);
  rect (0, 0, width, height-75);
  fill (255, 0, 0);
  rect (397, 0, 6, 425);
  
  fill (255);
  rect (0, 425, 800, 75);
  //score
  PFont font;
 font = loadFont ("Amienne-48.vlw");
 textFont (font, 30);
 fill (0);
 text (scoreA, 190, 480);
 fill (0);
 text (scoreB, 615, 480);

  
  //user paddle
  fill (255);
  noStroke ();
  rect (790, mouseY-40, 10, 80);
  if (mouseY >= 385) {
    mouseY = 385;
  }
  //cup paddle
  fill (255);
  rect (0, cpu-40, 10, 80);
  if (cpu >=385) {
    cpu = 385;
  }
   
   //ball
  fill (circleX,circleY,255,128);
  ellipse (circleX, circleY, 20, 20);
  circleX = circleX +t1;
  circleY = circleY +t2;
  
  //bouncing on the long edge
  if ((circleY > 410) || (circleY <10)) {
    t2 = t2 * -1;
  }
  
  //user side bounce
  if (circleX == 780) {
    if ((circleY > mouseY-40) && (circleY < mouseY+40)) {
      t1 = t1 * -1;
    }
    else {
      scoreA = scoreA + 1;
    }
  }
  
    //cpu side bounce
  if (circleX == 20) {
    if ((circleY > cpu-40) && (circleY < cpu+40)) {
      t1 = t1 * -1;
    }
    else {
      scoreB = scoreB + 1;
    }
  }
      
      
      //cpu movement     

        while (cpu != circleY && cpu < circleY) {
          cpu = cpu + 1;
        }
        while (cpu != circleY && cpu > circleY) {
          cpu = cpu - 1;
        }
      
      // start over
  if ((circleX < 0) || (circleX>800)) {
    t1 = t1 * -1;
    circleX = 400;
    circleY = 250;
  }


}

