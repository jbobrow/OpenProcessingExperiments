
void setup() //sets up our window
{
  size (500, 350);
  stroke(255);
  frameRate(20);
  fill(247,183,234);
 
} 
// sets up our variables
float x=0;
float a=0;
float b=0;
float y=0;
float c=0;




void draw()//sets up drwaing/animation
{
  x=x+5;
  a=350-y;
  b=500-x;
  y=y+3.6367; //3.6367 is the ratio of 400:550
  c=350-y;
  
 
 
  if (x>550) {x=0;} //conditional statement, 
  if (y>400) {y=0;} 
  background(180,253,207);
  ellipse (x,117,50,50); //horizontal L-R
  ellipse (x,a,50,50); //diagonal L-R, B-T
  ellipse (b,a,50,50); //diagonal R-L, B-T
  ellipse (b,117,50,50); //horizontal R-L
  ellipse (x,0.7273*x,50,50); //diagonal L-R,T-B (0.7273 to convert 400-550values)
  ellipse (b, 0.7273*x,50,50); //diagonal R-L, T-B
  ellipse (x,234,50,50); //horizontal L-R lower
  ellipse (b,234,50,50); //horizontal R-L lower
  ellipse (167,y,50,50); //vertical T-B left
  ellipse (333,y,50,50); //vertical T-B right
  ellipse (167,c,50,50); //vertical B-T left
  ellipse (333,c,50,50); //vertical B-T right
}


