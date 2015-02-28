


String [] dataStrings;
float x, dx, y, dy;

void setup ()
{size (400,400);
textSize (30);

x= 10;
y = 200;

dataStrings = loadStrings ("string.txt");}

void draw ()
{

  background (255,102,102);
  printText ();
  moveText ();
  
  
}

void printText ()
{
  for (int i = 0; i< dataStrings.length; i++)
  {
    text (dataStrings [i], x, y);
  }
}

void moveText ()
{

  if (x < width) {x -= 3;}
  if (x < -4500) {x = 90;}
 
}

void keyPressed()
{
  if (key == ' ')
  {
    setup();
  }
  else
  {
    exit ();
  }
}

void mousePressed ()
{
  fill (random(220),random(200),random(220));
  rect (0,200,400,200);
}



