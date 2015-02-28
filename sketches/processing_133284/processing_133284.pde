

void setup() {
  size ( 400, 400 );
  frameRate (2);
}

void draw() {
  background(#e6ffdb);
  translate( random(200), random(-100));
  
  int resolution = 400;
  float radius = 100;
  float circleX = width/2;
  float circleY = height/2;

  for ( int j=0; j<3; j++) {

    //dark pink flower
    fill (#91164b);

    beginShape();

    for ( int i=0; i<resolution; i++) {

      float waveAngle = map( i, 0, resolution, 0, TWO_PI*8);
      float waveOffset = noise(sin( waveAngle )) * 90;

      float angle = map( i, 0, resolution, 0, TWO_PI );
      float circleOffX = cos(angle) * (waveOffset);
      float circleOffY = sin(angle) * (waveOffset);

      float x = circleX + circleOffX;
      float y = circleY + circleOffY;

      vertex( x, y );
    }

    endShape( CLOSE );
    
    //light pink flower
    fill (#f7b9d8);

    beginShape();

    for ( int i=0; i<resolution; i++) {

      float waveAngle = map( i, 0, resolution, 0, TWO_PI*3);
      float waveOffset = noise(sin( waveAngle )) * 60;

      float angle = map( i, 0, resolution, 0, TWO_PI );
      float circleOffX = cos(angle) * (waveOffset);
      float circleOffY = sin(angle) * (waveOffset);

      float x = circleX + circleOffX;
      float y = circleY + circleOffY;

      vertex( x, y );
    }

    endShape( CLOSE );

    float rotateAngle = noise(10);
    rotate(rotateAngle);
  }
}



