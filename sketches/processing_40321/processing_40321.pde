
/*
* 
*By Timothy Yue
*
*/

Circle A;
int X2, Y2;
boolean trap = true;
boolean free =  false;
boolean free2 = false;
boolean instructions = true;
PFont instruction;

void setup()
{
  size(600, 600);
  smooth();
  X2 = Y2 = 200;
  A = new Circle();
  instruction = createFont("Arial", 20);
  textFont(instruction);
  frameRate(10);
}

void draw()
{
  //fill(0, 24);
  //rect(0, 0, width, height);
  background(0);
  A.show();
  if(instructions)
  {
    stroke(255);
    strokeWeight(1);
    fill(0);
    rect(100, 200, 400, 200);
    fill(255);
    textSize(20);
    text("Click mouse to see the different drawings.", 120, 240);
    text("The left mouse button goes foward.", 120, 270);
    text("The right mouse button goes backwards.", 120, 300);
    text("Drag mouse to see what happens", 120, 330);
    textSize(15);
    text("-Press SpaceBar to start-", 200, 380);
    
  }
}

void mouseDragged()
{
  if (trap)
  {
    X2 = mouseX - 100;
    Y2 = mouseY - 100;
  }
  
  if ((free) || (free2))
  {
    stroke(255);
    strokeWeight(20);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mouseClicked()
{
  if ((trap) && (mouseButton == LEFT))
  {
    trap = false;
    free = true;
    free2 = false;
  }
  
  else if((free) && (mouseButton == LEFT))
  {
    free2 = true;
    free = false;
    trap = false;
  }
  
  else if((free2) && (mouseButton == LEFT))
  {
    free2 = false;
    free = false;
    trap = true;
  }
  
  else if ((free2) && (mouseButton == RIGHT))
  {
    trap = false;
    free = true;
    free2 = false;
  }
  
  else if((free) && (mouseButton == RIGHT))
  {
    free2 = false;
    free = false;
    trap = true;
  }
  
  else if((trap) && (mouseButton == RIGHT))
  {
    free2 = true;
    free = false;
    trap = false;
  }
  
 
}
class Circle
{
  int X1;
  int Y1;

  void show()
  {
    if (trap) 
    {
      strokeWeight(1);
      stroke(255);
      rect(X2, Y2, 200, 200);
      noStroke();
      for ( int X = 0; X < width ; X += 10)
      {      
        for ( int Y = 0; Y < height ; Y += 10)
        {
          fill(round(random(100)), round(random(200)), round(random(255)));
          ellipse(random(X2 + 15, X2 + 185), random(Y2 + 15, Y2 + 185), 30, 30);
        }
      }
    }

    if (free)
    {
      noStroke();
      for ( int X = 0; X < width ; X += 20)
      {      
        for ( int Y = 0; Y < height ; Y += 20)
        {
          fill(round(random(255)), round(random(200)), round(random(100)));
          ellipse(random(X + 15, X + 185), random(X + 15, X + 185), 30, 30);
        }
      }
    }
    
    if (free2)
    {
      noStroke();
      for ( int X = 0; X < width ; X += 30)
      {      
        for ( int Y = 0; Y < height ; Y += 30)
        {
          fill(round(random(200)), round(random(255)), round(random(100)));
          ellipse(random(width), random(height), 30, 30);
        }
      }
    }
  }
}

void keyPressed()
{
  if(instructions)
  {
    instructions = false;
  }
  else 
  {
    instructions = true;
  }
}


