
int cont=0, count=0, i;
float xMouse, yMouse, floatWidth, floatHeight;
Drop drop;

ArrayList<Drop> drops = new ArrayList<Drop>(0);

void setup()
{
  //size((int)(displayWidth*.8), (int)(displayHeight*.8));
  //size(displayWidth, displayHeight);
  size(800, 800);
  fill(0, 1);
  strokeWeight(3);
  stroke(255);
  //smooth();
  //noCursor();
  floatWidth = (float)width;
  floatHeight = (float)height;
  i = 1;
}

void draw()
{
  background(0);
  
  if(count%20==0)
  {
    drops.add(new Drop((int)random(width), (int)random(height), (int)random(1, 5)));
    count = 0;
  }
  for(int i=0;i<drops.size();i++)
  {
    drops.get(i).ripple();
  }
  for(int i=0;i<drops.size();i++)
    if(drops.get(i).dead)
        drops.remove(i);
  count++;
  //arc(floatWidth/2, floatHeight/2, 150.0, 150.0, -PI*0.5, ((PI/180)*(i+=20)));
}

void mouseClicked()
{
  drops.add(new Drop(mouseX, mouseY, 1));
}

void mouseDragged()
{
  //drops.add(new Drop(mouseX, mouseY));
  xMouse = (float)mouseX;
  yMouse = (float)mouseY;
}
/*
boolean sketchFullScreen() {
 return true;
}
*/
class Drop
{
  int x, y, speed, cont, id, colorR, colorG, colorB;
  boolean dead;
  
  Drop(int x, int y, int speed)
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
    colorG = (int)random(0, 220);
    colorB = (int)random(150, 220);
    if(colorG>199 && colorB>199)
      colorR = (int)((colorG+colorB)/2);
    else
      colorR = (int)random(0, 75);
    cont = 0;
    dead = false;
    id = Counter.id;
    Counter.id++;
  }
  
  void ripple()
  {
    if(cont>254)
    {
      dead = true;
      return;
    }
    stroke(colorR, colorG, colorB, 255.0-this.cont);
    ellipse(x, y, cont, cont);
    cont+=speed;
  }
}

static class Counter
{
  static int id = 0;
}


