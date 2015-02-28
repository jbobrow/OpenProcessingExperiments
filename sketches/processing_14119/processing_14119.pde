
int canvasSize = 300;
CIRCLE circle1 = new CIRCLE(10,10, 64); 
CIRCLE circle2 = new CIRCLE(canvasSize - 50, 50, 128); 
CIRCLE circle3 = new CIRCLE(50, canvasSize - 50, 0); 
CIRCLE circle4 = new CIRCLE(canvasSize - 50, canvasSize - 50, 192); 


void setup()
{
  size(300, 300);
  background(120);
  noStroke();
}

void draw()
{
  circle1.drawCircle();
  circle2.drawCircle();
  circle3.drawCircle();
  circle4.drawCircle();
}


class CIRCLE
{
  int tone, x, y, wid, tSpeed = 5, wSpeed = 20;
  int maxSize = (int)(canvasSize * 1.8);
  CIRCLE(int a, int b, int c)
  {
    x = a;
    y = b;
    tone = c;
    wid = 0;
  }

  void drawCircle()
  {
    tone = (tone + tSpeed) % (255 * 2);
    wid = (wid + wSpeed) % (maxSize * 2);

    fill(abs(tone - 255),10);

    ellipse( x, y, abs(wid - maxSize), maxSize );
    ellipse( x, y, maxSize,  abs(wid - maxSize) );

//    delay(1);
  }
}

