
//change the size of the ball, its speed, or the canvas.
//I dare you.

int x;
int xSpeed;
int circleSize;

void setup() {
  size(200, 200);
  x = 20;
  xSpeed = 20;
  circleSize = 100;
}


void draw() {

  //Draw stuff
  background(800);
  fill(255, 0, 0);

  x+=xSpeed;
  ellipse(x, height/2, circleSize, circleSize);


  //Impact with either wall
  if ( x>=width-(circleSize/2) || x <= circleSize/2 ) {
    xSpeed*=-1;
  } 
}




/*
//If conditions
 x>y
 x>=y
 x<y
 x<=y
 x==y
 x!=y

 
 //Example if
 if(hungry==true || haveGoneShopping==true){
   makeSandwiches(3);
 }
 
//Psuedo-code if/else
 if(x==0) //quit the app
 else if(x==1) //restart app
 else if(x==2) //do nothing
 else //cry
 
 
 */


