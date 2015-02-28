
//Adam Blckstock-period 4-4.9.14
//space bar makes shape appear
//mouse moves platform
float x = 100;   
float y = 0;     

float speed = 0;   


float gravity = 0.1;  
void setup ()
{ 
  size (500,500);   
  //smooth();
  //fill(0);  
  //textFont(createFont("SansSerif",18));
  //textAlign(CENTER);
  //noLoop(); 
}
void draw (){
//text("score   ", width/2, height/2);
  
  background(#FF0000);

 
  fill(#1000FF);
  stroke(0);
  rectMode(CENTER);
  rect(x,y,50,50);
  
  
  y = y + speed;
  
  
  speed = speed + gravity;
 
  if (y > height) {
  
    speed = speed * -0.95;  
  }


{  
if (keyPressed)
{
    
fill(random(0,255));
   }

else
  
{ 
background (#FF0000);
}}}
