
//This is a spider which moves up a wall.
//And No the spider never makes it.
//By Joshua Zheng
int blocksize;
float spider, spiderX, spiderY;
void setup()
{
  size(300, 550);
  blocksize = 5;
  //spider = spiderX;
  spiderX = 150;
  spiderY = 500;
  smooth();
}

void draw()
{
  fill(150, 150, 150);
  rect (125, 500, 50, 100);
  for ( int X=10; X<500; X=X+5) { 
    //spider body
    frameRate (100);
    spiderY=spiderY-0.1;
    background (0);
    fill (255, 0, 255);
    ellipse (spiderX, spiderY, 50, 50);
    ellipse (spiderX, spiderY-25, 25, 25); 
    stroke (255, 0, 255);
    strokeWeight (5);
    //Legs
    line (spiderX-20, spiderY-10, spiderX-30, spiderY-30);
    line (spiderX+20, spiderY-10, spiderX+30, spiderY-30);
    line (spiderX-20, spiderY, spiderX-40, spiderY);
    line (spiderX+20, spiderY, spiderX+40, spiderY);
    line (spiderX-20, spiderY+10, spiderX-40, spiderY+10);
    line (spiderX+20, spiderY+10, spiderX+40, spiderY+10);
    line (spiderX-20, spiderY+10, spiderX-30, spiderY+30);
    line (spiderX+20, spiderY+10, spiderX+30, spiderY+30);
    for (; spiderY <5 ; spiderY=spiderY-5) {
      spiderY=500;
    }
  }
}


