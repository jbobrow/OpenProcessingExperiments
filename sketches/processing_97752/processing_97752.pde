
//Victória Yumi Shimakawa
size (200, 200);
background (100, 200, 30);


stroke (3, 85, 12);
for ( int z=40; z<180;z=z+30)
{
  line ( 43, z, 155, z);

  for (int w=40; w<180; w=w+30)
    line (w, 40, w, 160);
}


fill(255);
int x=4;
int y=4;
smooth();
noStroke();
for (x=40; x<180; x=x+30)
{
  for (y=40; y<180;y=y+30)
    ellipse (x, y, 8, 8);
}

fill(35, 85, 40);
ellipse (100, 130, 8, 8);
ellipse (130, 130, 8, 8);
