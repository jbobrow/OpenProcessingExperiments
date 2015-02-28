
//  draw circles and stuff, save on exit
String outputFileName = "GreenSpiral";  //don't add extension
Boolean isFinal = false;

float r = 5;  // 75;
float theta = 0;

int centerX = 0;
int centerY = 0;

float alf = 100.00;

///////////////////////////////////////////////////////////
//  
void setup() {
  size( 1440, 900);
  background(19);
  smooth();

  centerX = width/2;
  centerY = height/2;
}

///////////////////////////////////////////////////////////
//  
void draw() {

  // Polar to Cartesian conversion
  float x = (PI*r) * cos(theta);
  float y = (PI*r) * sin(theta);

//  translate( centerX, centerY );

  noFill();
  smooth();

  if( y % 2 == 0 )
    stroke( 255, 1, 11, 10);
  else if ( y % 3 == 0 )
    stroke( 255, 255, 255, 10 );
  else
    stroke ( 1, 255, 1, 10 );

  ellipse( centerX-x, centerY-y, theta+r, theta+r );

  theta ++;

  //
  if( theta == 1666 )
  {
    exit();
  }

}

//  
//  Helper to random(255) stroke
void randStroke()
{
    stroke( random(255), random(255), random(255) );
}

///////////////////////////////////////////////////////////
//  
//  End handler, saves png to ../OUTPUT
void exit() 
{
  fill(0, 255, 0, 100 );

  //NOTE : the translate call above makes the x,y jacked up
  text( "ART DAILY => 2.4.12", this.width-150, this.height-65 );


  //  if final, save output to png
  if( isFinal )
  {
    Date d = new Date();
    long current=d.getTime()/1000;
    save( "../OUTPUT/"+ outputFileName + "-" + current+".png" );
  }

  super.stop();
}

