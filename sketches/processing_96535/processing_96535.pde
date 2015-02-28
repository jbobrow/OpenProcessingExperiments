
//Roberta
//Reforço 1
size(200, 200);
int x=40;
int a=60;
int y;
 
for( y=0; y<50; y+=11)
{
  smooth();
line(x, 10 + y*4 ,a, 10 + y*2);
}
