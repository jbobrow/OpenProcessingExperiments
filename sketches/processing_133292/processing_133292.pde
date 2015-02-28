
size( 800, 400 );

int resolution = 12;
float radius = 100;
float circleX = width * 0.5;
float circleY = height * 0.5;

for( int i=0; i<resolution; i=i+1 ){
  float angle = map( i, 0, resolution, 0, TWO_PI );
  float circleOffX = cos(angle) * radius;
  float circleOffY = sin(angle) * radius;
  float x = circleX + circleOffX;
  float y = circleY + circleOffY;
  ellipse( x, y, 10, 10 );
}
