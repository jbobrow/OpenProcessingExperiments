
//Victoria H, while loop CP1 mods 16/17
//http://miura-miura.webs.com/while_loop.html

int x = 5;
int i = 50;
noFill();
size(100,100);
background(0);

while(x<100)
{
  stroke(255,0,0);
  ellipse(50,50,x,40);
   x = x + 5;
  noStroke();
  fill(0,0,255,20);
  triangle(0,0,0,i,i,i);
  fill(0,255,0,20);
  triangle(0,0,i,0,i,i);
  noFill();
  stroke(0);
  rect(0,0,i,i);
  i = i + 6;
}
