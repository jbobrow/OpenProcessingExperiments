

int timer;
int millis=0;
float x = 0;
void setup()
{
  size(500,500);
  smooth();
  timer = 100;
  fill(0);
  background(0);
  noStroke();
}
 
void draw()
{
  if(millis() - millis >= timer)
  {
   if (mousePressed == true) {
     fill(random(0255), random(0255), random(0255));
     
   }else{
     triangle(x, height/1, 50,50,60,60);
   }
      x += 5;
      millis += timer; 
  
  } 
}




