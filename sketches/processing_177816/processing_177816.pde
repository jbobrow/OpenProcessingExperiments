
/*----------------------------------
  
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
  
 Versions:
 12.12.2014 : running version
 17.12.2014 : code optimation, correction + multi neighbors
  
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
  
 -----------------------------------*/


import processing.pdf.*;

CellularAutomata ca;
float scaleVal = 0.9;
int drawMode = 0;
boolean autoMode = true;
boolean savePDF = false;

void setup () {
  size (600, 600);

  ca = new CellularAutomata(100, 100, 1, new int [] {0, 1});

  ca.updateFull();

  frameRate (30);
  colorMode (HSB, 360, 100, 100);
  smooth();
}

void draw () {
  background(0, 0, 100);

  if (savePDF) {
    beginRecord(PDF, "export/" + timestamp() + ".pdf");
    colorMode (HSB, 360, 100, 100);
  }
  // ca.update();
  else {
    if (keyPressed && key == 'h')
    {
      translate (-mouseX*4, -mouseY*4);
      scale (4);
    }
    else {
      translate((width-width*scaleVal) * 0.5, (height-height*scaleVal) * 0.5);
      scale(scaleVal);
    }
  }

//  if (frameCount % 30 == 0) {
//    newCA();
//    ca.newRuleset();
//    ca.updateFull();
//  }

  if (!autoMode) ca.update();
  ca.draw(drawMode);

  if (savePDF) {
    endRecord();
    saveFrame("export/" + timestamp() + ".png");
    println("done saving");
    savePDF = false;
  }
}


