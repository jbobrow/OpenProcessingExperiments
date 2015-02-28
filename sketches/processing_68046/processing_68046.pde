
/* Carvajal Santos Christian Uziel
	Aro RANDOM */


void setup()
{
  size(400,400);
  background(#FFFFFF);
  noFill(); 
  smooth();
  strokeWeight(4);
}

void draw ()
{
  
  background(#FFFFFF);
  
  stroke(#3299CC);
  ellipse(150,150,70,70);
  
  stroke(#000000);
  ellipse(210,150,70,70);
  
   
  stroke(#FFFF00);
  ellipse(190,200,70,70);
  
  stroke(#00FF00);
  ellipse(250,200,70,70);
  
  float x=int(random(50,550));
  
  float y=int(random(50,550));
  stroke(#FF0000);
       if((x!=80)&&(y!=40))
       {
         ellipse(x,y,70,70);
       }
       else
       {
         ellipse(270,150,70,70);
         noLoop();
       }
  
}  

