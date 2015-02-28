
size(500,500);
 
smooth();
background(250);



 
strokeWeight(2);
stroke(10,100,20);
 
for (int i=10; i<=width; i+=50)
{
  for (int j=0; j<=height; j+=50)
  {
     
    line(i-10, j+10, i, j);
 
  }
}


strokeWeight(3);
stroke(10,100,20);
 
for (int i=25; i<=width; i+=50)
{
  for (int j=25; j<=height; j+=50)
  {
     
    line(i, j, i+10, j+10);
 
  }
}


