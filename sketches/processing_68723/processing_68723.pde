
/*
Chad Horton
9/5/2012
Dynamic Web Graphics
Mondrian Assignment
*/

void setup()
{
size(400,400);
stroke(0);
strokeWeight(5);
background(240,230,140);
}
void draw()
{
  fill (255,255,0);
 mysquares(0,0); 
 fill(255,0,0);
 mysquares(200,200);
 fill(255);
 //*****************
 mybars(100,0);
 mybars(0,100);
 //*****************
 mybars(100,200);
 mybars(200,100);
 //*****************
 mybars(200,300);
 mybars(300,200);
 //*****************
 fill(255,222,173);
 myhbars(200,0);
 fill(255);
 fill(253,245,230);
 myhbars(0,200);
 fill(255);
 //*****************
 fill(255,222,173);
 myhbars(300,100);
 fill(255);
 fill(253,245,230);
 myhbars(100,300);
 fill(255);
 //*****************
 fill(50,205,50);
 mysquare(300,0);
 fill(0,100,0);
 mysquare(0,300);
 fill(255);
}

void mysquares(int x, int y)
{
 quad(x,y,x+100,y,x+100,y+100,x,y+100);
 quad(x+100,y+100,x+200,y+100,x+200,y+200,x+100,y+200);
}
void mybars(int r,int i)
{
 quad(i,r,i+50,r,i+50,r+100,i,r+100); 
 quad(i+50,r,i+100,r,i+100,r+100,i+50,r+100);
}
void myhbars(int a, int b)
{
 quad(a,b,a,b+50,a+100,b+50,a+100,b); 
 quad(a,b+50,a,b+100,a+100,b+100,a+100,b+50);
}
void mysquare(int c, int d)
{
 quad(c,d,c+100,d,c+100,d+100,c,d+100); 
}

