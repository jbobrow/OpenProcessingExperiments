
int counter;x=0; // is the x position of my ball
                 //x is my variable     
int y=0;

int dx=1;        // dx and dy are veilocity                 
int dy=0;
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
 }

void draw() {  //draw function loops 
 ellipse(x,50,50,50); //put x as the x position
 
 x= x+dx;         // changes the position of x for the ball
 
 if (x > 500)
 {
   dx=-1;
   }
   if(x<0)
   {
   dx=1;
   }
   
 }

