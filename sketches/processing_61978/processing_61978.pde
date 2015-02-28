
float ballY;
float ySpeed;
float radius;
void setup()
{
  size( 400, 600 );
  background( 255, 255, 255 );
  smooth();
  frameRate(60);
 
 // initialize varibles:
 ballY = 0 ;
 ySpeed = 5 ;
 radius = 40 ;
}


void draw()
{
  //background( random(255), random(255), random(255));
  fill( random(255), random(255), random(255));
 
  ellipse( width/2, ballY, radius*2, radius*2 );
  
  ellipse(  mouseX, mouseY, 3, 3 );
  
  println( "ballY: " + ballY );
  
    // If ball is at the bottom:
 if ( ballY >= height-radius )
 {
   ballY = height - radius ;
   ySpeed = ySpeed * (-1) ;
 }
 
  ballY = ballY + ySpeed ;
  
  textSize(48);
  textSize (mouseY/5);
  textAlign( CENTER );
  
  text( "♥☺TheBallDropsColors☺♥", mouseX, mouseY );
}

void mouseDragged()
{
  ballY = mouseY;
  ySpeed = pmouseY - mouseY ;
}
