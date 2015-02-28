
void mousePressed ()
{
  redraw();
}

void keyPressed ()
{
  if (keyCode == KeyEvent.VK_RIGHT)
  {
    actRandomSeed += 1;
    redraw ();
  }
  
    if (keyCode == KeyEvent.VK_LEFT)
  {
    actRandomSeed -= 1;
    redraw ();
  }
  
   //if (keyCode == KeyEvent.VK_S) saveFrame ("####.jpg");
}

