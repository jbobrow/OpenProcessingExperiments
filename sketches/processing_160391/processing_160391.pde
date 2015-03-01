
  int minW = 10;                    //minimum rect width
  int minH = 10;                    //minimum rect height
  int maxW = 30;                    //maximum rect width
  int maxH = 30;                    //maximum rect height
  
  float x;                          //for random x position
  float y;                          //for random y position
  int rW;                           //variable width
  int rH;                           //variable height
  
  int inc = 2;                      //increment
  int fillInc = 0;                  //color increment

void setup() {
  size(640,480);
  rectMode(CENTER);
  colorMode(HSB,100);
  background(0);
  rW = minW;                        //starts at min width and height
  rH = minH;
  
}

void draw() {
}

void mouseDragged() {
  noStroke();
  fill(fillInc,57,84);
  x=random(mouseX-10,mouseX+10);            //rects within 10 px
  y=random(mouseY-10,mouseY+10);            //rects within 10 px
  rect(x,y,rW,rH);
  rW+= inc;
  rH+= inc;
  fillInc++;
    if ((rW > maxW || rW < minW) && (rH > maxH || rH < minH))
    {
      inc =- inc;
    }
    if (fillInc > 120)
    {
      fillInc = 0;
    }
}


