
float px=1;
float py =300;
void setup ()
{
  size (600, 600);
}
void draw () { background(0);
  if (px < width / 2 ) {
    px= px + 8;
  } 
  else {
    py = py - 8 ;
  }

  ellipse (px, py, 10, 10);
}

