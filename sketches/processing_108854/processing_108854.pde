
//Homework#3; Angeline Chen; Pittsburgh, PA; Sept 9, 2013

float x, y, wd, ht;

void setup ()
{
  size( 400, 400 );
  background( 177, 220, 237 );
  
  x = width*.7;
  y = height*.5;
  wd = width*.1;
  ht = height*.3; 
  
  //String[] fontList = PFont.list();
  //println(fontList);
  //myFont = createFont("CoffeeHouse", 2 );
  //textFont( myFont );
  //textAlign( CENTER, CENTER );
  
}

  int value = 255;
  int circle = 0;

void draw ()
{
  fill( value );
  rect( 0, 0, width, height );
  
  fill( circle );
  noStroke( );
  ellipse( mouseX, mouseY, ht*.5, ht*.5 );
  
  fill( random(252), random(147), random(112) );
  noStroke( );
  ellipse( mouseX, y, wd, wd );
  
  fill( random(147), random(252), random(112) );
  noStroke( );
  ellipse( x, mouseY, wd, wd );
  
  fill( random(112), random(118), random(252) );
  noStroke( );
  ellipse( y, mouseX, wd, wd );
  
  fill( random(252), random(112), random(122) );
  noStroke( );
  ellipse( mouseY, x, wd, wd );
  
  fill( random(250), random(322), random(54) );
  noStroke( );
  ellipse( mouseY*.75+50, mouseX+160, wd, wd);
  
  fill( random(255) );
  noStroke( );
  ellipse( 1000-mouseY, 1000-mouseX, wd, wd);
  
  fill( random(124), random(120) );
  noStroke( );
  ellipse( 1000-mouseX, 1000-mouseY, wd, wd);
  
  fill( random(124), random(120) );
  noStroke( );
  ellipse( mouseX*.75+34, mouseY*.63+90, wd, wd);
  
  fill( circle );
  
  text( "click", width*.49, height*.49 );
  createFont( "AbrahamLincoln", 2 );
  
}

void mouseClicked( ) {
    if (value == 255) {
      value = 100;
    } else {
      value = 255;
    }
      if (circle == 0) {
      circle = 255;
    } else {
      circle = 0;
    }
}



