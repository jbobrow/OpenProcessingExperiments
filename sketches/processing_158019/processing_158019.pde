
int counter;
int x=20;
int dx=50;
int y=50;
int dy=450;

void setup() {  //setup function called initially, only once
  size(400, 400);
 }

void draw() {  //draw function loops 
  ellipse(x,20,20,20);
  x=x+dx;
    
  if(x>400)  {
  dx=-3;}

  if (x<300)
  {dx=4;}

  if (y<200)
 {dy=-5;
   }
   
}
  
