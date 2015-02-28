
  int x=100; //used this for all shapes so they would move together
  int velocity=1;

void setup()
{
  size(200,200);
  background(0,0,255);
  frameRate(10); // ran into trouble tring to get my shape to bounce back from edge of screen so i slowed it down so give more time to test cursor in middle of screen
}
void draw()
{
  background(0,0,255);
  face();
  x=x+velocity; //add 1 to x to cause shape to move right along screen
  if(x > 150 || x<50
  )
  x=velocity * -1; //supposed to make shape bounce off edges but i think using velocity here and in the if statement below caused problem that i plan to fix during the week

  if (mouseX > 90 && mouseX < 110 && mouseY > 90 && mouseY < 110)//defines area in center of screen
  velocity = 0; //stops program from adding 1 to x causing face to stop
  else
  velocity = 1;//if not in defined area 1 is added 
}
void face()//function to create face
{
  
  fill(255,255,0);
  ellipse(x,100,100,100);
  fill(0);
  ellipse(x-20,80,15,15);
  ellipse(x+20,80,15,15);
  rect(x-20,120,40,5);
  rect(x-25,115,5,5);
  rect(x+20,115,5,5);
}


