
//Homework 5
//copyright Maitri Shah Pittsburgh PA

int x,y,a,b;
color col1;

void setup ( )
{  
  size(400,400);
  noStroke ( );
  background (255);
  smooth ( );
  noCursor ( );
  
 
  
  x = 0 ;
   while ( x < 200 )
   {
     y = 0;
       while( y < 200 )
       { 
        
       fill(0,255,0,50);
       ellipse ( x+25 , y+25 , 100 , 100 );
       y = y + 50;
       
      }//while y end
     
    x = x + 50;
   }// while x end
  
  
  a = 200 ;
  while ( a < 400 )
  {
    b = 200;
      while( b < 400 )
       { 
        fill(255,0,0,20);
        ellipse ( a+25 , b+25 , 100 , 100 );
        b = b + 50;
       }//while b end
     
    a = a + 50;
  }// while a end

  fill ( 0, 255, 0);
  ellipse ( 100, 100, 50, 50);
  
  fill ( 255, 0, 0);
  ellipse ( 300, 300, 50, 50);


}//void setup end

void draw ( )
{
    
 
  
  
  if ( mouseX > 200 && mouseY <200 )
  {
    fill(0, 255, 0 );
    ellipse ( mouseX, mouseY, 50 ,50 );
  }//if end
  
  else if ( mouseX < 200 && mouseY > 200)
  {
    fill(255, 0 , 0 );
    ellipse ( mouseX, mouseY, 50, 50 );
  }//else if end
  
  
}//void draw end

