
void setup() {  //setup function called initially, only once

  size(500, 500);
  noStroke();
  ellipseMode(CENTER);

}

void draw() {  //draw function loops 

  SubtleNausea( 31, 3.0 );

}

void SubtleNausea( int levels, float Amp ) {

  background( 0 );

  for (int i = 0; i < levels + 1; i+=1 ) {

    fill(255);
    if ( i % 2 == 0) fill(0);

    float w = 1.34 * (width - (i * width/levels));
    float v = 5*noise( frameCount/1000.0 );

    camX = Amp*sin(frameCount/10000.0) * noise( frameCount/50.0 ) * 
           sin( (i + frameCount)/v );
    camY = Amp*sin(frameCount/10000.0) * noise( frameCount/50.0 ) *
           cos( (i + frameCount)/v );

    ellipse( camX + width/2, camY + height/2, w, w );
  }

}
