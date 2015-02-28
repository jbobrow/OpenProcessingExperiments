
size(400,400);

noStroke();
colorMode(HSB, 400);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}

strokeWeight(3);
stroke(255);
line(0,400,400,0);

noFill();
for (int i=0; i<400; i=i+10)
{
if (i<300)
{
ellipse(80,80,i,i);
}
else {
ellipse (200,200,i,i);
}
}

for (int i=0; i<400; i=i+10)
{
if (i<100)
{
ellipse(200,200,i,i);
}
else {
ellipse(350,380,i,i);
}
}
strokeWeight(6);
if (2<3) {line(330,370,380,380);}

line(330,390,380,360);
