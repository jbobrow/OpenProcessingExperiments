
size(500, 500);
smooth();
noFill();
background(255);



fill(33, 77, 37);
for (int i=10; i<=width-10; i+=40)
{
  for (int j=10; j<=height-10; j+=50)
  {
    ellipse(i+10,j+30, 5, 5);
  }
}
 
 
strokeWeight(2);
stroke(17,139,130);
fill(132, 206, 131, 60);
for (int i=1; i<=width-10; i+=40)
{
  for (int j=10; j<=height-10; j+=50)
  {
    arc(i,j, 100, 100, radians(70), radians(180));
  }
}

