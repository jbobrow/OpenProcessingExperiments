
int colour = 0;
int colour2 = 255;
int count = 1;

void setup(){
  
  size(500,500);
  //strokeWeight(1);
  noStroke();
  //background(255);
  smooth();
  frameRate(25);
  
} 
float distance;

void draw()
{
  background(255);
  
  if(count > 510){
    count = 1;
  }
  
  if(count > 255){
   colour = colour - 10;
   colour2 = colour2 + 10;
  }
  
 else if(count < 255)
 {
   colour = colour + 10;
    colour2 = colour2 - 10;
 //
 }
  
  
   for(int x = 50; x < 500; x = x + 50)
   {
    for(int y = 50; y < 500; y = y + 50)
    {
      distance= dist(mouseX,mouseY,x,y);
      fill(0,colour-80,0);
      if(distance<50)
      ellipse(x,y,50,50);
      
      
      fill(0,0,colour2);
      ellipse(x,y,40,40);
    //  fill(0,colour-40,0);
   //   ellipse(x,y,30,30);
    //  fill(0,0,colour2+20);
    //  ellipse(x,y,20,20);
    //  fill(0,colour,0);
    //  ellipse(x,y,10,10);
       
    }
   }
   
   count += 10;
   
}



