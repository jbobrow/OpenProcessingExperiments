
//This program generates a random yes/no answer
//I made it to remind myself that for questions that you
//don't have the answer to, sometimes the answer doesn't matter

//variables
int start; //menu, animation, end screen (0,1,2 respectively)
int x, y; //position for text
int answer; //generates random number, 1/0, yes/no

void setup()
{
  //set basics
  size(400,400);
  background(255);
  textSize(10);
  
  //set variables
  start = 0;
  x = 0;
  y = -20;
}

void draw()
{
  //menu
  if (start == 0)
  {
    background(255);
    fill(0);
    text("Ask a 'yes/no' question that worries you...",100,height/2);
    fill(125);
    text("Press S to start",width/2 - 40,height/2 + 10);
    //println("false");
    
    //check for key press to start
    if (keyPressed)
    {
      if (key == 's' || key == 'S')
      {
        start = 1;
        background(125);
        fill(0);
        text("Press E",360,390);
       // println("s was pressed");
      }
    }
  }
  
  //run animation
  if (start == 1)
  {
    //println("true");
    if ((x < 400) && (y < 410))
    {
     // println("loop");
      answer = int(random(2)); //generates yes/no
      
      //if answer = 1 = yes
      if (answer == 1)
      {
        fill(255);
        text("YES",x,y);
      }
      
      //if answer = 0 = no
      if (answer == 0)
      {
        fill(0);
        text("NO",x,y);
      }
      
      //change output position
      y = y + 10;
      
      //if y reaches bottom, reset and move over 10
      if (y > 400)
      {
        x = x + 15;
        y = 10;
      }

    
    //  delay(5);
    }
    
    //check for key press to relax
    if (keyPressed)
    {
      if (key == 'e' || key == 'E')
      {
        start = 2;
        background(125);
       // println("e was pressed");
      }
    }
  }
  
  //relax
  if (start == 2)
  {
    background(255);
    fill(0);
    text("In the end, the answer isn't what's important...",30,150);
    text("...it's that you realize you shouldn't stress out about it...",100,250);
  }
}


