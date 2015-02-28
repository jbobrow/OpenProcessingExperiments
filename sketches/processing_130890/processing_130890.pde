
//ICE 5
//Copyright Miranda Jacoby 2014 All Rights Reserved

float x, y, dx, wd, ht; 
color bgColor, ellipseColor; 
 
void setup( ) 
{ 
 size( 400, 400 ); 
 background( 0 ); 
 x = 20; 
 y = height/2; 
 wd = 40; 
 ht = 29; 
 dx = 1; 
 
 bgColor = color( 0, 10 ); 
 ellipseColor = color(255, 0, 0 ); 
 noStroke ( ); 

} 
 
void draw( ) 
{ 
 prepareWindow( ); 
 moveEllipse( ); 
 drawEllipse( ); 
} 

void prepareWindow( ) {
  fill(bgColor);
  rect(0, 0, width, height);
}

void moveEllipse( ) {
  x = x + dx;
   if (x > width - wd* .5) 
   {
     dx = -dx; // move left
   }
    //else if( x < 0 + wd* .5 )  
  //{
   // dx = -dx;
  //}
    else if( x < wd* .5 )  
   {
     dx = -dx;  // move right
   }
}

void drawEllipse( ) {
  fill(ellipseColor);
  ellipse(x, y, wd, wd);
}

//Had trouble getting keyPressed to work correctly, 
//but decided to leave it in to mess with later.
//void keyPressed ()
//{
//  if (key == '+')
// {
//     dx++;
//     //dx = dx + 1;
// }
// else if (key == '-')
// {
//     dx--;
// }
//}




