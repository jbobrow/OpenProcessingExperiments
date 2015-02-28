
//Pong Game
//By Eitan Rapaport


int x = 250;

int y = 250;

int paddleX;
int paddleY = 470;

int dx = 9;
int dy = 7;

void setup() {  //setup function called initially, only once
  size(500, 500); 
  background(150,250,43);  
  
}

void draw() {  //draw function loops 
  background(150,250,43);
  fill(0,0,255);  
  rect(paddleX,paddleY,85,20);
  
  paddleX = mouseX;
  
  fill(255,0,255);
  ellipse(x,y,50,50);
 
  x = x + dx;
  y = y + dy;
  
  if ((x > paddleY) && (x > paddleX))
  {
      dx *= -1;
  }
  else if (x < 0)
  {
      dx *= -1
  }
  
  if (y > 500)
  {
      dy *= -1;
  }
  else if (y < 0)
  {
      dy *= -1;
  } 

}                                                   //Make the money , dont let the money make you. Change your     
                                                    //Game , dont let the game change you. And forever remain 
                                                    //faithful. Its all on the same truth.
