
void setup()
{
  size(300,300);
  background(#FFFFFF);
  noFill(); 
  smooth();
  strokeWeight(8);
}

void draw ()
{
  
  background(#FFFFFF);
  
  stroke(#3299CC);
  ellipse(50,50,70,70);
  
  stroke(#000000);
  ellipse(110,50,70,70);
  
   
  stroke(#FFFF00);
  ellipse(90,100,70,70);
  
  stroke(#00FF00);
  ellipse(150,100,70,70);
  
  float x=int(random(30,300));
  
  float y=int(random(20,200));
  stroke(#FF0000);
       if((x!=90)&&(y!=30))
       {
         ellipse(x,y,70,70);
       }
       else
       {
         ellipse(170,50,70,70);
         noLoop();
       }
  
}
