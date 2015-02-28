
/**
 * Digital Elevation Model Example
 * The DEM I used was found in this report:
 * "Site Selection of Petroleum Pipelines: A GIS Approach 
 *   to Minimize Environmental Impacts and Liabilities" by Russell Jones and Mace Barron
 *  
 *  -- Blaise Mibeck
 */

import peasy.*;

PeasyCam camera;

PImage dem;
int[][] altitude;
float time;

void setup() {
  size(500, 500, P3D);
  camera = new PeasyCam(this, 0, 0, 0,1000);

  // Load the DEM image into a new array
  dem = loadImage("example_DEM.jpg");
  dem.loadPixels();
  altitude = new int[dem.width][dem.height];
  for (int y = 0; y < dem.height; y = y+1) {
    for (int x = 0; x < dem.width; x = x+1) {
      color pixel = dem.get(x, y);
      altitude[x][y] = int(brightness(pixel));
    }
  }
}

void draw() {
  background(0);

  translate(-dem.width/2, -dem.height/2, 0);
  stroke(0,0,255);
  line(0,0,0, 0,0,200);
  stroke(0,255,0);
  line(0,0,0, 0,200,0);
  stroke(255,0,0);
  line(0,0,0, 200,0,0);


  for (int y = 1; y < dem.height-1; y++) {
    for (int x = 1; x < dem.width-1; x++) {

      time = millis();

      if (time <= 5000) {     
        stroke(altitude[x][y]);
        point(x, y, altitude[x][y]/100);
      } 
      else if (time >=5000 && time <= 10000) {

        stroke(altitude[x][y]);
        point(x, y, altitude[x][y]/10);
      } 
      else if (time>=10000 && time <= 15000) {

        stroke(0, altitude[x][y],255-altitude[x][y] );
        point(x, y, altitude[x][y]/10);
      } 
      else if (time >= 15000&& time<= 20000) {

        //Light(200, 100, 50, -1, -1, -1);
        stroke(0, altitude[x][y],255-altitude[x][y] );
        line(x, y, 0, x, y, altitude[x][y]/10);
      } 
      else if(time>=20000) {
        fill(0, altitude[x][y],255-altitude[x][y] );
        stroke(0, altitude[x][y],255-altitude[x][y]);
        beginShape();
        vertex(x, y, altitude[x][y]/10);
        vertex(x+1, y, altitude[x+1][y]/10);
        vertex(x+1, y+1, altitude[x+1][y+1]/10);
        vertex(x, y+1, altitude[x][y+1]/10);
        endShape();
      }
    }
  }
}


