
size(800,800);
background(0);
smooth();

fill(255);
noStroke();
PShape s;
s = loadShape("logo.svg");

for(int y=-200; y<= height; y+=20)
{
  for(int x=-200; x<= width; x+=20)
 {
smooth();
shape(s, x, y, 300, 300);
  }
}

