
//Comic Sans Must Die - http://comicsansmustdie.tumblr.com
//Sketch by Antonio Roberts and Richard Clifford
//http://www.hellocatfood.com
//http://bigrichardc.tumblr.com

import geomerative.*;
import gifAnimation.*;

RShape shp;
RShape polyshp;

String svgfile;

float svgborder=20;
float svgaspect, svgwidth, svgheight;

GifMaker gifExport;

void setup() {
  size(500, 500);

  // Initialise Geomerative
  RG.init(this);

  selectFile();

  gifExport = new GifMaker(this, svgfile+"_destroyed"+".gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(28, 255, 26); // greenscreen effect
}

void selectFile() {

  svgfile = selectInput();

  if (svgfile != null)
  {
    shp = RG.loadShape(svgfile);

    shp = RG.centerIn(shp, g, svgborder);
    shp.translate(width/2, height/2);
  }
}

void draw() {
  // Green screen
  background(28, 255, 26);

  // Decide the separation between the polygon points dependent of the mouseX
  float pointSeparation = map(constrain(frameCount+175, 175, width-175), 175, width-175, 5, 520);

  // Create the polygonized version
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(pointSeparation);

  polyshp = RG.polygonize(shp);
  RG.shape(polyshp);

  // sometimes the first frame from the previous gif is displayed
  // so offset recording by 2 frames
  if (frameCount > 2) {
    gifExport.setDelay(1);
    gifExport.addFrame();
  }

  if (frameCount == 125) {
    gifExport.finish();
    //stop the program once the file has been processed
    noLoop();
  }

  println(frameCount);
}


