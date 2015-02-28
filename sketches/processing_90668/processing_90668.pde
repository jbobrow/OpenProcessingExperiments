
float xpos=200, ypos=200;
String userInput = "", password="pong";
boolean same= false;

void setup() 
{
  size(400, 400);
}
void draw()
{
  background(0);
  text("hit ENTER to enter password (its pong :p) ", width/3,20);
  text("Enter password/pong here: " + userInput, 0, height/2-20);
  text("Did you enter pong ? True or false: " + same, 0, height/2 + 19);
  
  if(same==true){
    background(1);
    
  
//  }
//}
//  void ballBounce()
//{
  fill(0,255,0);
  rect(10,10,380,380);
  int rad = 30;        // Width of the shape
  // Starting position of shape    
fill(255,0,0);
float xspeed = 2.0;  // Speed of the shape
float yspeed = 2.0;  // Speed of the shape

int xdirection = 0;  // Left or Right
int ydirection = 1;
xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection ) ;
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xpos=200;
  }
  if (ypos > 360-rad || ypos < 10) {
    ydirection=-1;
    
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
}  // Top to Bottom

  


  else{
  text("just writew in pong" + userInput,0,height/2+40);
}
}
void keyPressed()
{
  if(key !=CODED)
  userInput+= key;
  if(userInput.equals(password))
  same=true;
  {
  }
}
