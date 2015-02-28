
//hw9 
//jingjing chen jingjin1@nadrew.cmu.edu
//copyright 2013

int [ ] xpos = {0, 40, 80, 120, 160, 200, 240, 280, 320,360};
int [ ] ypos = {0, 40, 80, 120, 160, 200, 240, 280, 320,360};
float [ ] size = {random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),      
                 };
color [ ] col = {
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
                 color(random(255),random(255),random(255)),
               };
               
void setup( )
{
  background( 0 );
  size ( 400, 400 );
  smooth ( );
  noFill( );
  for ( int i = 0; i <  xpos.length; i += 1 )
  {  
    stroke( col[ i ] );
    ellipse( xpos [ i ], ypos [ i ], size[ i ], size[ i ] );
  }
}



