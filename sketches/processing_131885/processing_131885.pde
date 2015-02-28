
size(400,400);
background(0,205,0);
stroke(255);
strokeWeight(6);
strokeCap(SQUARE);
for (int x = 50; x <= 400; x += 75)
{
  line(x,25,x,375);
}

for (int y = 50; y <= 400; y += 75)
{
  line(y-10,90,y,90);
  line(y-10,310,y,310);
}

fill(255);
rect(0,0,400,25);
rect(0,375,400,25);

strokeWeight(3);
for (int z = 5; z <= 400; z += 15)
{
  line(z,25,z,35);
  line(z,375,z,365);
  line(z,147,z,152);
  line(z,247,z,252);
}

stroke(205,0,0);
line(128,28,128,371);
stroke(0,0,205);
line(122,28,122,371);

textSize(68);
fill(255);
text("20",236,330);
text("10",89,330);
