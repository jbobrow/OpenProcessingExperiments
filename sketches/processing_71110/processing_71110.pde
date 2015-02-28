
// AlanChen
//Function
//14/15ComputerProgrammingClass
//http://alansprogrammingsite.webs.com/

int x=0;
void setup()
{
  size(500,500);
  stroke(135,255,115);
  noFill();
  //background(0,0,0);
}
void draw()
{
  fill(0,0,0,10);
  rect(0,0,500,500);
  ellipse(50,x,50,50);
  x=x+1;
  
 
  rect(0,0,500,500);
  ellipse(100,x,50,50);
 x=x+1;
  
 
  rect(0,0,500,500);
  ellipse(150,x,50,50);
  x=x+1;
  
  rect(0,0,500,500);
  ellipse(x,50,50,50);
  x=x+1;
  
 
  rect(0,0,500,500);
  ellipse(x,100,50,50);
  x=x+1;
  
  rect(0,0,500,500);
  ellipse(x,150,50,50);
  x=x+1;


}
