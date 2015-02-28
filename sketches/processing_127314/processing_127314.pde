
int x;  // is the x position of the ball
        // x is a variable 
             
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}

void draw() {  //draw function loops 
 fill(0,0,0);
 ellipse(x,50,50,50); //put x as the x position
 
 x=x+1;
 if (x > 500)
 {
      x = x-5;
 }
 else
 {
      x = x+5;
 }
 
 
}
