
/*
Using Geomerative library by Ricard Marxer:
http://www.ricardmarxer.com/processing/geomerative/documentation/
which is released under GNU GPL.

Featuring "anna" font by k-type.
*/

import geomerative.*;

String  FONT                 = "ANNA____.ttf";
int     MARGIN               = 50;
float   DEFAULT_SEGMENT_STEP = 0.4;
int     DEFAULT_SEGMENTATOR  = RCommand.UNIFORMLENGTH;// UNIFORMSTEP ADAPTATIVE UNIFORMLENGTH

RPoint[] pixelize(String message) {
  return pixelize(message, DEFAULT_SEGMENTATOR, DEFAULT_SEGMENT_STEP);
}

RPoint[] pixelize(String message, int segmentator) {
  return pixelize(message, segmentator, DEFAULT_SEGMENT_STEP);
}

RPoint[] pixelize(String message, int segmentator, float segmentStep) {
  RPoint[] result;  
  RFont f;
  RGroup gr;
  
  f = new RFont(this, FONT, 400, RFont.CENTER);
  gr = f.toGroup(message);
  
  RCommand.setSegmentStep(segmentStep);
  RCommand.setSegmentator(segmentator);
  
  gr = gr.toPolygonGroup();
  gr.centerIn(g, MARGIN, 1, 1);
  
  result = gr.getPoints();
  
  return result;
}


