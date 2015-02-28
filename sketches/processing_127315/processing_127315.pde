
int x = 0;    //in the x position of my ball
                     // x is my variable
int y = 0;

int dx = 1;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white

}

void draw() {  //draw function loops 
ellipse(x,50,50,50)

x = x + dx;

if (x > 500);

{

dx = 1

}

if(x<0);
{
dx = 1;
}
