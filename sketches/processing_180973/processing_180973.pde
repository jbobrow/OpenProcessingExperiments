
//returns random integer between a minimum and maximum value
public  int randInt(int min, int max) {

   return round(random(min,max));
}

color back_color = color(255,255,255);
int count1 = 0;
int count2 = 0;
float pos_x;
float pos_y;
float dx;
float dy;
int speed = 10;
boolean wait1 = true;
boolean wait2 = true;
boolean wait3 = false;

void setup()
{
  //16:9 ratio * 75
  size(1200, 675);
  pos_x = random(675);
  pos_y = random(675);
  background(back_color);
  smooth();
  frameRate(60);
} 

void draw()
{ 
int pen_speed = speed;
  //checks for change in pen speed
  while(pen_speed>0){
  controls();
  pen();
  pen_speed -= 1;
  }
}

void pen()
{
  
  if(count1 == 0)
  {
    color pen_color = color(randInt(0,255),randInt(0,255),randInt(0,255));
    stroke(pen_color);
    fill(pen_color);
    count1 = randInt(1,500);
  }
  //changing direction 
  if(count2 == 0){
    
    int choice = randInt(1,8);
    //8 directions (up, down, left, right, up+left, up+right, down+left, down+right)
    
    if(choice == 1)
      {
      dx = 0;
      dy = 1.0;
      }
    
    else if(choice == 2)
      {
      dx = 0;
      dy = -1.0;
      }
    
    else if(choice == 3)
      {
      dx = 1.0;
      dy = 0;
      }
    
    else if(choice == 4)
      {
      dx = -1.0;
      dy = 0;
      }
    
    else if(choice == 5)
      {
      dx = 1.0;
      dy = 1.0;
      }
    
    else if(choice == 6)
      {
      dx = 1.0;
      dy = -1.0;
      }
    
    else if(choice == 7)
      {
      dx = -1.0;
      dy = 1.0;
      }
    
    else if(choice == 8)
      {
      dx = -1.0;
      dy = -1.0;
      }
    count2 = randInt(1,500);
    }
    
  count1 -= 1;
  count2 -= 1;

  pos_x += dx;
  pos_y += dy;

  if(pos_x > width || pos_x < 0)
    {
    dx *= -1.0;
    }
  
  if(pos_y > height || pos_y < 0)
    {
    dy *= -1.0;
    }
  
  //pen tip
  ellipse(pos_x,pos_y,5,5);
}

void controls()
{
//clear screen with spacebar
if(wait1==true)
  {
    if(keyPressed == true)
    {
      if(key == ' ')
      {
      background(back_color);
      wait1 = false;
      }  
    }
  }
else
  {
    if(keyPressed == false)
    {
    wait1 = true;
    }
  }

//increase speed up arrow 
if(wait2==true)
  {
    if(keyPressed == true)
    {
    if(keyCode == UP)
      {
      speed +=5;
      wait2 = false;
      }
    }
  }
else
  {
    if(keyPressed == false)
    {
    wait2 = true;
    }
  }

//decrease speed with down arrow
if(wait3==true)
  {
    if(keyPressed == true)
    {
    if(keyCode == DOWN)
      {
      if(speed > 5)
        {
        speed -=5;
        wait3 = false;
        }
      }
    }
  }
else
  {
    if(keyPressed == false)
    {
    wait3 = true;
    }
  }
}


