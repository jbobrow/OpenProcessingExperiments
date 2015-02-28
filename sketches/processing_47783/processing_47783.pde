
//Homework 13_second attempt
//copyright Maitri Shah, Pittsburgh, PA

// All data from : http://www.nickburcher.com/2011/04/facebook-usage-statistics-1st-april.html

//floats - 
PImage worldmap ;
PImage fb_logo ;
PFont title_font, data_font ;
color fb_col, circle_col, data_col ;

int [] radii = new int[5] ;
int [] april2009 = { 56, 2, 17, 9, 1 } ;
int [] april2010 = { 114, 20, 24, 20, 7 } ;
int [] april2011 = { 154, 35, 29, 27, 23 } ;

int counter = 0 ;

void setup( )
{
  size(800, 800) ;
  background(255) ;
  
  worldmap = loadImage("world_map2.png") ;
  worldmap.resize(0, height/2) ;
  
  fb_logo = loadImage("facebook_logo.png") ;
  fb_logo.resize(0, 30) ;
  
  title_font = loadFont("titlefont.vlw") ;
  data_font = loadFont("Data_text.vlw") ;
  fb_col = color( 27, 132, 222 ) ;
  circle_col = color(27, 132, 222, 100) ;
  data_col = color( 14, 52, 85) ;
  
  initialize( ) ;
  
}



void initialize( )
{
  for( int i=0 ; i < radii.length ; i++ )
  {
   radii[i] = 1 ;
  }
}



void draw( )
{
  
  
  fill(255, 50) ;
  rect(0, 0, width, height) ;
  imageMode(CORNER) ;
  image(worldmap, 0, 25 ) ;
  fill(255) ;
  rect(0.3*width, 0.45*height, 0.5*width, 0.06*height) ;
  
  
  drawCircles( ) ;
  drawButtons( ) ; 
  growCircles( ) ; 
  
  credits( );
}


void credits( )
{
  textAlign(CENTER) ;
  textFont(title_font) ;
  fill(fb_col) ;
  textSize(24) ;
  text("Facebook over the Years", width/2, 0.5*height) ;
  text("Click on a year" , width/2, 0.53*height) ;
  
  textAlign(LEFT) ;
  textFont(data_font) ;
  fill(data_col) ;
  textSize(12) ;
  text("Data from: http://www.nickburcher.com/2011/04/facebook-usage-statistics-1st-april.html", 0.05*width, 0.9*height ) ;
  text("World Map Image from: www.outline-world-map.com" , 0.05*width, 0.925*height) ;
  text("Facebook Logo from: http://www.stolaf.edu/services/hr/facebook_logo.png", 0.05*width, 0.95*height) ;
}



void growCircles ( )
{
  if(counter == 1)
  {
   growCircles1( ) ;
   showText1( ) ;
  }
  
  else if (counter == 2 )
  {
   growCircles2 ( ) ; 
   showText2( ) ;
  }
  
  else if (counter == 3 )
  {
   growCircles3 ( ) ; 
   showText3( ) ;
  }
  
}


void showText1( )
{
 textFont(data_font) ;
 textAlign(CORNER) ;
 fill(data_col) ;
 textSize(14) ;
 text("No. of Users: " , 0.1*width, 0.68*height) ; 
 textSize(12) ;
 text("USA: 56,796,060" , 0.1*width, 0.71*height) ;
 text("Indonesia: 2,325,840" , 0.1*width, 0.74*height) ;
 text("UK: 17,866,140" , 0.1*width, 0.77*height) ;
 text("Turkey: 9,759,780" , 0.1*width, 0.8*height) ; 
 text("India: 1,561,000" , 0.1*width, 0.83*height) ;
}



void showText2( )
{
 textFont(data_font) ;
 textAlign(CORNER) ;
 fill(data_col) ;
 textSize(14) ;
 text("No. of Users: " , 0.44*width, 0.68*height) ; 
 textSize(12) ;
 text("USA: 114,190,780" , 0.44*width, 0.71*height) ;
 text("Indonesia: 20,775,320" , 0.44*width, 0.74*height) ;
 text("UK: 24,378,040" , 0.44*width, 0.77*height) ;
 text("Turkey: 20,538,740" , 0.44*width, 0.8*height) ; 
 text("India: 7,809,800" , 0.44*width, 0.83*height) ;
}


void showText3( )
{
 textFont(data_font) ;
 textAlign(CORNER) ;
 fill(data_col) ;
 textSize(14) ;
 text("No. of Users: " , 0.78*width, 0.68*height) ; 
 textSize(12) ;
 text("USA: 154,226,960" , 0.78*width, 0.71*height) ;
 text("Indonesia: 35,177,260" , 0.78*width, 0.74*height) ;
 text("UK: 29,673,740" , 0.78*width, 0.77*height) ;
 text("Turkey: 27,665,280" , 0.78*width, 0.8*height) ; 
 text("India: 22,956,220" , 0.78*width, 0.83*height) ;
}



void growCircles1 ( )
{
   for ( int i = 0 ; i < radii.length ; i ++ )
    {
      if ( radii[i] == april2009[i] )
      {
       radii[i] = radii[i] ; 
      }
      
      else if ( radii[i] < april2009[i] )
      {
       radii[i] = radii[i] + 1 ; 
      }
      
      else if ( radii[i] > april2009[i] )
      {
       radii[i] = radii[i] - 1 ; 
      } 
      
    }
   
}



void growCircles2 ( )
{
   for ( int i = 0 ; i < radii.length ; i ++ )
    {
      if ( radii[i] == april2010[i] )
      {
       radii[i] = radii[i] ; 
      }
      
      else if ( radii[i] < april2010[i] )
      {
       radii[i] = radii[i] + 1 ; 
      }
      
      else if ( radii[i] > april2010[i] )
      {
       radii[i] = radii[i] - 1 ; 
      } 
      
    }
   
}



void growCircles3 ( )
{
   for ( int i = 0 ; i < radii.length ; i ++ )
    {
      if ( radii[i] == april2011[i] )
      {
       radii[i] = radii[i] ; 
      }
      
      else if ( radii[i] < april2011[i] )
      {
       radii[i] = radii[i] + 1 ; 
      }
      
      else if ( radii[i] > april2011[i] )
      {
       radii[i] = radii[i] - 1 ; 
      } 
      
    }
   
}






void mouseReleased( )
{
if(  (mouseY > 465) && (mouseY < 525) )
{
   if ( mouseX > 110 && mouseX < 145 )
    {
       counter = 1 ;
    } 
    
   else if ( mouseX > 385 && mouseX < 415  )  
     {
       counter = 2 ;
     }
     
   else if ( mouseX > 655 && mouseX < 696 )
     {
       counter = 3 ;
     } 
 } 
}




void drawButtons( )
{
  fill(fb_col) ;
  textFont(title_font) ;
  textAlign(CENTER) ;
  textSize(20) ;
  
  imageMode(CENTER) ;
  image(fb_logo, 0.16*width, 0.6*height) ;
  text("April 2009" , 0.16*width, 0.65*height) ;
  image(fb_logo, 0.50*width, 0.6*height) ;
  text("April 2010", 0.50*width, 0.65*height) ;
  image(fb_logo, 0.84*width, 0.6*height) ;
  text("April 2011", 0.84*width, 0.65*height) ;
  
}




void drawCircles( )
{
  fill(circle_col) ;
  noStroke( ) ;
  //USA
  ellipse(0.13*width, 0.17*height, radii[0], radii[0]) ;
  //INDONESIA
  ellipse(0.8*width, 0.345*height, radii[1], radii[1]) ;
  //UK
  ellipse(0.437*width, 0.124*height, radii[2], radii[2]) ;
  //TURKEY
  ellipse(0.54*width, 0.177*height, radii[3], radii[3]) ;
  //INDIA
  ellipse(0.7*width, 0.25*height, radii[4], radii[4]) ;
  
}




