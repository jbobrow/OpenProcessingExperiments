
import sms.*;

int boxW = 80;
int boxH = 40;
int boxD = 80;
int num = 5;

void setup() {
  size(600, 600, P3D);
}

void draw() {
  smooth();
  colorMode(HSB);
  noStroke();
  background(0, 0, 0);
  translate(300, 300);

  int[] vals = Unimotion.getSMSArray();

  for (int i=0; i < num; i++) {
    for (int j=0; j < num; j++) {
      for (int k=0; k < num; k++) {

      fill((i*2+100), (j*2+200), (k*2+100), 100);
      pushMatrix();

      scale (0.3);
      pushMatrix();
      translate(i*vals[0], j*vals[1], k*vals[2]);
      rotateX(radians(vals[0]) );  
      rotateY(radians(vals[1]) );
      rotateZ(radians(vals[2]) );


      box(boxW, boxH, boxD);
      popMatrix();

      popMatrix();
      }
    }
  }
}


