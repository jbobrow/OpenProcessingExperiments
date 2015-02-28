
float radius = 100;

float bluex = random(800);
float bluey = random(800);
//bluei = 1;

float redx = random(800);
float redy = random(800);
int redi = 1;

float greenx = random(800);
float greeny = random(800);
int greeni;

boolean eaten;
boolean end = false;

void setup()
{
  size(800,800);
}

void draw()
{
  bluellipse();
  redellipse();
  greenellipse();
  check();
}

void redellipse()
{
  
  if(redi==1)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==2)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==3)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==4)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==5)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==6)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==7)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==8)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==9)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    greeni++;
  }
  
  else if(redi==10)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==11)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==12)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==13)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==14)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
  else if(redi==15)
  {
    fill(255,0,0);
    ellipse(redx,redy,radius,radius);
    redi++;
  }
  
}

void bluellipse()
{
  fill(0,0,255);
  ellipse(bluex,bluey,radius,radius); 
}

void greenellipse()
{
  fill(0,255,0);
  ellipse(greenx,greeny,radius,radius);
}

void check()
{
if (dist(redx, redy, greenx, greeny)<radius*2 || dist(bluex, bluey, greenx, greeny)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (eaten==false) {
      fill(0);
      ellipse(greenx, greeny, radius, radius);
      
      eaten=true;
    }
  }
  else 
  {
    eaten=false;
  }
  if (eaten==true) 
  { 
    fill(100);
    ellipse(greenx, greeny, radius, radius);
  }
}


