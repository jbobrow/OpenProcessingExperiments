
int a;
int b;
int c;

void setup()
{
  size(500,500);
}

void draw()
{
  a=5;
  b=10;
 
 c=sum(a,b);

text(c,250,250); 
  
  
}
int sum(int x,int y)
{
 int frank = x+y;
return frank; 
  
  
}


