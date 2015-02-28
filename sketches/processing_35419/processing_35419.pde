

int a = 0;
int h = 100;


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
  rect(500,0,300,height);
  
  while(p<7)
  {
  if(p%2 == 1)
  {fill(255);}
  else{fill(255,0,0);}
    
    stroke(0);
    
    ellipse(600,a,h-15*p,h-15*p);
    p = p+1;
  }
  
  p=0;
  a = a+3; 
  if(a>550){a=0;}


}  

void mousePressed() 
{
  stroke(255);
  line(100,height/2,150,height/2);
  
}  

