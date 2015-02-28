
int x = 0;      //is the x possition of my ball
                //x is my variable
              
int y = 0;    

int dx = 1;     //dx and dy are for velocity
int dy = 0;
void setup() {  //setup function called initially, only once
  size(500,500);
  background(255);  //set background white
  
}

void draw() {  //draw function loops 
    fill(0,255,0)
    ellipse(x,50,50,y);    //put x as the x position
    ellipse(y,x,x,50);
    
    x = x + dx;  //changes the position of x for the ball
    
    if (x > 500)
    {    
        dx=-1;
    }
    if (x<0)
    {
        dx=1;
    }
    

}
