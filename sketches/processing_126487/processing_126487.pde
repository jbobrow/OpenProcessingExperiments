
void setup()
{
  size(640,480);
}

int score=0;
String hits;
int loc_x,loc_y,px,py;
int x_diff=0,y_diff=0;
boolean xd = false,yd = false;
boolean check, gamenip=true, autopilot=false;
int bloc_yloc;
char keyholder;
boolean display=false;

void ball()
{
  fill(0);
  loc_x = width/2+px;
  loc_y = height/2+py;
  ellipse(loc_x,loc_y,25,25);
}

void collision()
{
  if((loc_x-15<20) && (loc_y> bloc_yloc && loc_y< bloc_yloc+100))  //collision with blocker 
  {
    score++; 
    check = !check;
  }  
  else if (loc_x-12<20)      //game over and reset
  {
    px = 0;
    py = 0;
    check = false;
    xd = false;
    yd = false;
    gamenip=true;
    autopilot=false;
    x_diff=0;
    y_diff=0;
    if((keyholder == 'e' && score>60)|(keyholder == 'm' && score>50)|(keyholder == 'h' && score>40)|(keyholder == 'x' && score>=25)|(keyholder == 'i' && score>=10)) 
      display = !display; //set display to true to display the cheat code  
    score = 0;
  }
  
  if(loc_x+12>=width)  //change the x postion of the ball
  {
    xd = false;
    check = !check;
  }
  else if(check)
  {
    xd = true;
  }
                             //control the y position of the ball
  if(loc_y+12>height)
  {
    yd = true; 
  }
  else if(loc_y-12<0)
  {
    yd = false;
  }
}

void speed(int x, int y)
{
  if(xd) px += 2*x;
  else px -= 2*x;
  
  if(!yd) py += 2*y;
  else py -= 2*y;
}

void control_blocker()
{
  if(autopilot)
    bloc_yloc=loc_y-40;
  else
    bloc_yloc=mouseY;  
  rect(20,bloc_yloc,2,100);    
}

void display_cheat()
{
  if(display)
    text("Congratulations! If you hit 'a' on the keyboard the blocker will auto track",55,150);
}

void draw()
{
  background(204,204,204);
  ball();
  collision();
  speed(x_diff,y_diff);
  control_blocker();
  hits = "Hits:" + score;
  display_cheat();
  text(hits,580,470);
}

void keyPressed()
{
  if(key == 'e' && gamenip)  //controls the difficulty of the game
  {
    x_diff = 1;
    y_diff = 1;
    gamenip = !gamenip;
    keyholder='e';
    display = false;
  }
  else if(key == 'm' && gamenip)
  {
    x_diff = 2;
    y_diff = 2;
    gamenip = !gamenip;
    keyholder='m';
    display = false;
  }
  else if(key == 'h' && gamenip)
  {
    x_diff = 3;
    y_diff = 3;
    gamenip = !gamenip;
    keyholder='h';
    display = false;
  }
  else if(key == 'x' && gamenip)
  {
    x_diff = 4;
    y_diff = 4;
    gamenip = !gamenip;
    keyholder='x';
    display = false;
  }
   else if(key == 'i' && gamenip)
  {
    x_diff = 5;
    y_diff = 5;
    gamenip = !gamenip;
    keyholder='i';
    display = false;
  }
  
  if(key=='a' && !gamenip)  //controls the autopilot feature
    autopilot = !autopilot;      
}



