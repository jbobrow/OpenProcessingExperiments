
size (400,600);
float x1,xf;
float y;
for (int i=0; i<54; i++)
{
  x1=200+100*sin(map(i,0,53,0,PI/2+mouseX/10));
   xf=200+100*sin(map(i,0,53,PI/2,PI));
 rect (x1, i*10,xf-x1,10);
  
}
