
size(700,700);
background(67,191,190);
smooth();

translate(350,350);
for (int i=0; i<=width; i+=30)
{ 
 for (int j=0; j<=height; j+=30)
{
  fill(255,175,70,10);
  strokeWeight(.5);
  stroke(255,0,0);
 //rect(i/2,j/2,i/3,j/3);
 ellipse(0,0,i,j);
 rotate(radians(20));
} 
}

