
/*
 * Mimicking organic penstrokes in real life
 *
 * Randomized drawing starts in the upper left hand corner
 * towards the lower right hand corner.
 *
 * L key - Broadens the width of penstroke
 * S key - Thins the width of penstroke
 * Up / Down arrow - accelerates / slows speed of the movement
 * Esc - Closes window
 *
 * Reference
 *
 * Processing: A Programming Handbook for Visual Designers and Artists
 *
 * pg 37-41, 105-107 - int and float functions
 * pg 69-72 - Shape: Vertices
 * pg 233-234 - KeyPressed
 * pg 369-370 - Saving Sequential Images, Making Screenshot
 *
 *
 */
 
int margin = round(0.10*400);
int nr_of_lines = 2;
float vertex_x = 0;
float vertex_y = 0;
float prev_x   = 0;
float prev_y   = 0;
color c = color(0);
int shift_x = 10;
int shift_y = shift_x;
int speed = 10;
 
 
void setup()
{
  size(400, 400);
  background(255);
}
 
void draw()
{
  fill(200);
  drawVertex(); 
}
 
void drawVertex()
{
  fill(c);
  beginShape();
  for(int i=0; i < nr_of_lines; i++)
  {
    delay(speed);
     
    vertex(vertex_x, vertex_y);
     
    if(vertex_x < 0 + margin)
    {
      shift_x=10;
    }
    if( vertex_x > 400 - margin)
    {
      shift_x*=-1;
    }
    if(vertex_y < 0 + margin)
    {
      shift_y=10;
    }
    if(vertex_y > 400 - margin)
    {
      shift_y*=-1;
    }
 
    vertex_x = prev_x + round(random(shift_x));
    vertex_y = prev_y + round(random(shift_y));
 
     
    this.prev_x = vertex_x;
    this.prev_y = vertex_y;
     
  }
  endShape(CLOSE);
}
 
void keyPressed()
{
   
  if( key == CODED )
  {
    if( keyCode == DOWN )
    {
      this.speed++;
    }
    else if( keyCode == UP )
    {
     this.speed--;
    }
   else if( keyCode == ESC)
   {
     exit();
   }
  }else{
    if ( key == 'l' )
    {
      this.nr_of_lines++;
    }
    else if( key == 's')
    {
      this.nr_of_lines--;
    }
    else if( key == 'c' )
    {
      loop();
    }else if( key == ENTER )
    {
      saveFrame("penstrokes-####.png");
    }  
  } 
}


