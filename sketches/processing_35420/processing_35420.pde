

int a = 0;
int h = 100;

int x = 100;
int y = 200;

int x2 = 150;

int arrow = 0;

int speed = 3;



void setup()
{
  size(700,400);
  background(0);
  smooth();
  stroke(0);
}

int p = 0;

void draw()
{
  noStroke();
  fill(0);
  rect(0,0,width,height);

  while(p<7)
  {
    if(p%2 == 1)
    {
      fill(255);
    }
    else {
      fill(255,0,0);
    }

    stroke(0);

    ellipse(600,a,h-15*p,h-15*p);
    p = p+1;
  }

  p=0;
  a = a+3; 
  if(a>550) {
    a=0;
  }

  if(arrow == 1) {

    stroke(255);
    strokeWeight(4);    
    line(x,y,x2,y);
   
    x = x+3+speed;
    x2 = x2+3+speed;
    
    strokeWeight(1);
        
  }
  
  stroke(0);
} 

void mousePressed() 
{

  arrow = 1;
    if(x > width+50){x=100;}
    if(x2 > width+50){x2=150;}
  
}

void mouseReleased()
{
  speed = speed+5;
}  



