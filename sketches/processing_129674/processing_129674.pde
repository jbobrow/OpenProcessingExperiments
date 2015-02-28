
//Sophie Vennix
//Class3Notes
//1.21.14


float x, y;
float wd, ht;
float easingCoef;
{
  x=200;
  y=200;
  wd=100;
  ht=100;
}


void setup()
{  
   size(400,400);
   //noCursor();
   easingCoef=.01;
}

void draw()
{
    //background(0);
    noStroke();
    fill(0,0,200);
    ellipse(x,y,wd,ht);
    x=mouseX;
    y=mouseY;
    fill(0,10);
    rectMode(CORNER);
    rect(0,0, width, height);
    
}



