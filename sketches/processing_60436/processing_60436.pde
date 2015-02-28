
// Project #1 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright April 2012
// Inspirational Code, Daniel Shiffman, Video Pixelation
// Support from Jim Roberts (Professor) and John Gruen (Teaching Assistant)

//INSTRUCTIONS
//Move mouse to adjust the angle of the pyramids
//UP and DOWN keys adjust the cutoff of the video


import processing.video.*;

int videoScale;
int cols, rows;
float b, cutoff;
Capture video;


void setup()  {
  size (960, 540, P3D);
  videoScale = 12;
  cols = width/videoScale;
  rows = height/ videoScale;
  b = 0;
  cutoff = -10;
  video = new Capture( this, cols, rows, 30 );
  noStroke();
}


void draw()  {
  background( 255 );
  if( video.available())  {
    video.read();
  }
  video.loadPixels();
  translate( width, 0, -400 );
  videoGrid();
  colorCutoff();
  instructBox();
}


void videoGrid()  {
  float dx, dy;
  dx = 0;
  dy = 0;
  for (int i = 0; i < cols; i++ )  {
    for(int j = 0; j < rows; j++ )  {
      int x = i*videoScale;
      int y = j*videoScale;
      color c = video.pixels[i + j*video.width];
      fill(c);
      b = ( red(video.pixels[i + j*video.width]) + 
            green(video.pixels[i + j*video.width]) + 
            blue(video.pixels[i + j*video.width]) )/3.0;
      dx = dist( mouseX, 0, x, 0);
      dy = dist( 0, mouseY, 0, y);
      pushMatrix();
        translate( -x, y, 0 );
        rotateY(tan(map(mouseX, 0, width, -1, 1)));
        rotateX(tan(map(mouseY, 0, width, 1, -2.25)));
        beginShape(TRIANGLE_FAN);
          vertex(videoScale/2.0, videoScale/2.0, b*2.0 + videoScale);
          vertex(0, 0);
          vertex(0, videoScale);
          vertex(videoScale, videoScale);
          vertex(videoScale, 0);
          vertex(0, 0);
        endShape();
      popMatrix();
    }
  }
}


void colorCutoff()  {
  fill( b );
  rectMode(CENTER);
  translate( 0, 0, cutoff);
  rect( -width/2, height/2, width*2, height*2 );
}

void instructBox()  {
  fill( 150 );
  rectMode(CENTER);
  translate( 0, 0, 25 );
  rect( -width/2.0, height + height*.1, width, height*.1 );
  textAlign( CENTER );
  fill( 0 );
  textSize( height/25.0 );
  translate( 0, 0, 2 );
  text( "Move the Mouse to adjust the angle", -width/2.0, height + height*.08 );
  text( "UP and DOWN keys adjust the image cutoff", -width/2.0, height + height*.12 );
}

void keyPressed()  {
  if( keyCode == UP )  {
    cutoff += 10;
  }
  if( keyCode == DOWN )  {
    cutoff -= 10;
  }
}
