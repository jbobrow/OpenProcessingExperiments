
// Homework #9 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright February 2012

int [ ] numbers = { 43,67,89,12,64,45,30,19,90,68,55,2 };

void setup()
{
  size ( 400, 400 );
  
  backDrop();
  
  textAlign( CENTER );
  fill( 0 );
  textSize( 20 );
  text( "Length of numbers Array:  " + numbers.length, width/2.0, 50 );
  text( "Total Sum of numbers Array:  " + arraySum(), width/2.0, 110 );
  text( "Average of numbers Array:  " + nf(arrayAverage(), 1, 2 ), width/2.0, 170 );
  text( "Sum of Values in numbers Array", width/2.0, 230 );
  text( "above Average:  " + arrayHighsum(), width/2.0, 260 );
  
  smileyFace();
}

void backDrop()
{
  for( float y = 0; y < height; y += 1 )
  {
    stroke( 0, 255 - y/2.0, 255 );
    line( 0, y, width, y );
  }
}

int arraySum()
{
  int sum = 0;
  for( int i = 0; i < numbers.length; i++ )
  {
    sum += numbers[i];
  }
  return sum;
}

float arrayAverage()
{
  float ave = 0;
  for( int i = 0; i < numbers.length; i++ )
  {
    ave += numbers[i];
  }
  return ave/numbers.length;
}

int arrayHighsum()
{
  int sum = 0;
  for( int i = 0; i < numbers.length; i++ )
  {
    if( numbers[i] > arrayAverage() )
    {
      sum += numbers[i];
    }
    else
    {
      sum = sum;
    }
  }
  return sum;
}

void smileyFace()
{
  fill( 255, 243, 0);
  stroke( 0 );
  strokeWeight( 1.5 );
  ellipse( width/2.0, height*.82, width/4.0, height/4.0 );
  fill( 0 );
  arc( width/2.0, height*.84, width/7.0, height/7.0, 0, PI );
  ellipse( width/2.0 + width*.05, height*.78, width/30.0, height/20.0 );
  ellipse( width/2.0 - width*.05, height*.78, width/30.0, height/20.0 );
}   
