
size(800,800);
smooth();
background(255);

for(int y=0; y<= height; y+=80)
{
  for(int x=0; x<= width; x+=80)
 {
  PShape s;
s = loadShape("logo.svg");
smooth();
shape(s, x, y, 300, 300);
  }
}

