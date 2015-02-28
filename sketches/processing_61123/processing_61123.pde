
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

float sc = 100.0;
int detail = 3;

PeasyCam cam;
void setup() {
  size(640, 400, P3D); 
  cam = new PeasyCam(this, 700);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(1000);

  textFont(loadFont("53Seed-8.vlw"));
  textMode(SCREEN);

  background(0);
}

void draw() {
 background(0);

  // now draw things that you want relative to the camera's position and orientation
cam.beginHUD();
  fill(255);
  text("noiseStudy :: kof", width-80, height-10);
  cam.endHUD();

  float maxX[] = new float[3];
  float maxY[] = new float[3];

  float minX[] = new float[3];
  float minY[] = new float[3];


  float maxZ[] = new float[3];
  float minZ[] = new float[3];


  int cnt = 0;

  for (int Z = -150;Z<=150;Z+=150) {

    maxX[cnt] = -1000;
    maxY[cnt] = -1000;
    minX[cnt] = 1000;
    minY[cnt] = 1000;
    maxZ[cnt] = -1000;
    minZ[cnt] = 1000;



    for (int y = -height/2 ; y < height/2; y += detail) {
      float z = 0;

      for (int x = -height/2 ; x < height/2; x += detail) {


        if (minZ[cnt]>z) {
          minZ[cnt] = z;
          minX[cnt] = screenX(x, y, z+Z);
          minY[cnt] = screenY(x, y, z+Z);
        }

        if (maxZ[cnt]<z) {
          maxZ[cnt] = z;
          maxX[cnt] = screenX(x, y, z+Z);
          maxY[cnt] = screenY(x, y, z+Z);
        }


        z += ((noise((x+frameCount)/sc+height/2, (y+frameCount)/sc+height/2, (Z+frameCount/sc)/sc)-0.5)*300.0-z)/30.0;

        stroke(lerpColor(#ff0000, #ccff00, map(z, -150, 150, 0, 1)), (z+150)/2.0);
        line(x, y, z+Z, x, y, z+Z+1);
      }
    }

    cnt++;
  }




  cam.beginHUD();
  float d = 25.0;
  for (int i = 0 ; i < cnt;i++) {
    stroke(255, 50);
    noFill();
    ellipse(minX[i], minY[i], 10, 10);
    ellipse(maxX[i], maxY[i], 10, 10);
    fill(255);
    
    
textAlign(RIGHT);
    line(minX[i], minY[i], minX[i]-d*5, minY[i]-d);
    text(minZ[i]+" min "+i, minX[i]-d*5, minY[i]-d);
    
    textAlign(LEFT);
    line(maxX[i], maxY[i], maxX[i]+d*5, maxY[i]-d);
    text(i+" max "+maxZ[i], maxX[i]+d*5, maxY[i]-d);
  }
  
  for (int i = 1 ; i < cnt;i++) {
    line(minX[i], minY[i], minX[i-1], minY[i-1]);
    line(maxX[i], maxY[i], maxX[i-1], maxY[i-1]);
  }
  cam.endHUD();
}


