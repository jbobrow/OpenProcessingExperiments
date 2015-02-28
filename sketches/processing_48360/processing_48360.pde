
//Project 02 - Mapping Facebook
//copyright Maitri Shah, Pittsburgh, PA

// All data from : http://www.nickburcher.com/2011/04/facebook-usage-statistics-1st-april.html

//floats - 
PImage worldmap ;
PImage fb_logo ;
PFont title_font, data_font ;
color fb_col, circle_col, data_col, line_col; 
color button_col1 , button_col2 , button_col3 ;

int [] radii = new int[5] ;
int [] april2009 = { 2, 17, 9, 1, 2 } ;
int [] april2010 = { 9, 24, 20, 7, 20 } ;
int [] april2011 = { 22, 29, 27, 23, 35 } ; //Mexico, UK, Turkey, India, Indonesia

float [] f_april2009 = { 2.14, 17.86, 9.75, 1.56, 2.32 } ;
float [] f_april2010 = { 9.20, 24.37, 20.53, 7.80, 20.77 } ;
float [] f_april2011 = { 22.79, 29.67, 27.66, 22.95, 35.17 } ; //Mexico, UK, Turkey, India, Indonesia

String [] countries = { "Mexico" , "United Kingdom" , "Turkey" , "India" , "Indonesia" } ;

float [] percent_radii = new float[5] ;
float [] percent_centerX = new float[5] ;
float [] percent_centerY = new float[5] ;

int counter = 0 ;
int counter_2009 = 6 ;
int counter_2010 = 6 ;
int counter_2011 = 6 ;




void setup( )
{
  size(800, 800) ;
  background(255) ;
  
  worldmap = loadImage("world_map2 copy.png") ;
  worldmap.resize(0, height/2) ;
  
  fb_logo = loadImage("facebook_logo.png") ;
  fb_logo.resize(0, 30) ;
  
  title_font = loadFont("titlefont.vlw") ;
  data_font = loadFont("Data_text.vlw") ;
  fb_col = color( 27, 132, 222 ) ;
  circle_col = color(27, 132, 222, 100) ;
  data_col = color( 14, 52, 85) ;
  line_col = color(127, 127, 127, 50 ) ;
  
  button_col1 = color( 27, 132, 222 ) ;
  button_col2 = color( 27, 132, 222 ) ;
  button_col3 = color( 27, 132, 222 ) ;
  
  initialize( ) ;
  initialize_percent_radii( ) ;
  
}



//-----------------------------------------------------------------------------------------------------------
void draw( )
{
  fill(255, 50) ;
  rect(0, 0, width, height) ;
  
  imageMode(CORNER) ;  //Loads the World Map.
  image(worldmap, 0, 25 ) ;  
  
  drawCircles( ) ;  //draws the circles on the map
  drawButtons( ) ;  //draws the FB buttons 
  growCircles( ) ;  //sets the radius for circles on the map
  
  showInfo( ) ;
  
  draw_percent( ) ;  //draws the percent circles
  
  setCounter2009( ) ;  //sets 2009 as the year to compare for percent
  setCounter2010( ) ;  //sets 2010 as the year to compare for percent
  setCounter2011( ) ;  //sets 2010 as the year to compare for percent
  
  check_percent_2009_all( ) ;  
  check_percent_2010_all( ) ;
  check_percent_2011_all( ) ;
  
  mouse_NotOnRed( ) ;  //make all percent circles small again. 
  
  credits( );

}


//mouse on blue circles 640, 275 - 560, 200 - 430, 140
//------------------------------------------------------------------------------------------
void showInfo( )
{
  textAlign(CORNER) ;
  textFont(data_font) ;
  fill(data_col) ;
  textSize(15) ;
  
  if ( mouseX > 620 && mouseX < 660 && mouseY > 250 && mouseY < 300 )
   {
     text(countries[4], mouseX + 15, mouseY + 5) ;
     if ( counter == 1 ) 
     {
      text(f_april2009[4] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 2 )
     {
       text(f_april2010[4] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 3 )
     {
       text(f_april2011[4] + " million users", mouseX + 15, mouseY + 20) ;
     }
   }
  
  else if ( mouseX > 540 && mouseX < 580 && mouseY > 175 && mouseY < 225 )
  {
     text(countries[3], mouseX + 15, mouseY + 5) ;
     if ( counter == 1 ) 
     {
      text(f_april2009[3] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 2 )
     {
       text(f_april2010[3] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 3 )
     {
       text(f_april2011[3] + " million users", mouseX + 15, mouseY + 20) ;
     }
  }
 
  else if ( mouseX > 410 && mouseX < 450 && mouseY > 120 && mouseY < 160 )
  {
     text(countries[2], mouseX + 15, mouseY + 5) ;
     if ( counter == 1 ) 
     {
      text(f_april2009[2] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 2 )
     {
       text(f_april2010[2] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 3 )
     {
       text(f_april2011[2] + " million users", mouseX + 15, mouseY + 20) ;
     }
  } 

  else if ( mouseX > 330 && mouseX < 370 && mouseY > 80 && mouseY < 120 )
  {
     text(countries[1], mouseX + 15, mouseY + 5) ;
     if ( counter == 1 ) 
     {
      text(f_april2009[1] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 2 )
     {
       text(f_april2010[1] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 3 )
     {
       text(f_april2011[1] + " million users", mouseX + 15, mouseY + 20) ;
     }
  }

  else if ( mouseX > 75 && mouseX < 115 && mouseY > 180 && mouseY < 220 )
  {
     text(countries[0], mouseX + 15, mouseY + 5) ;
     if ( counter == 1 ) 
     {
      text(f_april2009[0] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 2 )
     {
       text(f_april2010[0] + " million users", mouseX + 15, mouseY + 20) ;
     }
     
     else if ( counter == 3 )
     {
       text(f_april2011[0] + " million users", mouseX + 15, mouseY + 20) ;
     }
  }
}





//Makes red cicles small again
//-------------------------------------------------------------------------------------------
void mouse_NotOnRed( )
{
 if ( mouseY < 450 || mouseY > 600) 
  {
   initialize_percent_radii( ) ;
  } 
}



//Draws the circles showing relative number of FB users
//--------------------------------------------------------------------------------------------------------------------

void draw_percent( )
{
 for( int i=0 ; i < percent_radii.length ; i++ )
  {
    fill(255, 0, 0, 50) ;
    noStroke( );
    ellipse( percent_centerX[i], percent_centerY[i], percent_radii[i], percent_radii[i] ) ; 
  }
}



//Helper function for calculating the radius of Percentage Growth Circles
//----------------------------------------------------------------------------------------------------------------------

void check_percent_2009( int j )
{
  for( int i=0 ; i < percent_radii.length ; i++ )
    {
      percent_radii[i] = (f_april2009[i]/f_april2009[j])*15;
    }
}


void check_percent_2010( int j )
{
  for( int i=0 ; i < percent_radii.length ; i++ )
    {
     percent_radii[i] = (f_april2010[i]/f_april2010[j])*30 ;
    }
}


void check_percent_2011( int j )
{
  for( int i=0 ; i < percent_radii.length ; i++ )
    {
     percent_radii[i] = (f_april2011[i]/f_april2011[j])*30 ;
    }
}

//--------------------------------------------------------------------------------------------------------------------



// Function to assign the correct percent radius for each mouse position
//-------------------------------------------------------------------------------------------------------------------

void check_percent_2009_all( )
{
 if ( counter_2009 != 6 )
 { 
  check_percent_2009( counter_2009 ) ;
 }
}


void check_percent_2010_all( )
{
  if ( counter_2010 != 6 )
  { 
   check_percent_2010( counter_2010) ;
  }   
}


void check_percent_2011_all( )
{
  if ( counter_2011 != 6 )
  { 
   check_percent_2011( counter_2011) ;
  }   
}

//------------------------------------------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------------------------------------------

void setCounter2009( )
{
 if ( counter == 1 )
 {
  //draw_percent( ) ;
  
   if( mouseY > 450 && mouseY < 600 )
   {
      if ( mouseX > 60 && mouseX < 100)
      {
       counter_2009 = 0 ;
      }
      
      else if ( mouseX > 220 && mouseX < 260)
      {
       counter_2009 = 1 ; 
      }
      
      else if ( mouseX > 380 && mouseX < 420)
      {
       counter_2009 = 2 ; 
      }
      
      else if ( mouseX > 540 && mouseX < 580)
      {
       counter_2009 = 3 ; 
      }
      
      else if ( mouseX > 700 && mouseX < 740)
      {
       counter_2009 = 4 ; 
      }
   }
  
 }

}



void setCounter2010( )
{
 if ( counter == 2 )
 {
  draw_percent( ) ;
  
   if( mouseY > 450 && mouseY < 600 )
   {
      if ( mouseX > 60 && mouseX < 100)
      {
       counter_2010 = 0 ;
      }
      
      else if ( mouseX > 220 && mouseX < 260)
      {
       counter_2010 = 1 ; 
      }
      
      else if ( mouseX > 380 && mouseX < 420)
      {
       counter_2010 = 2 ; 
      }
      
      else if ( mouseX > 540 && mouseX < 580)
      {
       counter_2010 = 3 ; 
      }
      
      else if ( mouseX > 700 && mouseX < 740)
      {
       counter_2010 = 4 ; 
      }
   } 
 }

}



void setCounter2011( )
{
 if ( counter == 3 )
 {
  draw_percent( ) ;
  
   if( mouseY > 450 && mouseY < 600 )
   {
      if ( mouseX > 60 && mouseX < 100)
      {
       counter_2011 = 0 ;
      }
      
      else if ( mouseX > 220 && mouseX < 260)
      {
       counter_2011 = 1 ; 
      }
      
      else if ( mouseX > 380 && mouseX < 420)
      {
       counter_2011 = 2 ; 
      }
      
      else if ( mouseX > 540 && mouseX < 580)
      {
       counter_2011 = 3 ; 
      }
      
      else if ( mouseX > 700 && mouseX < 740)
      {
       counter_2011 = 4 ; 
      }
   } 
 }

}




//-------------------------------------------------------------------------------------------------------------------------------

void mouseReleased( )
{
  if(  (mouseY > 670) && (mouseY < 720) )
  {
   if ( mouseX > 110 && mouseX < 145 )
    {
       counter = 1 ;
       counter_2010 = 6 ;
       counter_2011 = 6 ;
       button_col1 = color( 200, 0, 0 ) ;
       button_col2 = color( 27, 132, 222 ) ;
       button_col3 = color( 27, 132, 222 ) ;       
    } 
    
   else if ( mouseX > 385 && mouseX < 415  )  
     {
       counter = 2 ;
       counter_2009 = 6 ;
       counter_2011 = 6 ;
       button_col1 = color( 27, 132, 222 ) ;
       button_col2 = color( 200, 0, 0 ) ;
       button_col3 = color( 27, 132, 222 ) ;
     }
     
   else if ( mouseX > 655 && mouseX < 696 )
     {
       counter = 3 ;
       counter_2009 = 6 ;
       counter_2010 = 6 ;
       button_col1 = color( 27, 132, 222 ) ;
       button_col2 = color( 27, 132, 222 ) ;
       button_col3 = color( 200, 0, 0 ) ;       
     } 
   } 
}
 


//-------------------------------------------------------------------------------------------------------------------------------

void growCircles ( )
{
  if(counter == 1)
  {
   growCircles1( ) ;
  }
  
  else if (counter == 2 )
  {
   growCircles2 ( ) ; 
  }
  
  else if (counter == 3 )
  {
   growCircles3 ( ) ; 
  }
  
}


//------------------------------------------------------------------------------------------------------------------------------

void growCircles1 ( )
{
   for ( int i = 0 ; i < radii.length ; i ++ )
    {
      if ( radii[i] == 2*april2009[i] )
      {
       radii[i] = radii[i] ; 
      }
      
      else if ( radii[i] < 2*april2009[i] )
      {
       radii[i] = radii[i] + 1 ; 
      }
      
      else if ( radii[i] > 2*april2009[i] )
      {
       radii[i] = radii[i] - 1 ; 
      }  
    }
}



void growCircles2 ( )
{
   for ( int i = 0 ; i < radii.length ; i ++ )
    {
      if ( radii[i] == 2*april2010[i] )
      {
       radii[i] = radii[i] ; 
      }
      
      else if ( radii[i] < 2*april2010[i] )
      {
       radii[i] = radii[i] + 1 ; 
      }
      
      else if ( radii[i] > 2*april2010[i] )
      {
       radii[i] = radii[i] - 1 ; 
      } 
    }
}



void growCircles3 ( )
{
   for ( int i = 0 ; i < radii.length ; i ++ )
    {
      if ( radii[i] == 2*april2011[i] )
      {
       radii[i] = radii[i] ; 
      }
      
      else if ( radii[i] < 2*april2011[i] )
      {
       radii[i] = radii[i] + 1 ; 
      }
      
      else if ( radii[i] > 2*april2011[i] )
      {
       radii[i] = radii[i] - 1 ; 
      } 
      
    }
   
}

//Credit Text 
//--------------------------------------------------------------------------------------------------------------------

void credits( )
{
  textAlign(CENTER) ;
  textFont(title_font) ;
  fill(fb_col) ;
  textSize(24) ;
  text("Facebook over the Years", width/2, 0.03*height) ;
  text("Click on a year" , width/2, 0.8*height) ;
  textSize(16) ;
  text("Hover on the red circles for relative users in each country" , width/2, 0.825*height) ;
  
  textAlign(LEFT) ;
  textFont(data_font) ;
  fill(data_col) ;
  textSize(12) ;
  text("Data from: http://www.nickburcher.com/2011/04/facebook-usage-statistics-1st-april.html", 0.05*width, 0.925*height ) ;
  text("World Map Image from: www.outline-world-map.com" , 0.05*width, 0.95*height) ;
  text("Facebook Logo from: http://www.stolaf.edu/services/hr/facebook_logo.png", 0.05*width, 0.975*height) ;
}


//Draw the FB buttons, show the text saying what button represents what year
//------------------------------------------------------------------------------------------------

void drawButtons( )
{
  textFont(title_font) ;
  textAlign(CENTER) ;
  textSize(15) ;
  imageMode(CENTER) ;
  
  fill(button_col1) ;
  image(fb_logo, 0.16*width, 0.85*height) ;
  text("April 2009" , 0.16*width, 0.895*height) ;
  
  fill(button_col2) ;
  image(fb_logo, 0.50*width, 0.85*height) ;
  text("April 2010", 0.50*width, 0.895*height) ;
  
  fill(button_col3) ;
  image(fb_logo, 0.84*width, 0.85*height) ;
  text("April 2011", 0.84*width, 0.895*height) ;
  
}


//Draw the centers for all the circles on the map / Draw the lines 
//-------------------------------------------------------------------------------------------------

void drawCircles( )
{
  textAlign(LEFT) ;
  textFont(data_font) ;
  textSize(12) ;
  //Mexico, UK, Turkey, India, Indonesia
  
  //INDONESIA
  noStroke( ) ;
  fill(circle_col) ;
  ellipse(640, 275, radii[4], radii[4]) ;
  stroke(line_col) ;
  line( 640, 275, 640, 420 ) ;
  line( 640, 420, 720, 420 ) ;
  line( 720, 420, 720, 520 ) ;
  fill(data_col) ;
  //rotate(radians(90)) ;
  text( "Indonesia" , 720, 520 ) ;
  //rotate(-PI/2.0) ;

  //UK
  noStroke( ) ;
  fill(circle_col) ;
  ellipse(350, 100, radii[1], radii[1]) ;
  stroke(line_col) ;
  line(350, 100, 350, 420) ;
  line(350, 420, 240, 420) ;
  line(240, 420, 240, 520) ;
  fill(data_col) ;
  //rotate(radians(90)) ;
  text( "United Kingdom" , 240, 520 ) ;
  //rotate(-PI/2.0) ;
  
  //TURKEY
  noStroke( ) ;
  fill(circle_col) ;
  ellipse(430, 140, radii[2], radii[2]) ;
  stroke(line_col) ;
  line(430, 140, 430, 420) ;
  line(430, 420, 400, 420) ;
  line(400, 420, 400, 520) ;
  fill(data_col) ;
  //rotate(radians(90)) ;
  text( "Turkey" , 400, 520 ) ;
  //rotate(-PI/2.0) ;
  
  //INDIA
  noStroke( ) ;
  fill(circle_col) ;
  ellipse(560, 200, radii[3], radii[3]) ;
  stroke(line_col) ;
  line(560, 200, 560, 420) ;
  line(560, 420, 560, 420) ;
  line(560, 420, 560, 520) ;
  fill(data_col) ;
  //rotate(radians(90)) ;
  text( "India" , 560, 520 ) ;
  //rotate(-PI/2.0) ;
  
  //MEXICO
  noStroke( ) ;
  fill(circle_col) ;
  ellipse( 95, 200, radii[0], radii[0]) ;
  stroke(line_col) ;
  line(95, 200, 95, 420) ;
  line(95, 420, 80, 420) ;
  line(80, 420, 80, 520) ;
  fill(data_col) ;
  //rotate(radians(90)) ;
  text( "Mexico" , 80, 520 ) ;
  //rotate(radians(180)) ;
  
}

//Setup Functions -
//-------------------------------------------------------------------------------------------------
void initialize( )
{
  for( int i=0 ; i < radii.length ; i++ )
  {
   radii[i] = 1 ;
   percent_centerX[i] = i*width/5 + width/10 ;
   percent_centerY[i] = 0.65*height ;
  }
}

void initialize_percent_radii( )
{
  for( int i=0 ; i < percent_radii.length ; i++ )
  {
   percent_radii[i] = 15 ;
  }
}


