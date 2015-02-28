

size(700, 700);
background(0);
smooth();
 
for (int i = 0; i<= width; i+=70)
{
  for (int j = 0; j<=height; j+=30)
  {
    strokeWeight(.5);
    stroke(0);
    fill(i,j,100,50);
 ellipse(i,j,j,i);
   
  }
}

for (int b = 0; b<=width; b=b+50)
{
 for (int c = 10; c<=height; c+=75)
 {
   //strokeWeight(.5);
   noStroke();
   fill(0,c,b,c);
   ellipse(b,c, 10,10);
   //line(c,b, b,c);
 }
}

