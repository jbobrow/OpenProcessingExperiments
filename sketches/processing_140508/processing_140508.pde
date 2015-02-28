
// ICE 14 copyright 2014
// Hyun Doug Kim 

String [] arrayOfStr = {"apple", "banana", "coconut", "date", "eggplant", "grape", "lemon", "lime", "orange", "plum"};
float x, dx;


void setup( )
{
  size( 400, 600 );
  textSize( 24 );
  fill( 255 );
  
  x=0;
  dx=1;
}

void draw()
{
  background( 0 );
  printArray (arrayOfStr);
  moveWords();
}

void printArray (String [ ] anyArray)
{
  for (int i = 0; i < anyArray.length; i++)
  {
    text (anyArray[i], x, 70 + i*40);
  }
}

void moveWords()
{
  x+=dx;
  if (x> width)
  {
    dx= -dx;
  }
  else if (x<0)
  {
    dx= -dx;
  }
}


