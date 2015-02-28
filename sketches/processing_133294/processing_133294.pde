
size( 800, 400 );

int resolution = 12;
float radius = 100;
float circleX = width * 0.5;
float circleY = height * 0.5;

beginShape();
for( int i=0; i<resolution; i=i+1 ){
  float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
  float circleOffX = cos(angle) * radius;             // x offset from circle center
  float circleOffY = sin(angle) * radius;             // y offset from circle center
  float x = circleX + circleOffX + random( -20, 20 );                     // 
  float y = circleY + circleOffY + random( -20, 20 );
  
  vertex( x, y );
}
endShape(CLOSE);
