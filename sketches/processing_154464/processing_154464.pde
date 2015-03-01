
/*
 * KnowlesianMotion - a processing sketch by Martin Herbert - 28 June 2104
 *
 * Web: martinherbert.com  mail: info@martinherbert.com
 *
 * KnowlesianMotion is a simple model of the process used in Tim Knowles' Tree Drawings
 * (http://www.timknowles.co.uk/Work/TreeDrawings/tabid/265/Default.aspx). In its simplest
 * form it just takes a 'pen' for a random walk, the point getting larger the longer it stays
 * in approximately the same position as the 'ink' soaks into the 'paper'.
 * The successive points are calculated using gaussian distribution around the 'home' position
 * to approximate to the effect of the tree branch 'stiffness' tending to keep the pen centred.
 *
 */

boolean debug = false;

PImage bgImage;  // display window to accumulate the image.
color ink = color(85, 62, 18, 50);

float homex, homey, x, y, lastx, lasty;  // start, new and old positions
float dx, dy;
float blotsize = 4;
float start_size = 3;
float size_offset = blotsize*10;

void setup() {
  size(600, 600);
  frameRate(20);
  // blendMode(BLEND);
  
  // initial position
  homex=width/2; homey=height/2;
  x=homex; y=homey;
  lastx=homex; lasty=homey;
  dx = 0; dy = 0;
  
  // initialise background, with the first blot in place
  bgImage = createImage(width, height, RGB);
  background(255);
  noStroke();
  fill(ink);
  ellipse(x, y, blotsize, blotsize);  
  loadPixels();
  bgImage.loadPixels();
  bgImage.pixels = pixels;
  bgImage.updatePixels();
  
}

void draw() {
  
  background(bgImage);
  /* fade over time (as the ink dries) to keep it dynamic
  fill(255, 2);
  noStroke();
  rect(0,0,width,height);
  */
    
  lastx=x; lasty=y;
  
  // get a new position, weighted to be close to the old one
  dx=randomGaussian()*blotsize*3;
  dy=randomGaussian()*blotsize*3;
  x=x+dx; y=y+dy;
  
  // if it's too far away, snap it back towards the home position (the wind drops!)
  if ( x<0 || x>width || y<0 || y>height ) {
    x = homex + randomGaussian()*width/5;
    y = homey + randomGaussian()*width/5;
  }

  // if new position is within the diameter of the old one, randomly increase the size, otherwise reset it
  if ( dist(x,y, lastx, lasty) < (blotsize + size_offset) ) {
    if (random(0, 1) < 1) blotsize++;
  }
  else {  // otherwise, reset it
    blotsize = start_size;
  }
  
  // draw a line to the new position, and the new blot
  strokeWeight(1);
  stroke(ink);
  
  if (debug) println("lastx: ", lastx, " lasty: ", lasty, " x: ", x, " y: ", y );
  
  // line(lastx, lasty, x, y);
  connect(lastx, lasty, x, y);
  noStroke();
  fill(ink);
  ellipse(x, y, blotsize, blotsize);
  
  // bake in the image
  loadPixels();
  bgImage.loadPixels();
  bgImage.pixels = pixels;
  bgImage.updatePixels();
    
}

void connect(float x1, float y1, float x2, float y2) {
  strokeWeight(1);
  
  float dx = x2 - x1;
  float dy = y2 - y1;
  float rot_angle = atan(dy/dx);
  if (dx<0) rot_angle += PI;
  int count = (int)dist(x1, y1, x2, y2);
  
  float[] y_points;
  y_points = new float[count];
  float nspace = random(0, 5);
  
  for ( int i=0; i<count; i++ ) {
    y_points[i] = noise(nspace) * 20 * sin((float)i/count*PI * (count%2==1 ? 1 : -1));
    nspace += 0.02;
  }
  
  pushMatrix();
  translate(x1, y1);
  rotate(rot_angle);
  for ( int i=0; i<count-1; i++ ) {
    strokeWeight(1+abs(y_points[i+1]-y_points[i]));
    line(i, y_points[i], i+1, y_points[i+1]);
  }
 popMatrix(); 
   
}

void keyPressed() {
  if ( key == 's' ) saveFrame("MH_KM_####.jpg");
}


