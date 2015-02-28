
void setup()
{
 
  size(500,350);

background(51);
}

int X=0;
void draw()
{
   stroke(0,255,0);
 line(0, 0, 500, 350);
 line(0, 350, 500, 0);
 smooth();
X=X+1;
ellipse(X,175,50,50);

}



