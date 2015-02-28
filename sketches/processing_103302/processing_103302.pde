
//3-d

float x, y, dim;
void setup()
{
  size ( 500, 500, OPENGL );
}

void draw( )
{
  background( 0 );

  fill(112, 11, 71);
  //ellipse( 0, 0, 100, 100);
  translate( width/2, height/2, 0 );
  lights( );
  rotateX( radians(40));
  rotateY( radians(frameCount));
  rotateZ( radians(60));
  sphere( 75 );
  pushMatrix( );
  translate(-250, 0, 0);


  translate(-115, 0, 0);
  fill(137, 255, 13);
  rotateX( radians( frameCount*5 ));
  rotateY( radians(30));
  rotateZ( radians(30));
  sphere( 100 );
  popMatrix( );

  pushMatrix( );
  translate(-200, 0, 0);
  fill(8, 50, 90);
  rotateX( radians( 30 ));
  rotateY( radians(30));
  rotateZ( radians(30));
  sphere( 600);
  popMatrix( );

  translate(150, 0, 0);
  fill(100, 0, 255);
  rotateX( radians( 60));
  rotateY( radians( frameCount*10));
  rotateZ( radians(60));
  sphere( 50 );

  translate (-50, 150, 0);
  lights( );
}


