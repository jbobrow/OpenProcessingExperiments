
//Roberta
//Reforço 2
size(200,200);
int x=40;
int a=60;
int y;
 
for( y=0; y<50; y+=10)
{
  if(y>20)
  stroke(0, 255, 0);
  smooth();
  
line(x, 10 + y*4 ,a, 10 + y*2);
}
