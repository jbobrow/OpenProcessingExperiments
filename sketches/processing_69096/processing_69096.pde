
//Stanley L, programing1,6
//www.cupnoodles.webs.com
size(1000,1000);
translate(500,500);
noFill();
background(255);
int x=10;
while(x<1000)
{
  ellipse(x,500-x,20,20);
  ellipse(x,x,20,20);
  line(x,0,0,500-x);
  line(x-5,495-x,0,0);
  line(x,500,500,500-x);
  line(x+5,505-x,500,500);
  x=x+1;
  
  rotate(PI/2);
}
