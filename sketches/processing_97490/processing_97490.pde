
void setup ()
{
 
 size(500,500);
background(#C6C6C6);
noLoop();
  
}

void draw ()

{
noFill();


 
 for (int posx = 25; posx <= 475; posx = posx+50)
 for ( int posy = 25; posy <= 475; posy = posy+50)
 
 {ellipse (posx,posy,60,60);}
 
 noFill();
 stroke(#EA05E7);
  for (int posx = 50; posx <= 475; posx = posx+50)
 for ( int posy = 50; posy <= 475; posy = posy+50)

{ellipse (posx,posy,20,20);}


noFill();
 stroke(#07F530);

 for (int posx = 25; posx <= 475; posx = posx+25)
 for ( int posy = 25; posy <= 475; posy = posy+25)
 
 {ellipse (posx,posy,25,25);}
 
  
}


