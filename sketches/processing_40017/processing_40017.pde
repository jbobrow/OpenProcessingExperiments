
size(800,800);
smooth();
strokeWeight(0.5);

for (int x=10; x<width-10; x+=10)
  for (int y=10; y<width-10; y+=10)
  { if (y%100==0)
{stroke(0,0,255);
}
{ if (x%40==0)
{stroke(255,50,0);
}
    line(x,y,400,300);
  }
}

