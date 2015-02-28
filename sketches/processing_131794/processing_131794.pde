
size(400,400); 
background(0); 

int x=200; 

fill(176,23,31,15);
for(int i=0; i<400; i=i+10)
{
  ellipse(200,245,i,i);
}

stroke(255,250,205);
strokeWeight(5);
line(x,0,0,400);
line(x,0,400,400);
line(0,398,400,398);
line(x,0,x,400);


if(x<20){
  fill(255,250,205);
  triangle(400,400,200,0,0,400);
}
else
{
  noFill();
  ellipse(x,275,245,245);
}
