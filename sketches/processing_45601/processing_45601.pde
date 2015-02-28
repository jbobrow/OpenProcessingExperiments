
import peasy.*;

int boxSize=300;
int x=0;
int y=0;
int z=0;

PeasyCam aCam;

void setup () {
  frameRate(50);
  size (600, 300, P3D);
  smooth ( );
  aCam = new PeasyCam (this, 800);
}

void draw ( ){

  background (0);
  stroke (255);
  strokeWeight (0.5);
  noFill( );
  box (width,height, boxSize);

  stroke (0, random (255), 0);
  strokeWeight (1);
  for (int i=0;i<5;i++) {
    for (int j=0;j<5;j++) {
      for (int k=0;k<5;k++) {

        point (random (300), random (150), random (-150));
        point (random (300), random (-150), random (150));
      }
    }
  }
  stroke (random (255), random (255), 0);
  strokeWeight (1);
  for (int i=0;i<10;i++) {
    for (int j=0;j<10;j++) {
      for (int k=0;k<10;k++) {

        point (random (300), random (-150), random (-150));
        point (random (300), random (150), random (150));
      }
    }
  }
  stroke (random (255), random (255), random (255) );
  strokeWeight (1);
  for (int i=0;i<10;i++) {
    for (int j=0;j<10;j++) {
      for (int k=0;k<10;k++) {
        point (random (-300), random (150), random (-150));
        point (random (-300), random (150), random (150));
      }
    }
  }
  stroke (random (255), 0, random (255) );
  for (int i=0;i<10;i++) {
    for (int j=0;j<10;j++) {
      for (int k=0;k<10;k++) {
        point (random (-300), random (-150), random (150));
        point (random (-300), random (-150), random (-150));
      }
    }
  }
}

