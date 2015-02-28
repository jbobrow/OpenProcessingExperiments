

size(500, 500);
background(0);
smooth();
 
translate(350,350);
for (int i=0; i<=width; i+=30)
{
 for (int j=10; j<=height; j+=30)
{
  fill(255,10);
  strokeWeight(3);
  stroke(225);
 //rect(i/2,j/2,i/3,j/3);
 ellipse(200,50,i+3,j);

 rotate(20);

}}


