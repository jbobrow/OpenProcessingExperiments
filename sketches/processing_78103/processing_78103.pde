
//Michael Huang CP1 Block 7
//TRON


int x=50;
int y=150;
int direction=RIGHT;
int compX=250;
int compY=150;
int compDir=LEFT;
boolean gameOver= false;
boolean youWin=false;



void setup()
{
  size(300,300);
  background(0);
}
 void draw()
 {
   if (gameOver==true)
   {
     text("GAME OVER",100,100);
   }
   else
   {
   if (get(x,y) !=color(0))
   {
     gameOver=true;
   }
   if (youWin==true)
   {
     text("YOU WIN",100,100);
   }
   else 
   {
     if (get(compX,compY) !=color(0))
   
     youWin=true;
   }
   
   stroke(255,255,255);
   point(x,y);
   }
   if (direction==RIGHT)
   {
   x++;
   }
   else if (direction==LEFT)
   {
     x--;
   }
   else if (direction==DOWN)
   {
     y++;
   }
    else if (direction ==UP)
   {
    y--;
   } 
 
   
   
   point(compX,compY);
   if (compDir==LEFT)
   {
   compX--;
   if(get(compX-1,compY) !=color(0,0,0))
    
    compDir=DOWN;
   }
   else if (compDir==RIGHT)
   {
    compX++;
    if(get(compX+1,compY) !=color(0,0,0))
    compDir=UP;
   }
   else if (compDir==DOWN)
   {
     compY++;
      if(get(compX,compY+1) !=color(0,0,0))
     compDir=RIGHT;
   }
   else if (compDir==UP)
   {
     compY--;
     if(get(compX,compY-1) !=color(0,0,0))
     compDir=LEFT;
     
   }
   
 }     

 
 void keyPressed()
 {
   if (key=='a')
   {
     direction= LEFT;
   }
     else if (key=='d')
   {
     direction =RIGHT;
   }
   else if (key=='s')
   {
     direction= DOWN;
   }
   else if (key=='w')
   {
     direction= UP;
   } 
}
