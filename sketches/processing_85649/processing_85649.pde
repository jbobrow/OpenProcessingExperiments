
void setup ()
{
 
 size(500,500);
background(#FFFFFF);
noLoop();
  
}

void draw ()

{
stroke(#E828B2);
noFill();


 
 for (int posx = 25; posx <= 475; posx = posx+50)
 for ( int posy = 25; posy <= 475; posy = posy+50)
 
 {ellipse(posx,posy,60,60);}
 
 noFill();
 stroke(0);
  for (int posx = 25; posx <= 475; posx = posx+50)
 for ( int posy = 25; posy <= 475; posy = posy+50)
 
 {ellipse(posx,posy,50,50);}
 
  for (int posx = 25; posx <= 475; posx = posx+50)
 for ( int posy = 50; posy <= 475; posy = posy+50)
 
 {ellipse(posx,posy,20,20);}
 
 stroke(#2CF085);
 noFill();
  for (int posx = 25; posx <= 475; posx = posx+50)
 for ( int posy = 50; posy <= 475; posy = posy+50)
 
 {ellipse(posx,posy,30,30);}
 
 

 
 


 
 
 
 
}


