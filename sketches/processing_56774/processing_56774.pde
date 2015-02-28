
//pattern with "nested for loop"
 
size(500, 500);
background(0);
smooth();
stroke(5,250,70);
 
for(int x = 0; x<=width; x+=50)
{
   
   for(int y=0; y<=height; y+=50)
  {
     ellipse(x,y, 60,60);
  }
}

