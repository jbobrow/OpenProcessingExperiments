
int count = 0;


void setup()
  {
  size(800, 800);
  stroke(127);
//  noLoop();
  smooth();
  }

void schachtel(int num, float w, float h, float mw, float mh)
  {  
  if(num == 0)
    return;

  float sx = mw / 2;
  float sy = mh / 3 * 2;
    
  if((num % 2) == 0)
    {
    triangle(sx, sy - h / 3 * 2, sx - w / 2, sy + h / 3, sx + w / 2, sy + h / 3);
    }
  else
    {
    triangle(sx, sy + h / 3 * 2, sx - w / 2, sy - h / 3, sx + w / 2, sy - h / 3);
    }

  schachtel(--num, w / 2, h / 2, mw, mh);
  }

void dreieck(int num, float w, float h)
  {
  if(num % 2 == 0)
    {
    triangle(w / 2, 0, 0, h, w, h);
    }
  else
    {
    triangle(w / 2, h, 0, 0, w, 0);    
    }

  if(num == 1)
    return;

  if(num % 2 == 0)
    {
    schachtel(num - 1, w / 2, h / 2, w, h);
    scale(1,-1);
    translate(0, -height);
    schachtel(num - 2, w / 4, h / 4, w, h);
    schachtel(num - 2, w / 4, h / 4, w / 2 * 3, h/4);
    schachtel(num - 2, w / 4, h / 4, w / 2, h/4);
    }
  else
    {
    schachtel(num - 1, w / 2, h / 2, w, h / 2);
    scale(1,-1);
    translate(0, -height);
    schachtel(num - 2, w / 4, h / 4, w, h / 2);
    schachtel(num - 2, w / 4, h / 4, w / 2 * 3, h / 4 * 5);
    schachtel(num - 2, w / 4, h / 4, w / 2, h / 4 * 5);
    }
  
  }
  
void draw()
  {
  background(0);
  dreieck(++count, width, height);
  delay(1000);
  if(count == 7)
    noLoop();
  }

void mouseClicked()
  {
  count = 0;
  loop();
  background(0);
  }

