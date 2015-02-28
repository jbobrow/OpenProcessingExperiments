
size(500, 500);
smooth();
 
background(0,0,0);






noStroke();
fill(#FFFFFF,50);

for (int i=25; i<=width; i+=50)
{
  for (int j=25; j<=height; j+=50)
  {
     
    ellipse(i,j,70 ,70);

  }
}




noStroke();
fill(#deff00,20);

for (int i=-30; i<=width; i+=30)
{
  for (int j=-30; j<=height; j+=30)
  {
     
    ellipse(i+30,j+30,90  ,90);

  }
}





noStroke();
fill(#0018ff);

for (int i=-0; i<=width; i+=30)
{
  for (int j=-0; j<=height; j+=30)
  {
     
    ellipse(i+30,j+30,10,10);

  }
}




