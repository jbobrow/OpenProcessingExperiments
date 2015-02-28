
int me = 0;
int you = 0;
int Y = 0;
void setup ()
{
  size (500,500);
background (255);
  fill(234,97,124,10);
   
 
    
  
   
   
}
void draw ()
{
  
  while(you<150){
 rect (me,Y,you,you);
  
 
 you = you + 10;
  }
me = me + 100;
you = 0;
if (me > 500){
  me = 0;
  Y=Y + 100;
 
 
 
 
}
   
 
}

