
size (400,400);
background (175,238,238);
strokeWeight (3);
for (int i = 20; i < 400; i=i+20)
{
  stroke (0);
line (400-i,350,i,260);
}

rotate(50);
fill (255,255,255,100);
triangle(width/4,height/5,width/4,height/10,width/7,height/5);
triangle(width/4,height/5,width/4,height/2,width/3,height/5);

fill(51,161,201,125);
triangle(width/4,height/4,width/4,height/10,width/3,height/4);
triangle(width/4,height/4,width/4,height/2,width/7,height/4);

