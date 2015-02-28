
tank T;

bullet[] B;
int num_bullets=10,bullet_check=-1;

asteriod[] R;
int num_asteriods=10, asteriod_check=-1;

boolean hit = false;

void setup()
{
  size(640,480);  
  smooth();
  PFont font;
  font = loadFont("Tahoma-Bold-16.vlw"); 
  textFont(font); 
 

  
  T = new tank();
  
  B = new bullet[num_bullets];
  for(int i=0;i<num_bullets;i++)
  {B[i] = new bullet();}
  
  R = new asteriod[num_asteriods];
  for(int i=0;i<num_asteriods;i++)
  {
    R[i] = new asteriod();
    R[i].asteriod_size = int(random(15,35));
    if(R[i].asteriod_size>30)
    {R[i].asteroid_color = 200;}
    else
    {R[i].asteroid_color = 120;}
  }

}

void draw()
{
  background(0);
  
  fill(255);
  T.display();
  T.move();  
  randomasteriodnumber();
  for(int i=0;i<num_bullets;i++)
  {
  if(B[i].bflag==1)
  {
    B[i].bullet_ypos-=5;
    fill(0,0,255);
    B[i].bullet_display();
  }
  if(B[i].bullet_ypos<0)
  {B[i].bflag=0;}
  }
  
  for(int j=0;j<num_asteriods;j++)
  {
  if(R[j].rflag==1)
  {
    R[j].asteriod_ypos+=R[j].speed;
    fill(255,0,0);
    R[j].asteriod_display();
  }
  if(R[j].asteriod_ypos>480)
  {R[j].rflag=0;}
  }

  hit = collisiondetection();

  fill(0,255,0);
  rectMode(CORNER);
  rect(0,0,640,30);
  fill(0);
  text("ASTRO FLIGHT",10,22);
  text("SCORE :: ", 500, 22);
  if(hit == true)
  {
    T.score+=100;   
    hit = false;
    /*if(T.score%7 == 0) 
      {
        num_asteriods++;
        R[num_asteriods-1] = new asteriod();
        R[num_asteriods-1].asteriod_size = int(random(15,35));
        if(R[num_asteriods-1].asteriod_size>30)
          {R[num_asteriods-1].asteroid_color = 200;}
        else
          {R[num_asteriods-1].asteroid_color = 120;}

      }*/
  }
  text(T.score, 590, 22);  
}

class tank
{
  int xpos=315;  
  int life = 5; 
  int score = 100;  
  void display()
  {   
    rectMode(CENTER);
    rect(xpos,470,50,10);
    rect(xpos,460,10,20);
  }
  void move()
  {
    if(keyPressed)
    {
      if(key == CODED)
       {   
        if(keyCode == LEFT)
          {xpos-=5;} 
        else if(keyCode == RIGHT)
          {xpos+=5;}
       }      
    }
    if(xpos<=0)
    {xpos=0;}
    else if(xpos>=640)
    {xpos=640;}      
  } 
}

class bullet
{
  int bullet_xpos, bullet_ypos=-1;
  int bflag=0;

  void bullet_display()
  {
    ellipseMode(CENTER);
    ellipse(bullet_xpos,bullet_ypos,10,10);
  }
}

class asteriod
{
  int asteriod_xpos, asteriod_ypos,speed,asteriod_size;
  int rflag=0;
  int asteroid_color;
  void asteriod_display()
  {
    fill(asteroid_color,asteroid_color,asteroid_color); 
    ellipseMode(CENTER);
    ellipse(asteriod_xpos,asteriod_ypos,asteriod_size,asteriod_size);
  }
}

void keyPressed()
{
  if(key == 'x' || key == 'X')
  {    
    bullet_check++;
    if(bullet_check == num_bullets-1)
    {bullet_check=0;}
    B[bullet_check].bflag=1;
    B[bullet_check].bullet_xpos=T.xpos;
    B[bullet_check].bullet_ypos = 460;
  }
}

void randomasteriodnumber()
{
  asteriod_check = int(random(-1,num_asteriods-1));
  if(R[asteriod_check].rflag!=1)
    {
    R[asteriod_check].rflag=1;
    R[asteriod_check].asteriod_xpos= int(random(0,640));
    R[asteriod_check].asteriod_ypos = 0;
    R[asteriod_check].speed = int(random(1,5));
    }
}

boolean collisiondetection()
{  
  float distance=0;
  for(int BI=0;BI<num_bullets && B[BI].bflag==1;BI++)
  {    
    for(int j=0;j<num_asteriods && R[j].rflag==1;j++)
      {
      distance+=sq(R[j].asteriod_xpos-B[BI].bullet_xpos);
      distance+=sq(R[j].asteriod_ypos-B[BI].bullet_ypos);
      distance=sqrt(distance);
      if(distance<=30)
        {
          R[j].asteriod_ypos=-5;
          R[j].rflag=0;
          B[BI].bullet_ypos=-5;
          B[BI].bflag=0;
          return(true);
//          println(B[BI].bullet_ypos);
//          println(j);
        }    
      }
  }
  return(false);
}
   

