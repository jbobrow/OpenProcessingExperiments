
import processing.opengl.*;
import geomerative.*;

RFont f;
RShape grp;
RExtrudedMesh em;

void setup() {
  size(600, 400, OPENGL);

  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);

  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("Depth!", "FreeSans.ttf", 50, CENTER);
  
  // Set the polygonizer detail (lower = more details)
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(1);
  
  // Geomerative's flat mesh
  //RMesh m = grp.toMesh();
  
  // Create an extruded mesh
  em = new RExtrudedMesh(grp, 20);

  // Enable smoothing
  smooth();
}

void draw()
{
  background(100);

  lights();

  translate(width/2, height/2, 200);
  rotateY(millis()/2000.0);

  fill(255, 100, 0);
  noStroke();
  
  // Draw mesh
  em.draw();
}

