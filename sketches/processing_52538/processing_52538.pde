
//  draw circles and stuff, save on exit
String outputFileName = "RainboxCircleMess";  //don't add extension
Boolean isFinal = false;

float r = 5;//  75; 
float theta = 0;

int centerX = 0;
int centerY = 0;

float alf = 100.00;

///////////////////////////////////////////////////////////
//  
void setup() {
  size( 1440, 900);
  background(36);
  smooth();
  stroke( 255, 255, 255 );
  
  centerX = width/2;
  centerY = height/2;
}

///////////////////////////////////////////////////////////
//  
void draw() {
  
  // Polar to Cartesian conversion
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  
  //  color adjuster
  if( r <= 300 )
  {
    stroke( 255, random(255), random(255), alf );
  }
  else if( r <= 600 )
  {
    stroke( random(255), 255, random(255), alf );
  }
  else
  {
    stroke( random(255), random(255), 255, alf );
  }
    
  noFill();
  
  //  circle
  ellipse( x + centerX, y + centerY, r, r ); // Adjust for center of windowstroke(  


  theta += 1;
  r += 1;

  if( r % 6 == 0 )
  {
    alf -= 0.5;
  }

  //
  if( r >= 1000 )
  {
    exit();
  }
  
}



///////////////////////////////////////////////////////////
//  
//  End handler, saves png to ../OUTPUT
void exit() 
{
  stroke(255, 255, 255);
  text( "ART DAILY / 2:2:12", 1300, 840);

  //  if final, save output to png
  if( isFinal )
  {
    Date d = new Date();
    long current=d.getTime()/1000;
    save( "../OUTPUT/"+ outputFileName + "-" + current+".png" );
  }

  super.stop();
}

