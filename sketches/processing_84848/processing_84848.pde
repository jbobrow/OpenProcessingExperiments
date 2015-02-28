
int angle=0; // set so the snake can turn 
int snakesize=0; //default size for snake
int time=0; //sets the speed for the snake to movve
int[] headx= new int[2500];   //ints for the position of the snakes head on the x and y axis
int[] heady= new int[2500];
int brickx=(round(random(0))+1); //
int bricky=(round(random(0))+1);
boolean redo=true; // int to keep the game going as long as the snake keeps getting the bricks
boolean stopgame=false; // stop game if the snake goes into the wall

void setup() // gets the window initialized, setting the window to 400X400
{
  restart();
  size(400,400);
  textAlign(CENTER);//alligns the text to the center of the screen
  smooth(); //sets smooth animation on
}
void draw() // sets up the draw loop


{
  if (stopgame)
  {
    //do nothing because the game is over and snake has hit the borders
  }
  else // if the snake successfully eats the bricks
  {
    
  time+=1;// controls the speed of the snake so it does not go way too fast
  fill(255,0,0); //colour of food
  stroke(0); //black stroke of bricks
  rect(brickx,bricky,8,8); //shape of food
  fill(0,255,0); //colour of border
  stroke(0); //stroke of border set to black
  rect(0,0,width,8); //the top border
  rect(0,height-8,width,8);// the bottom border
  rect(0,0,8,height);// left border
  rect(width-8,0,8,height); // right border
  // creates artificial frames each 6 frames
  //this stops the game running too fast
  if ((time % 6)==0)
  {
    travel();
    display();
    checkdead();
  }
  }
}
//controls:
void keyPressed()
{
  if (key == CODED)
  {
    
    if (keyCode == UP && angle!=270 && (heady[1]-8)!=heady[2])
    {
      angle=90; // controls the direction of the snake when the up key is pressed 
    }
    if (keyCode == DOWN && angle!=90 && (heady[1]+8)!=heady[1])
    {
      angle=270; // when the down key is pressed the snake moves down
    }if (keyCode == LEFT && angle!=0 && (headx[1]-8)!=headx[2])
    {
      angle=180; // moves the snake to the left when the left key is pressed
    }if (keyCode == RIGHT && angle!=180 && (headx[1]+8)!=headx[2])
    {
      angle=0; // moves the snake to the right when the right key is pressed
    }
    if (keyCode == SHIFT) // restarts the game whenever the shift key is pressed
    {
      
      restart();
    }
  }
}
void travel() // seetting up making the snake actually move
{
  for(int i=snakesize;i>0;i--)
  {
   if (i!=1)
    {
      //shift all the coordinates back one array
      headx[i]=headx[i-1];
       heady[i]=heady[i-1];
    }
    else
    {
      
      switch(angle)
      {
        case 0:
        headx[1]+=8; //move the new spot for the head of the snake, which is
                     //always at headx[1] and heady[1].
        break;
        case 90:
        heady[1]-=8;
        break;
        case 180:
        headx[1]-=8;
        break;
        case 270:
        heady[1]+=8;
        break;
      }
    }
  }
   
}
void display()
{
  //is the head of the snake eating the brick?
  if (headx[1]==brickx && heady[1]==bricky) // if the snake eats the brick
  {
    //grow and spawn the brick somewhere away from the snake
    
    snakesize+=round(random(3)+2); //allows the snake to increase in size every time it eats a brick by 2
   
   
    {
      brickx=(round(random(47))+1)*8; //places the brick randomly on the right half of the screen
      bricky=(round(random(47))+1)*8; //places the brick randomly on the left half of the screen
     
      {
         
       
      }
    
    }
  }
  //draw the new head of the snake...
  stroke(0); // sets the stroke of the snakes head to black
  fill(0,255,0); // fill of the snake is set to green
  rect(headx[1],heady[1],8,8);  //shows the green front end of the snake that eats the bricks
  stroke(255); //white stroke set for black end of the snake that shows the path it has taken
  fill(20); //fill colour is set to dark greyscale
  rect(headx[snakesize],heady[snakesize],8,8);//black bricks show path snake has taken

   
}
void checkdead() //
{
  for(int i=2;i<=snakesize;i++)
  {
    
    {
      
     
    }
    //is the head of the snake hitting the walls? if it it bring up the end game message
    if (headx[1]>=(width-8) || heady[1]>=(height-8) || headx[1]<=0 || heady[1]<=0)
    {
     
      fill(0,0,255); // colour of text set to blue
      text("YOUR SNAKE IS DEAD",200,150); //brings up the message you snake is dead in a window of 200,150
      text("Score:  "+str(snakesize-1)+" bricks munched",200,175); // code for calculating the final score of the amount of bricks munched
      text("To restart your game press Shift.",200,200); //text telling you to hit shift to restart the game
      stopgame=true;
    }
  }
}
void restart()
{
  //by pressing shift, all of the main variables reset to their defaults.
  background(255); //set to white
  headx[1]=200;
  heady[1]=200; // starts snake at the center of the screen
  for(int i=2;i<1000;i++) 
  {
   headx[i]=0;  // erase previous point were snake died
   heady[i]=0;
  }
  stopgame=false;
  brickx=(round(random(47))+1)*8; //resets the bricks to appear randomly on eith side of the window
  bricky=(round(random(47))+1)*8;
  snakesize=3; 
  time=0;    // default size of the snake and speed it travels
  angle=0;
  redo=true;

}


