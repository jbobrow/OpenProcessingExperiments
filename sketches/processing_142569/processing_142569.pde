
size(600, 600);

background(255);
noFill();
stroke(0, 80);


for(int c=0; c<300; ++c)
{
  translate(5, 15);
  rotate(-0.05);

  ellipse(0,0, 250,250);
}

resetMatrix();
translate(0,height);
for(int e=0; e<300; ++e)
{
  translate(5, -15);
  rotate(0.05);

  ellipse(0,0, 250,250);
}


resetMatrix();
for(int c=0; c<300; ++c)
{
  translate(15, 5);
  rotate(0.05);

  ellipse(0,0, 250,250);
}

resetMatrix();
translate(width,0);
for(int c=0; c<300; ++c)
{
  translate(-15, 5);
  rotate(-0.05);

  ellipse(0,0, 250,250);
}
