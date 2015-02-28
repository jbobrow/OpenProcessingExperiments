
size(800, 800);
background(0);
smooth();


for (int w =34; w<=width; w+=1)
{

  for (int y= 57; y<=height; y+=72)
  {
    point(w, y);

    stroke(45);
    line( w, y, w +0.200, y+3);
    line( w+6, y+(w/3), w, y +6);
  }
}



