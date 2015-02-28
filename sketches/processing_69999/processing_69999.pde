
//Robert Wohlforth
//Homework 4 - Letters
//Copyright Pittsburgh 2012

//Press and hold letter keys, and watch the letters of your choice grow from the point of your mouse. 
//Press BACKSPACE to erase everything. 
//Press tab to temporarily reset the letter size.

String stringy;
float letterSize = 1;

void setup()
{
size (400,400);
background (255,255,255);
}

void draw ()
{
if (keyPressed)
{
  fill(255,255,255);
  textSize(letterSize);
  text((char)key, mouseX, mouseY); 
  letterSize = letterSize + 1;
  if (letterSize > 300)
  {
    letterSize = 1;
  }
  fill(0);
  textSize(letterSize);
  text((char)key, mouseX, mouseY); 
  println((char)key);
}
}
void keyReleased ()
{ if (key == BACKSPACE)
  {
    background (255,255,255);
}
{ if (key == TAB)
  {
    letterSize = 1;
}
}
}

