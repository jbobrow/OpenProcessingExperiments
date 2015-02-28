
float angle,distance;

int originX, originY;
int ballSize = 10;

void setup(){
  size(400,400);
  angle = 0;
  originX = width/2;
  originY = height/2;
  distance = width/2;
}

void draw(){
  background(0);
  angle++;
  distance/=(1.06);
  if(angle > 360) angle -= 360;
  if(distance < 1) distance = width/2;
  drawBall( originX, originY );
  drawBall( originX +cos(radians(angle))*distance, originY+ sin(radians(angle))*distance );
  //println( distance );
}


void drawBall( float posx, float posy ) {
  ellipseMode(CENTER);
  fill( 155 );
  ellipse( posx, posy , ballSize, ballSize );
}
