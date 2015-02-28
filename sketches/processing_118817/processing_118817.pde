
int counter;
size(500, 500);
int x= 500;
int y= 0;
while(y<500)
{

    line(y,y,500,x);
    y = y+10 ;
    stroke(y,x,y);
    line (y,x,500,y);
    x= x-10;
    stroke (y,x,x);
}
