
//Repeating, Hayley Goldstein, Comp Pro 1, 14/15
//

size(400,400);
background(0);
smooth();

//red cone
int x = 300;
int w = 5;
while ( w < 201)

{
  fill(220,20,60,50);  
  ellipse(x,100,w,w);
    x = x - 10;
    w = w + 10;
}   

//purple cone
int x1 = 100;
int w1 = 5;
while (w1 < 201)
{
  fill(139,34,82,80);
  ellipse(x1,300,w1,w1);
  x1 = x1 + 10;
  w1 = w1 + 10;
  
}
