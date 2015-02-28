
//Sarah C, CP1 16/17, UserInput

int change = 0;
void setup()
{
  size(500,500);
  background(160,190,255);
}

void draw()
{  
}
void mouseDragged()
{
  noFill();
  stroke(mouseX,mouseY,140);
  ellipse(mouseX,mouseY,60 + change,60 + change);
  ellipse(500-mouseX,mouseY,60 + change,60 + change);
}

void keyPressed()
{
  if(key=='f')
  {
    fill(160,190,255,10);
    rect(0,0,500,500);
  }
  if(key=='b')
  {
    change = change + 1;
  }
  if(key=='s')
  {
    change = change - 1;
  }
  if(key==' ')
  {
    background(160,190,255);
    change = 0;
  }
}

/**
Click and drag the mouse! <p>
key f = fade. Your drawing will slowly fade.<br>
key b = big. The circles will get bigger.<br>
key s = small. The circles will get smaller.<br>
spacebar = reset. Resets everything!
*/
