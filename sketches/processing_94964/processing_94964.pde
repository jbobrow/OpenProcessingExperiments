
void setup() {  //setup function called initially, only once

  size(400, 400);

  background( 60 );

  noStroke();

  ellipseMode(CENTER);

}

void draw() {  //draw function loops 

  SpiralOscillation( 36, 3.0, true );

}

void SpiralOscillation( int levels, float spiralAmp, boolean deep ) {

  background( 0 );
  int w = 0;

  for (int i = 1; i < levels + 1; i+=1 ) {

    //Make Width
    if (deep) {
      w = 60*width / (i * width/levels) - 40;
    }
    else {
      w = width - (i * width/levels);
    }

    //Alternate Colors
    fill(255);
    if ( i % 2 == 0) fill(0);

    camX = (w*0.1)* spiralAmp * sin( (i + frameCount)/5.0 );
    camY = (w*0.1)* spiralAmp * cos( (i + frameCount)/5.0 );
    camX *= noise( frameCount/1000.0 );
    camY *= noise( frameCount/1000.0 );

    ellipse( camX + width/2, camY + height/2, w, w );
  }
}
