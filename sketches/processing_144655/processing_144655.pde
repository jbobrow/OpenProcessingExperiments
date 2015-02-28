
// Homework 10 copyright 2014 
// Hyun Doug Kim 

String [] dataStrings;
String [] dataStrings2;
String [] dataStrings3;
String [] dataStrings4;
String [] dataStrings5;
float x, dx, y, dy, x2, dx2;

void setup() 
{
  size (600, 400, P3D);
  textSize (24);
  
  x=0;
  dx=1;
  y=100;
  dy=1;
  x2=0;
  dx2=1;
  
  dataStrings = loadStrings ("DA.txt"); 
  dataStrings2 = loadStrings ("DA2.txt");
  dataStrings3 = loadStrings ("DA3.txt");
  dataStrings4 = loadStrings ("DA4.txt");
  dataStrings5 = loadStrings ("DA5.txt");
}

void draw()
{
  background (245, 178, 178);
  printText();
  moveWords();
}

void printText ()
{
  fill (0);
  text (dataStrings.length, 20, 50);
  for (int i = 0; i< dataStrings.length; i++)
  {
    text (dataStrings [i], x2, 180);
  }
   
   
   fill (255);
   text (dataStrings2.length, 20, 30);
  for (int i = 0; i< dataStrings2.length; i++)
  {
    text (dataStrings2 [i], 50, y+100);
  }
    
    
     fill (220, 25, 25);
    text (dataStrings3.length, 20, 30);
    for (int i = 0; i< dataStrings3.length; i++)
  {
    text (dataStrings3 [i], x, 140);
  }
  
  
  fill (78, 179, 209);
   text (dataStrings4.length, 50, 30);
  for (int i = 0; i< dataStrings4.length; i++)
  {
    text (dataStrings4 [i], x, y);
  }
  
   fill (209, 78, 196);
   text (dataStrings5.length, 50, 30);
  for (int i = 0; i< dataStrings5.length; i++)
  {
    text (dataStrings5 [i], x/1.5, y/1.5);
  } 
}

void moveWords ()
{
  x+=dx;
  y+=dy;
  x2+=dx2;
  if (x> width)
  {
    dx=-1;
  }
   if (x<0)
  {
    dx=1;
  }
  
  if (y<0)
  {
    dy=1;
  }
  if (y>height)
  {
    dy=-1;
  }
  if (x2<width)
  {
    dx2=-1;
  }
  if (x2>0)
  {
    dx2=-1;
  }
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
  background(random(255), random(255), random(255));
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
 println(e);
}



