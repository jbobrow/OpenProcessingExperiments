
int pelota_x = 200;
int pelota_y = 150;
int pelota_dx = 1;
int pelota_dy = 1;

int raqueta1 = 150;
int raqueta1_d = 1;
int raqueta1_j = 0;

int raqueta2 = 150;
int raqueta2_d= 1;
int raqueta2_j = 0;

int m1 = 0;
int m2 = 0;

PFont f;


void setup()
{ 
  size (400, 300);
  smooth();
  f=loadFont("SynchroLET-48.vlw");
 
}
void draw()
{
  
  background (255);
   textFont (f, 45);
  fill(0);
  text( m1, 250, 60);
  text( m2, 150, 60);
  
  pelota_x += pelota_dx;
  
  if (pelota_x > 390) 
  { 
    m2 +=1;
    pelota_x= 200;
    pelota_y= 150;
  }
  
   if (pelota_x < 0) 
  { 
    m1 +=1;
    pelota_x= 200;
    pelota_y= 150;
  }
  
   pelota_y += pelota_dy;
  if ((pelota_y > 290) ||(pelota_y < 0))
  { 
    pelota_dy *= -1;
  } 
  
  if ((raqueta1 == 0) || (raqueta1 == 250))
  {
    raqueta1_d = 0;
  }
  
  
  if(keyPressed)
  {
    if (key == 'q')
    {
      if(raqueta1 != 0)
      {
      raqueta1_d = -1;
    }
    
    }
     if (key == 'a')
    {
      if(raqueta1 != 250)
      {
      raqueta1_d = 1;
    }
   } 
  }
  
  if (( pelota_y > (raqueta1- 10)) && (pelota_y < (raqueta1+50)))
  {
    if (pelota_x == 30) 
    {pelota_dx *= -1;
    }
  }
   
  raqueta1 += raqueta1_d;  
  
    if ((raqueta1 == 0) || (raqueta1 == 250))
  {
    raqueta1_d = 0;
  }
  
   if ((raqueta2 == 0) || (raqueta2 == 250))
  {
    raqueta2_d = 0;
  }
  
  
  if(keyPressed)
  {
    if (key == 'o')
    {
      if(raqueta2 != 0)
      {
      raqueta2_d = -1;
    }
    
    }
     if (key == 'l')
    {
      if(raqueta2 != 250)
      {
      raqueta2_d = 1;
    }
   } 
  }
  
  if (( pelota_y > (raqueta2 - 10)) && (pelota_y < raqueta2+ 50))
  {
    if (pelota_x == 370) 
    {
      pelota_dx *= -1;
    }
  }
   
  raqueta2 += raqueta2_d; 
  
  if (m1== 10)
  {
    text( "Ganador", 200, 150);
    
  }
  
  if (m2== 10)
  {
    text( "Ganador", 8, 150);
    
  }
  
  if (m1== 11)
   {
     m1= 0;
    m2= 0;
   }
   
   if (m2== 11)
   {
     m1= 0;
    m2= 0;
   }
   
  fill (0);
  rect(pelota_x, pelota_y, 10, 10);
  rect(20, raqueta1, 10, 50);
  rect(380, raqueta2, 10, 50);
  line(200, 290, 200, 10);
  
  
}

