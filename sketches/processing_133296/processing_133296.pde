
size( 800, 400 );

int resolution = 128;
float radius = 100;
float circleX = width * 0.5;
float circleY = height * 0.5;

beginShape();
for( int i=0; i<resolution; i=i+1 ){
  
  float waveAngle = map( i, 0, resolution, 0, TWO_PI*5 );
  float waveOffset = sin(waveAngle) * 10;
  
  float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
  float circleOffX = cos(angle) * (radius + waveOffset);             // x offset from circle center
  float circleOffY = sin(angle) * (radius + waveOffset);             // y offset from circle center
  
  float x = circleX + circleOffX;                     // 
  float y = circleY + circleOffY;
  
  vertex( x, y );
}
endShape(CLOSE);

radius = 50;

beginShape();
for( int i=0; i<resolution; i=i+1 ){
  
  float waveAngle = map( i, 0, resolution, 0, TWO_PI*8 );
  float waveOffset = sin(waveAngle) * 10;
  
  float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
  float circleOffX = cos(angle) * (radius + waveOffset);             // x offset from circle center
  float circleOffY = sin(angle) * (radius + waveOffset);             // y offset from circle center
  
  float x = circleX + circleOffX;                     // 
  float y = circleY + circleOffY;
  
  vertex( x, y );
}
endShape(CLOSE);
