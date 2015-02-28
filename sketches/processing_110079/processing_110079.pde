
//Homework #5; Angeline Chen, Pittsburgh, PA; September 12

float x, y, wd, ht, r, rr;
PImage img;
PImage imgB;

void setup( )
{
  size( 400, 400 );
  background( 255 );
  
  x = width*.7;
  y = height*.3;
  wd = width*.17;
  ht = height*.1;
  r = radians(0);
  rr = radians(180);

  
  img = loadImage( "mrbean.jpg" );
  imgB= loadImage("p2.jpg");
  background(imgB);
}

void draw( )
{

   background(  imgB);
  
  //fill( 255 );
  //noStroke( );
  //rect( 0, 0, width, height );
  //imageMode( CENTER );
  //image( img, 200, 170 );
  
  drawKiss( mouseX, mouseY );
  if(  mousePressed ) 
  {
     saveFrame("p.jpg");  
     imgB =loadImage( "p.jpg");
  }
  //if (mouseX == 200)
{
  //if ( mouseY == 370 )
 {
  //drawHeart( 180, 190 );
  //drawHeart( 220, 190 );
 }
}
  //if ( mouseClicked )
  {
    //noLoop( );
  }
  //else
  {
    //loop( );
  }
  
  //if(frameCount == 1 )saveFrame("p.jpg");
}

void mousePressed( )
{
  println("$");

}

void mouseReleased( )
{
  loop( );
}

void drawKiss( float x, float y )
{
  fill( 255, 5, 5 );
  noStroke( );
  ellipseMode( CENTER );
  arc( x, y, wd, ht, r, rr);
  
  ellipse( x-ht*.4, y-ht*.1, wd*.5, ht*.6);
  ellipse( x+ht*.4, y-ht*.1, wd*.5, ht*.6);
  
  stroke( 255, 167, 167 );
  strokeWeight( 4 );
  line(x-wd*.5, y,x+wd*.5 , y);
  
}

//void drawHeart( float x, float y )
{
//  fill( 255, 5, 5 );
//  noStroke( );
//  ellipseMode( RADIUS );
//  ellipse( x-ht*.1, y, ht*.3, ht*.3 );
//  ellipse( x+ht*.1, y, ht*.3, ht*.3 );
//  triangle( x-ht
}

void keyPressed( )
{
  loop( );
  text( keyCode, 0, 0 );
  if ( keyCode == UP )
  {
    wd = wd + 4;
    ht = ht + 4;
  }
  if (keyCode == DOWN )
  {
    wd = wd - 4;
    ht = ht - 4;
  }
}





