
//  R.A. Robertson 2013.10 "Robertsonian Growth Model (RGM)"
// License: Creative Commons :: Attribution, Share Alike

int siteX, siteY, chooseDirection, xGrow, yGrow;
int c, probability, growthListCheck, range;
float growDistance, siteDistance, dendrification;
color ground = color(2);          // Play with me.
boolean grow, roominess, semicardinal;
ArrayList<Site> siteList;
ArrayList<Site> growList;
ArrayList<Growth> growthList;
Growth north = new Growth(0, -1);
Growth east = new Growth(1, 0);
Growth south = new Growth(0, 1);
Growth west = new Growth(-1, 0);
Growth northeast = new Growth(1, -1);
Growth southeast = new Growth(1, 1);
Growth southwest = new Growth(-1, 1);
Growth northwest = new Growth(-1, -1);

void setup() {
  size(600, 600);
//  size(displayWidth, displayHeight);
  background(ground);
  siteList = new ArrayList<Site>();      // Established growth. 
  growList = new ArrayList<Site>();      // Growth front of new growth.
  growthList = new ArrayList<Growth>();  // Growth area of potential for each site.
  frameRate(1250);
//  noFill();
//  ellipse(width/2, height/2, height, height);  

//  colorMode(HSB);

  siteList.add(new Site(width/2, height/2, 255, 0, 0));  // Single seed example.
//  Multiple seed example.
//  for (int i = 0; i < 17; i++) siteList.add(new Site(int(random(width)), int(random(height)), 255, 0, 0));

  growthListCheck = 1;  // 0 or 1. Confirm growthList has at least one or two elements.
//  semicardinal = true;
  range = 5;  // Minimum value should be 2. Warning! Window edges come into play at large values.
}

void draw() {

  growList = siteList;
  grow = true;
  //  Color Maps:
  c = 255;
  c = int(map(frameRate, 5, 100, 15, 255));
  c = int(map(millis(), 0, 5500, 0, 255)); 
  c = int(map(siteList.size(), 5, 700, 15, 255));
  
//  for(int i = 0; i < siteList.size(); i++ ) {  // Site scan (try probability < 100).
  for(int i = siteList.size() - 1; i >= 0; i-- ) {  // Site scan (work from most recent growth).

    probability = int(random(0, 10000));  // Possibility of non-vital sites still growing.
    dendrification = random(0, 1.5);  // Lower value means more outward growth. Default 1.5
//    range = int(random(2, 45));
    
    //  Grow from site only if three (or more) degrees of freedom exist in new growth site.
    if (get(siteList.get(i).x - 1, siteList.get(i).y - 1) != ground) {  // NW fail.
      if (get(siteList.get(i).x + 1, siteList.get(i).y + 1) != ground) {  // SE fail.
        grow = int(random(0, probability)) == 0 ? false : true;
      }  // End SE fail. 
      else {  // NW failed, SE assumed to pass.  
        if (get(siteList.get(i).x + 1, siteList.get(i).y - 1) != ground) {  // NE fail.
          if (get(siteList.get(i).x - 1, siteList.get(i).y + 1) != ground) {  // SW fail.
            grow = int(random(0, probability)) == 0 ? false : true;
          }  // End SW fail. 
          else {  // NW failed, NE failed, SE passed, SW assumed to pass. Test for S.
            for (int j = 1; j <= range; j++) {
              roominess = (get(siteList.get(i).x, siteList.get(i).y + j) == ground) ? true : false;
              if (!roominess) break;
              else if (j == range) { growthList.add(south);  // Grow South.
                if (semicardinal) growthList.add(southwest);
                if (semicardinal) growthList.add(southeast);  
              }
            }
          }  // End SW pass.  
        }  // End NE fail.          
        else {  // NW failed, SE passed, NE assumed to pass.
          if (get(siteList.get(i).x - 1, siteList.get(i).y + 1) != ground) {  // SW fail. Test for E.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x + j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(east);  // Grow East.
                  if (semicardinal) growthList.add(northeast);
                  if (semicardinal) growthList.add(southeast); 
              }
            }
          }  // End SW fail.          
          else {  // NW failed, SE passed, NE passed, SW assumed to pass. Test S & E.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x, siteList.get(i).y + j) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(south);  // Grow South.
                  if (semicardinal) growthList.add(southwest);
                  if (semicardinal) growthList.add(southeast);
              }
            }
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x + j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(east);  // Grow East.
                  if (semicardinal) growthList.add(northeast);
                  if (semicardinal) growthList.add(southeast);
              }
            }
          }  // End SW pass.  
        }  // End NE pass.
      }  // End SE pass.
    }  // End NW fail.

    else {  // NW assumed to pass.
      if (get(siteList.get(i).x + 1, siteList.get(i).y - 1) != ground) {  // NE fail.
        if (get(siteList.get(i).x - 1, siteList.get(i).y + 1) != ground) {  // SW fail.
          grow = int(random(0, probability)) == 0 ? false : true;
        }  // End SW fail.  
        else {  // NW passed, NE fail, SW assumed to pass.               
          if (get(siteList.get(i).x + 1, siteList.get(i).y + 1) != ground) {  // SE fail. Test for W.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x - j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(west);  // Grow West.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(southwest);
              }
            }
          }  // End SE fail.  
          else {  // NW passed, NE fail, SW passed, SE assumed to pass. Test W & S.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x - j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(west);  // Grow West.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(southwest);
              }
            }
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x, siteList.get(i).y + j) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(south);  // Grow South.
                  if (semicardinal) growthList.add(southwest);
                  if (semicardinal) growthList.add(southeast);
              }
            }
          }  // End SE pass.  
        }  // End SW pass. 
      }  // End NE fail.
      else {  // NW passed, NE assumed to pass.  
        if (get(siteList.get(i).x - 1, siteList.get(i).y + 1) != ground) {  // SW fail.
          if (get(siteList.get(i).x + 1, siteList.get(i).y + 1) != ground) {  // SE fail.Test N.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x, siteList.get(i).y - j) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(north);  // Grow North.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(northeast);
              }
            }
          }  // End SE fail.  
          else {  // NW passed, NE passed, SW fail, SE assumed to pass. Test N & E.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x, siteList.get(i).y - j) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(north);  // Grow North.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(northeast);
              }
            }
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x + j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(east);  // Grow East.
                  if (semicardinal) growthList.add(northeast);
                  if (semicardinal) growthList.add(southeast);
              }
            }
          }  // End SE pass.  
        }  // End SW fail.
        else {  // NW passed, NE passed, SW assumed to pass.  
          if (get(siteList.get(i).x + 1, siteList.get(i).y + 1) != ground) {  // SE fail. Test N & W.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x, siteList.get(i).y - j) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(north);  // Grow North.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(northeast);
              }
            }
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x - j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(west);  // Grow West.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(southwest);
              }
            }
          }  // End SE fail.  
          else {  // All semi-cardinal points assumed to pass. Test all cardinal and double cardinals.
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x, siteList.get(i).y - j) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(north);  // Grow North.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(northeast);
              }
            }
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x + j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(east);  // Grow East.
                  if (semicardinal) growthList.add(northeast);
                  if (semicardinal) growthList.add(southeast);
              }
            }
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x, siteList.get(i).y + j) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(south);  // Grow South.
                  if (semicardinal) growthList.add(southwest);
                  if (semicardinal) growthList.add(southeast);
              }
            }
            for (int j = 1; j <= range; j++) { 
              roominess = (get(siteList.get(i).x - j, siteList.get(i).y) == ground) ? true : false;
                if (!roominess) break;
                else if (j == range) { growthList.add(west);  // Grow West.
                  if (semicardinal) growthList.add(northwest);
                  if (semicardinal) growthList.add(southwest);
              }
            }
          }  // End SE pass.  
        }  // End SW pass.
      }  // End NE pass.
    }  // End NW pass.

    if (grow && growthList.size() > growthListCheck) {  
      
      chooseDirection = int(random(0, growthList.size()));     
      xGrow = growthList.get(chooseDirection).x;
      yGrow = growthList.get(chooseDirection).y;

      siteX = siteList.get(i).x + xGrow;
      siteY = siteList.get(i).y + yGrow;
      
      siteDistance = dist(width/2, height/2, siteList.get(i).x, siteList.get(i).y);
      growDistance = dist(width/2, height/2, siteList.get(i).x + xGrow, siteList.get(i).y + yGrow);
      
      if (growDistance > siteDistance - dendrification) {  // Limit backfill, control tangle.
        growList.add(new Site(siteX, siteY, 180, 230, 200));
        growthList.clear();
      }

    }
    else {   
      growList.set(i, new Site(siteList.get(i).x, siteList.get(i).y, c, c, c));   
      growList.remove(i);
  }
}  // End site scan.

  siteList = growList;

//  println(int(frameRate) + "  " + siteList.size() + "  " + xGrow + "  " + yGrow + "  " + grow);
//  println(growthList.size());
//  if (siteList.size() == 0) { noLoop(); filter(BLUR); }
  if (siteList.size() == 0) { noLoop(); noCursor(); }  // noCursor() for image capture of completed render.
  if (frameRate < 5) exit();
}

/* ======================= Classes ======================= */

//  Simple location and display.
class Site {
  int x, y, r, g, b;
  Site(int x, int y, int r, int g, int b) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
    set(int(x), int(y), color(r, g, b));
  }
}

//  Even simpler location object for growth areas.
class Growth {
  int x, y;
  Growth(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

/* ========================== UI ========================== */

boolean toggleLoop = true;
boolean showCursor;

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop();
      noCursor();
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
 if (mouseButton == RIGHT) {
 setup();
 loop();
 }
}

void mouseMoved() {
  showCursor = true;
}

void keyPressed() {
  if (key == 'i' || key == 'I') { // Saves an image file.
   String timestamp = year() + "" + nf(month(), 2) + "" + nf(day(), 2) + "" + 
          nf(hour(), 2) + "" + nf(minute(), 2) + "" + nf(second(), 2);
   saveFrame("renders/rgm_" + timestamp + ".jpg");
  }    
}
