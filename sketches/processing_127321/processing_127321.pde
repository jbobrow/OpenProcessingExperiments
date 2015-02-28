
int x = 0;    //is the position of the ball

// x is my variable
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white

}

void draw() {  //draw function loops 

fill(255,0,255);
ellipse(x,50,50,50);

x = x + dx;                   // changes the position of the ball
}
if (x > 500);
{
   dx = -1;
   
   }
   if (x<0);
   {

dx=1;
}
}



