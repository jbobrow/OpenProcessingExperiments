
void setup ()
{
 
 size(500,500);
background(#E08698);
noLoop();
  
}

void draw ()

{

noFill();
 stroke(#14DE2D);
   for (int posx = 30; posx <= 475; posx = posx+50)
 for ( int posy = 50; posy <= 475; posy = posy+50)
 
 {ellipse(posx,posy,100,100);}
 
 
 noStroke();
 fill(#00E6F0);
   for (int posx = 30; posx <= 475; posx = posx+50)
 for ( int posy = 50; posy <= 475; posy = posy+50)
 {ellipse(posx,posy,20,20);}
 
 noFill();
 stroke(#CFF000);
   for (int posx = 30; posx <= 475; posx = posx+50)
 for ( int posy = 50; posy <= 475; posy = posy+50)
 {ellipse(posx,posy,50,50);}
 
  noFill();
 stroke(#F03400);
   for (int posx = 30; posx <= 475; posx = posx+50)
 for ( int posy = 50; posy <= 475; posy = posy+50)
 {ellipse(posx,posy,80,80);}

 
 
 
 }


