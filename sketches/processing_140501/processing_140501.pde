
//In-Class Excersize #14
//Copyright Miranda Jacoby 2014 All rights Reserved

String [ ] word = {"What", "is", "this", "I", "don't", "even", "know", "what", "I'm", "doing" };

float dx = 0; 

void setup( )
{
  size( 400, 600 );
  textSize( 24 );
  textAlign( CENTER );

}

void draw()
{
  background( 0 );
  wrapWords();
  move();
}

void wrapWords ()
{
  fill( 255, 255, 0 );
  for ( int i = 0; i < word.length; i++)
  {
     text( word[ i ], 40 + dx, 30 + i*30 );
  }

}  
    
void move ()
{
  dx += 1;    
  
  if (dx > width)
  {
    dx = 0;
  }
}



