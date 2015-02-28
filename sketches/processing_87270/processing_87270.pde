
//sohee woo soheew@andrew.cmu.edu assignment 4 copyright

float wd, ht, x, y ;

void setup()
{
    size( 400, 400 );  // window size
    smooth( );
    background( 0, 0, 255 );
    fill( 0, 223, 124 );
    wd = random( 10, 100 );
    ht = random( 10, 100 );
    x = 0;
 

}

void draw( )
{
  
ellipse( 200, 200, 200, 200); 
strokeWeight(3);
ellipse( 150,200, 20, 20);
ellipse( 250, 200, 20, 20);
noFill();
arc(200, 230, 50, 50,0, PI);
}




void keyPressed( )
{
    background( random( 255 ), random(255), random(255) );
    wd = random( 10, 100 );
    ht = random( 10, 100 );
   
}

void mousePressed( )
{
     fill( random(255), random(255), random(255) );
    
}




