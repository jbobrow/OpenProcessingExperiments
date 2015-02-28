
// Homework 12
// Joseph Oak © 2013
// Data visualization of motor vehicle deaths in the U.S. by decade. 
// Use the LEFT and RIGHT keys to navigate between decades.

int previous, deaths, grid, master;
color death_color, previous_color, text_color;
float x;
float easing = 0.0625;

int [ ] yearArray = {
  
  1950,
  1960,
  1970,
  1980,
  1990,
  2000,
  2010
  
};

int [ ] deathsArray = {
  
  33186,
  36399,
  52627,
  51091,
  44599,
  41945,
  32885
  
};

int [ ] populationArray = {
  
  152271417,
  180671158,
  205052174,
  227224681,
  249464396,
  282216952,
  308745538
  
};

void setup( ) {
  
  size( 600, 600 );
  background( 0 );
  
  previous = 0;
  deaths = deathsArray[master]/100;
  death_color = color( 255 );
  previous_color = color( 255, 0, 0 );
  text_color = color( 255 );
  master = 0;
  deaths = 0;
  
  frameRate( 100 );
  
}

void keyPressed( ) {
 
 if ( master == 0 ) { 
   
    if ( keyCode == RIGHT ) {
      
      master++;
      deaths = 0;
      previous = 0;
      grid = 0;
      
    }
    
 } else if ( master >= 0 && master < deathsArray.length - 1 ) {
   
   if ( keyCode == RIGHT ) {
     
      master++;
      deaths = 0;
      previous = 0;
      grid = 0;
      
    } else if ( keyCode == LEFT ) {
      
      master--;
      deaths = 0;
      previous = 0;
      grid = 0;
      
    } 
    
 } else if ( master == deathsArray.length - 1 ) {
   
   if ( keyCode == LEFT ) {
     
      master--;
      deaths = 0;
      previous = 0;
      grid = 0;
      
    }
    
 }
    
}

void draw( ) {
  
  background( 0 );
  
  growDeaths( );
  drawDeaths( );
  growPrevious( );
  drawPrevious( ); 
  drawStats( );
  drawTitle( );
  
}

void drawTitle( ) {
  
  fill( text_color );
  noStroke( );
  textAlign( CENTER );
  textSize( 14 );
  text( "Motor Vehicle Deaths in the U.S. by Decade", width/2, height * .0625 );
  
}

void drawGrid( ) {
  
  for ( int i = 0; i < 15; i++ ) {
    
    noFill( );
    stroke( 50 );
    
    growGrid( i );
    
    ellipse( width/2, height/2, grid, grid );
    
    if ( i == 0 ) {
      
      fill( 50 );
      textAlign( CENTER );
      textSize( 14 );
      text( + i, width/2 + grid/2, height/2 );
      
    } else { 
    
      fill( 50 );
      textAlign( LEFT );
      textSize( 14 );
      text( + i * 10 + "k", width/2 + grid/2 + ( width * .0125 ), height/2 );
      
    }
    
  }
  
}

void drawStats( ) {
  
  fill( text_color );
  noStroke( );
  textAlign( CENTER, CENTER );
  textSize( 28 );
  text( + yearArray[master], width/2, (height/2) - height * .05625 );
  
  textSize( 14 );
  text( "Deaths: " + deathsArray[master]/1000 + "k", width/2, height/2 );
  
  textSize( 14 );
  text( "Population: " + populationArray[master]/1000000 + "m", width/2, height/2 + ( height * .05 ) );
  
}

void drawDeaths( ) {
  
  int size_gradient = deaths;
  int colr = 60;
  
  for ( int i = 0; i <= 60; i++ ) {
    
    int color_gradient = color( 0, colr, colr );
    
    fill( color_gradient );
    noStroke( );
    ellipse( width/2, height/2, size_gradient, size_gradient );
    
    colr--;
    size_gradient--;
    
  }
  
  drawGrid( );
  
  noFill( );
  stroke( 255 );
  ellipse( width/2, height/2, deaths, deaths );
  
}

void drawPrevious( ) {
  
  if ( master == 0 ) {
    
    return;
    
  } else if ( master > 0 ) {
  
    noFill( );
    stroke( previous_color );
    strokeWeight( 1 );
    ellipse( width/2, height/2, previous, previous );
    
    fill( previous_color );
    textAlign( CENTER );
    textSize( 14 );
    text( + yearArray[master - 1]/*+ ": " + deathsArray[master - 1]*/, width/2, height/2 + previous/2 + (height * .05 ) );

  }
  
}

void growDeaths( ) {
  
  if ( deaths <= ( deathsArray[master]/100 ) ) {
    
    float dx = ( deathsArray[master]/100 ) - deaths;
    
    if( abs(dx) > 1) {
      
      deaths += dx * easing;
      
    }
    
  } else {
    
    deaths = deaths;
    
  }
  
}

void growPrevious( ) {
  
  if ( master > 0 ) {
    
    for ( int i = 0; i <= ( deathsArray[master - 1] )/100; i++ ) {
      
      float dx = ( deathsArray[master - 1]/100 ) - previous;
      
      if( abs(dx) > 1) {
        
        previous += dx * easing;
        
      }
    
    }
    
  }
  
}

void growGrid( int goal ) {
    
  for ( int i = 0; i <= goal * 100; i++ ) {
    
    float dx = goal * 100 - grid;
    
      if( abs(dx) > 1) {
        
        grid += dx * easing;
        
      }
    
    }
  
}

