
//Comic Sans Must Die - http://comicsansmustdie.tumblr.com
//Sketch by Antonio Roberts and Richard Clifford
//http://www.hellocatfood.com
//http://bigrichardc.tumblr.com

import gifAnimation.*;
import geomerative.*;

RShape shp ;
RShape polyshp;

int filecount = 0;  //for number of files
int filecounter = 0; //to read through the next file

String[] svgfile;   //for array of files
String directory;   //directory of files

String filename;

float svgborder=20;
float svgaspect, svgwidth, svgheight;

GifMaker gifExport;

void setup() {
  size(490, 490);

  directory = selectFolder();
  println(directory);  
  File dir = new File(directory);
  svgfile = dir.list();
  println(svgfile);

  if (svgfile == null) {
    println("Folder does not exist");
  }
  else {

    //count how many files there are
    filecount = svgfile.length;

    //get the filename and full path of first svg file in directory
    filename = directory + '/' + svgfile[0];

    RG.init(this);

    //load first shape 
    shp = RG.loadShape(filename);
    shp = RG.centerIn(shp, g, svgborder);
    shp.translate(width/2, height/2);

    //create first gif file
    gifExport = new GifMaker(this, filename+"_destroyed"+".gif");
    gifExport.setRepeat(0); // make it an "endless" animation
    gifExport.setTransparent(28, 255, 26); // greenscreen effect 

    //set pointer to next svg file
    filecounter++;
  }
}

void draw() {
  // Green screen
  background(28, 255, 26);

  // Decide the separation between the polygon points dependent of the mouseX
  float pointSeparation = map(constrain(frameCount+200, 200, width-200), 200, width-200, 0, 700);

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

  //after 82 frames get next file if there is one
  if (frameCount == 42 && filecounter < filecount) {
    filename = directory + '/' + svgfile[filecounter];
    println(filename);

    //load new shape into screen
    shp = RG.loadShape(filename);
    shp = RG.centerIn(shp, g, svgborder);
    shp.translate(width/2, height/2);

    polyshp = RG.polygonize(shp);
    RG.shape(polyshp);

    //close last gif file
    gifExport.finish();

    //open up next gif file
    gifExport = new GifMaker(this, filename+"_destroyed"+".gif");
    gifExport.setRepeat(0); // make it an "endless" animation
    gifExport.setTransparent(28, 255, 26); // greenscreen effect

    //reset framecount
    frameCount=0;
    //move pointer to next svg file
    filecounter++;
  }
  //stop the program once all of the files have been processed
  else if (frameCount == 42 && filecounter == filecount) {
    noLoop();
  }
  println(frameCount);
}


