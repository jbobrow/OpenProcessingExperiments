
size(500, 500);
smooth();
noFill();
background(26, 142, 255);



fill(246, 255, 0);
for (int e=10; e<=width-10; e+=40)
{
  for (int f=10; f<=height-10; f+=50)
  {
    ellipse(e+10, f+30, 5, 5);
  }
}


strokeWeight(4);
stroke(17, 139, 130);
fill(26, 142, 255);
for (int e=1; e<=width-60; e+=60)
{
  for (int f=10; f<=height-10; f+=10)
  {
    arc(e, f, 30, 100, radians(170), radians(20));
  }
}



