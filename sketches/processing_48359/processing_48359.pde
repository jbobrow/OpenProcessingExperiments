
//Project 01 - End of semester firworks!
//copyright Maitri Shah, Pittsburgh, PA

//floats - 
float a, b, delta, angle_1, angle_2, x1, y1, x2, y2, dia ;  
color col_sparkles ; 
float delta_x, delta_y ;

float [] xPos = {-50};
float [] yPos = {-50};

int counter ;

PImage skyline ;
PFont font_1 ;

color col_1 ;

void setup( )
{
 size(800, 800) ;
 background(255) ;
 
 delta = random(5, 10 ) ;
 dia = 10 ; 
 
 skyline = loadImage("skyline trans.png") ;
 skyline.resize(800, 300) ;
 
 font_1 = loadFont("font_1.vlw") ;
 textFont(font_1) ;
 textAlign(CENTER) ;
 
 col_1 = color(39, 39, 39, 150) ;
}



void draw( )
{
   noStroke( ) ;
   screen_SetUp( ) ;
   fireCracker( ) ;
   showText( ) ;
}

void showText( )
{
 textSize(30) ;
 fill(200, 0, 0) ;
 text("It's the end of the semester!", 0.5*width, 0.9*height) ; 
 
 textSize(24) ;
 text("click mouse to place firecrakers and hit any key to light", 0.5*width, 0.93*height) ;
}


void fireCracker( )
{
 for( int i=0 ; i < xPos.length ; i++ )
 {
   drawTriangle( xPos[i] , yPos[i] ) ;
   
   if ( counter == 1)
   {
    drawEllipses( xPos[i] , yPos[i] ) ;
    col_1 = color(250, 246, 193, 180) ;
    textSize(32) ;
    fill(200, 0, 0 ) ;
    text("Let's Celebrate!", 0.5*width, 0.2*height) ;
    
   }
 } 
}


void screen_SetUp( )
{
  fill(0) ;
  rect(0, 0.7*height, width, height) ;

  fill(col_1) ;
  rect(0, 0, width, 0.7*height) ;
 
  image( skyline, 0, 0.5*height ) ;
}



void mouseClicked( )
{
  if( mouseY > 0.7*height)
  {
    float tempX ;
    tempX = mouseX ;
    xPos = append( xPos, tempX) ;
    
    float tempY ;
    tempY = mouseY ;
    yPos = append( yPos, tempY) ;
  }
    
}

void keyPressed( )
{
 counter = 1 ; 
}


void drawTriangle ( float x , float y )
{
  fill(255, 0, 0 ) ;
  noStroke( ) ;
  triangle( x , y, x-10, y+25, x+10, y+25 ) ;
}


void drawEllipses( float vertice_x, float vertice_y )
{ 
 angle_1 = -90 ;
 angle_2 = -angle_1 ;
 
 a = random(100, 125) ;
 b = random(300, 400) ;
  
 for( int i = 0 ; i < 23 ; i++ )
 {
   x1 = vertice_x - a - a*sin(radians(angle_1)) ;
   y1 = vertice_y - b*cos(radians(angle_1)) ;
   
   x2 = vertice_x + a - a*sin(radians(angle_2)) ;
   y2 = vertice_y -b*cos(radians(angle_2)) ;
   
   draw_sparkles(x1, y1, dia) ;
   draw_sparkles(x2, y2, dia) ;
   
   angle_1 = angle_1 + delta ;
   angle_2 = angle_2 - delta ;
 }
}



void draw_sparkles( float center_x, float center_y, float dia )
{
  col_sparkles = color(random(255), random(255), random(255) ) ;
  delta_x = random( -dia, dia) ;
  delta_y = random( -dia, dia) ;
  strokeWeight(2) ;
  stroke(col_sparkles) ;
  line( center_x, center_y, center_x-delta_x , center_y - delta_y ) ;
}


