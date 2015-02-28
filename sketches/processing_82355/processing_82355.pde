
final int MAX = 5;

//float dx, dy;
float [] s = new float [MAX];
float [] x1 = new float [MAX];
float [] y1 = new float [MAX];
float [] dx = new float [MAX];
float [] dy = new float [MAX];
color [] colRect = new int [MAX];
color [] colEllipse = new int [MAX];

void setup()
{
  size(400, 400);
  initColorArray (colRect);
  initColorArray (colEllipse);
  initArray(x1, 0, width);
  initArray(y1, 0, width);
  initArray(dx, .2, .6);
  initArray(dy, .5, .8);
  initArray(s, 10, 50);
//  dx = 5;
//  dy = 5;
}

void draw()
{
  initBackground();
  element();
  moveElement();
}

void initBackground()
{
  background(100);
}

void initColorArray (int [] arr)
{ 
  for (int i= 0; i< arr.length; i++)
  {
    arr [i] = color(int(random(255)), int(random(255)), int(random(255)));
  }
}

void initArray (float [] arr, float low, float high)
{
  for (int i=0; i<arr.length; i++)
  {
    arr [i] = (random(low, high));
  }
}

void element()
{
  for (int i=0; i < x1.length; i++)
  {
    pushStyle();
    fill(colRect[i]);
    rect(x1[i], y1[i], s[i], s[i]);
    popStyle();

    pushStyle();
    fill(colEllipse[i]);
    ellipse(x1[i], y1[i], s[i], s[i]);
    ellipse(s[i]+x1[i], y1[i], s[i], s[i]);
    popStyle();
  }
}


// this line of code moves the shape according to the delta x/y array
void moveElement()
{
  for (int i = 0; i< x1.length; i++)
  {

    println(dx[i]);
    x1[i] += dx [i];

    if (x1[i] > width || x1 [i]< 0)
    {
      dx[i] = -dx[i];
      x1[i] += dx [i];
    }

    y1[i] += dy [i];
    if (y1[i] > height || y1 [i]< 0)
    {
      dy[i] = -dy[i];
      y1[i] += dy [i];
    }
  }
}


//void moveElement()
//{
//  for (int i = 0; i< x1.length; i++)
//  {
//
//    println(dx[i]);
//    x1[i] += dx ;
//
//    if (x1[i] > width || x1 [i]< 0)
//    {
//      dx = -dx;
//      x1[i] += dx ;
//    }
//
//    y1[i] += dy ;
//    if (y1[i] > height || y1 [i]< 0)
//    {
//      dy = -dy;
//      y1[i] += dy ;
//    }
//  }
//}


//void keyPressed()
//{
//  if (keyCode == UP)
//  {
//    dy = dy++;
//  }
//  if (keyCode == DOWN)
//  {
//    dy = dy--;
//  }
//}

