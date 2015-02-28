
color ct;
boolean ciw = false;
color cb = color(0);
color cw = color(255);
PVector e = new PVector();
int buffer = 6;
int bufferDivisor = 3;
float ctr = 0;
boolean looping = true;

void setup()
{
  size(300, 300);
  background(cb);
}
void draw()
{
  for(int x = 0; x < width; x ++)
  {
    for(int y = 0; y < height; y ++)
    {
      ct = get(x, y);
      if (ct == cw)
      {
        rectMode(CORNER);
        fill(cw);
        if (random(2)<1)
        {
          for (int bx = 0; bx < buffer; bx ++) 
          {
            if (get(x + bx, y) != cw) rect(x + 1, y, 1, 1); //right
          }
        }
        else
        {
          for (int bx = 0; bx < buffer; bx ++) 
          {
            if (get(x - bx, y) != cw) rect(x - 1, y, 1, 1); //left
          }
        }
        if (random(2)<1)
        {
           for (int by = 0; by < buffer; by ++) 
           {
             if (get(x, y + by) != cw) rect(x, y + 1, 1, 1); //down
           }
        }
        else
        {
          for (int by = 0; by < buffer; by ++) 
          {
            if (get(x, y - by) != cw) rect(x, y - 1, 1, 1); //up
          }
        }
      }
      if (ct == cb)
      {
        rectMode(CORNER);
        fill(cb);
        if (random(2)<1)
        {
          for (int bx = 0; bx < buffer / bufferDivisor; bx ++) 
          {
            if (get(x + bx, y) != cb) rect(x + 1, y, 1, 1); //right
          }
        }
        else
        {
          for (int bx = 0; bx < buffer / bufferDivisor; bx ++) 
          {
            if (get(x - bx, y) != cb) rect(x - 1, y, 1, 1); //left
          }
        }
        if (random(2)<1)
        {
           for (int by = 0; by < buffer / bufferDivisor; by ++) 
           {
             if (get(x, y + by) != cb) rect(x, y + 1, 1, 1); //down
           }
        }
        else
        {
          for (int by = 0; by < buffer / bufferDivisor; by ++) 
          {
            if (get(x, y - by) != cb) rect(x, y - 1, 1, 1); //up
          }
        }
      }
    }
  }
  ctr ++;
  noStroke();
  fill(cw);
  rect(mouseX, mouseY, 5, 5);
}
void mousePressed()
{
  if (looping)
  {
    noLoop();
    filter(BLUR, 1);
    filter(THRESHOLD);
    looping = false; 
  }
  else
  {
    looping = true;
    loop();
  }
}
