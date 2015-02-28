
//  R.A. Robertson 2012.03 - .04 "Voronoi 1" ~ www.rariora.org ~
//  Derivation of http://www.openprocessing.org/sketch/11400

boolean toggleLoop = true;
boolean toggleAlpha, toggleFrame, toggleSites  = true;
float siteX, siteY, r, distance;
Site [] siteList = {};           // Array of Site objects.
int  [] colorList = {};          // Array of random colors.
int trans;                       // Optional alpha value for colors.
int index;                       // Used in for loop, but corresponds to site & color array indices.
float sample;                    // Storage for distance comparisons. Retains lowest value.
int maxSites = 12;               // Constrain Sites array.
float linear, scaler;            // Adjust distance test, either linear or scaler.
int addSites;                    // Increase number of Sites.

void setup() {
//  frame.setTitle("Voronoi 1");
  float base = 500, aspect = 2;
  size(int(base), int(base/aspect));
  loadPixels();
  background(0);
  noStroke();
  smooth();
  r = 5;
  linear = 0;
  scaler = 1;
  addSites = 0;
}

void draw() {

if (toggleFrame) {
 noLoop(); toggleLoop = false;
}

trans = (toggleAlpha) ? 7 : 255;                              // Transparency interface.
 
 if (siteList.length < maxSites + addSites) {                 // Array constraint.
 siteX = random(width);
 siteY = random(height);
 siteList = (Site[]) append(siteList, new Site(siteX, siteY, r));
 colorList = append(colorList, color(random(145), random(145), random(105), trans));
 }
 
 for (int x = 0; x < width; x++) {                            // Scan rows.
   for (int y = 0; y < height; y++) {                         // Scan columns.
     index = 0;                                               // (Re)set index.
     for (int i = 0; i < siteList.length; i++) {              // Scan sites.
       distance = dist(x, y, siteList[i].x, siteList[i].y);   // Get pixel-to-site distance.
       if (distance < sample || i == 0) {                     // Compare current to stored value,
         sample = (distance + linear) * scaler;               // if lower, replace stored value,
         index = i;                                           // store index of nearest distance.
       }
     }
//     set(x, y, colorList[index]);                             // Set color w/index site/color arrays.
     pixels[x + (y * width)] = colorList[index];              // Same as above, but faster.
   }
 }
 
 updatePixels();

for(int i = 0; i < siteList.length; i++) {                  // Draw sites.
  fill(0, trans * 2);
  if (toggleSites) {
    ellipse(siteList[i].x, siteList[i].y, r, r);
  }
  colorList[i] = color(red(colorList[i]), green(colorList[i]), blue(colorList[i]), trans);  
  siteList[i].x += siteList[i].xv;                            // Optional animation.
  siteList[i].y += siteList[i].yv;
  siteList[i].xv = (siteList[i].x >= width) ? -siteList[i].xv : siteList[i].xv;
  siteList[i].xv = (siteList[i].x < 0) ? -siteList[i].xv : siteList[i].xv;
  siteList[i].yv = (siteList[i].y > height) ? -siteList[i].yv : siteList[i].yv;
  siteList[i].yv = (siteList[i].y < 0) ? -siteList[i].yv : siteList[i].yv;  
}

}

/* ======================= Site Class ======================= */

class Site {
  float x, y, xv, yv, r;
  Site(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.xv = random(-2, 2);
    this.yv = random(-2, 2);
  }
}

/* =======================       UI       ======================= */

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
 if (mouseButton == RIGHT) {
 siteList = new Site[0];
 colorList = new color[0];
 setup();
 } 
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    if (toggleSites) {
      toggleSites = false;
    }
    else { 
      toggleSites = true;
    }
  }
  if (key == 'a' || key == 'A') {
    if (toggleAlpha) {
      toggleAlpha = false;
    }
    else { 
      toggleAlpha = true;
    }
  }
  if (key == '=' || key == '+') {
    linear++;
  }  
  if (key == '-' || key == '_') {
    linear-- ;
  }
  if (key == '.' || key == '>') {
    scaler += .02;
  }  
  if (key == ',' || key == '<') {
    scaler -= .02;
    scaler = (scaler < 0) ? 0 : scaler;        // Constrain lowest value to 0.  
  }
  if (key == ']' || key == '}') {
    addSites++;
  }
  if (key == '[' || key == '{') {
    if (siteList.length > 1) {
      addSites--;
      siteList = (Site[]) shorten(siteList);
    }  

  }

  if (key == 'f' || key == 'F') {
    if (toggleFrame) {
      toggleFrame = false;
    }
    else { 
      toggleFrame = true;
    }
  } 
}

/* =======================       Notes       ======================= */

/*
Set site location and add site to array.
Add to color array such that each site will have an associated color.
Perform pixel scan, check distance to each site.
On each pixel pass, sample and hold lowest distance value to sites.
Sample and hold index value where nearest site found. This corresponds
to i in iterative for loop.
Because we are stepping through the site array and noting which element
is the nearest, we have an index value that has a twin in the color array.
Set each pixel to the color associated with the nearest site.
*/
