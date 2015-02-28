
int colour = 0;
int colour2 = 255;
int count = 10;


void setup(){
  
  size(500,500);
  //strokeWeight(1);
  noStroke();
background(255);
  smooth();
  frameRate(10);
  
} 
float distance;

void draw()
{
// background(255);
  
  if(count > 510)
  {
    count = 1;
  }
  
  if(count > 255){
   colour = colour - 10;
   colour2 = colour2 + 10;
  }
  
 else if(count < 255)
 {
   colour = colour + 10;
    colour2 = colour2 - 1;

 }
  
  
   for(int x = 10; x < 500; x = x + 20)
   {
    for(int y = 10; y < 500; y = y + 20)
    {
      distance= dist(mouseX,mouseY,x,y);
      fill(0,colour-80,75);
      if(distance<100)
      ellipse(x,y,20,20);
    
      
      
      fill(90,90,colour2,75);
      ellipse(x,y,10,10);
    //  fill(0,colour-40,0);
   //   ellipse(x,y,30,30);
    //  fill(0,0,colour2+20);
    //  ellipse(x,y,20,20);
      fill(0,colour,0);
   ellipse(x,y,5,5);
       
    }
   }
   
   count += 10;
   
}



