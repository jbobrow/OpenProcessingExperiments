
/**
 *
 * Some initial experiments with Truchet tiles, this generates a tile made from bezier curves, with endpoints placed such that they should match up with 
 * other tiles around them.  It's fairly crude but comes up with some interesting patterns.  There's a few controls:
 * 'f' - turn on/off fill mode.  If on, the bezier curves will be filled, if not they won't.
 * 'a' - turn on/off alpha mode.  If on, a random alpha value will be added when rendering.  If not, the beziers are layered on top of each other
 * '+/-' - increase/decrease the number of curves by 10
 *
 * any other key will generate a new tile and draw it
 *
 *
 */
float tile_size;
boolean useFill = true;
boolean useAlpha = true;
BezierTile foo;
int NUMBER_OF_POINTS = 10;

void setup() {
  size(800,800);
  strokeCap(PROJECT);
  smooth();
  frameRate(30);

  reset();
}

void reset() {

  tile_size = width / 5;

  foo = new BezierTile(tile_size);
  redraw();
}

void redraw() {
  background(0);
  for ( int x = 0; x < width; x += tile_size ) {
    for ( int y = 0; y < width; y += tile_size ) {
      foo.drawAt(x, y, tile_size);
    }
  }
}

void draw() {

}


void keyPressed() {
  if ( key == 'a' ) {
    useAlpha = ! useAlpha;     
    redraw();
  }
  else if ( key == 'f' ) {
    useFill = ! useFill;
    redraw();
  }
  else if ( key == '+' || key == '=' ) {
    NUMBER_OF_POINTS += 10;
    reset();
  }
  else if ( key == '-' || key == '_' ) {
    if ( NUMBER_OF_POINTS > 10) {
       NUMBER_OF_POINTS -= 10;
    }
    reset();
  }
  else {
    reset();
  }
}

class BezierTile {
  PVector[] endpoints;
  PVector[] controls;
  PVector[] midpoints;
  PVector[] midcontrols;
  PVector[] colors;
  int[] strokeWidths;
  float[] alphas;

  float tile_width, tile_height;
  float drawX, drawY;

  int count = NUMBER_OF_POINTS;

  public BezierTile(float w) {
    tile_width = w;
    tile_height = w;

    endpoints = new PVector[count];
    controls = new PVector[count];
    colors = new PVector[count];
    strokeWidths = new int[count];
    alphas = new float[count];

    midpoints = new PVector[count];
    midcontrols = new PVector[count];

    for ( int i = 0; i < count; i += 2 ) {
      float tmpPos = random(0,tile_width*2);
      endpoints[i] = vectorAtRect(tile_width, tile_height, tmpPos);

      // mirror this endpoint
      if ( endpoints[i].y > 0 ) {
        endpoints[i+1] = new PVector(0, endpoints[i].y);
      }
      else {
        endpoints[i+1] = new PVector(endpoints[i].x, tile_height);
      }

      controls[i] = new PVector(random(0, tile_width), random(0, tile_width), random(0, tile_width));
      controls[i+1] = new PVector(random(0, tile_width), random(0, tile_width), random(0, tile_width));

      midpoints[i] = new PVector(random(0, tile_width), random(0, tile_width), random(0, tile_width));
      midpoints[i+1] = new PVector(random(0, tile_width), random(0, tile_width), random(0, tile_width));
      midcontrols[i] = new PVector(random(0, tile_width), random(0, tile_width), random(0, tile_width));
      midcontrols[i+1] = new PVector(random(0, tile_width), random(0, tile_width), random(0, tile_width));
    }

    shuffle(endpoints);

    for ( int i = 0; i < count; i += 1 ) {
      colors[i] = new PVector(random(0, 255), random(0, 255), random(0, 255));
      alphas[i] = random(0, 255);
      strokeWidths[i] = (int)random(0, 4);
    }
    shuffle(colors);

  }

  // not symmetric, but close enough 
  void shuffle(PVector[] array) { 
    for(int i = 0; i < array.length; i++) { 
      PVector temp = array[i]; 
      int toSwitch = (int) random(array.length); 
      array[i] = array[toSwitch]; 
      array[toSwitch] = temp; 
    } 
  } 

  void drawAt(float drawX, float drawY, float size) {

    if ( useFill == false ) {
      noFill();
    }

    for ( int i = 0; i < count; i += 2 ) {
      float tmpAlpha;
      if ( useAlpha == true ) {
        tmpAlpha = alphas[i];
      }
      else {
        tmpAlpha = 255;        
      }
      if ( useFill == true ) {
        fill(colors[i].x, colors[i].y, colors[i].z, tmpAlpha);
      }
      else {
        stroke(colors[i].x, colors[i].y, colors[i].z, tmpAlpha);
        strokeWeight(strokeWidths[i]);
      }

      float middleX = drawX + (size)/2;
      float middleY = drawY + (size)/2;

      beginShape();
      vertex(drawX + endpoints[i].x, drawY + endpoints[i].y);

      bezierVertex(drawX + controls[i].x, drawY + controls[i].y,
      drawX + controls[i+1].x, drawY + controls[i+1].y,
      drawX + endpoints[i+1].x, drawY + endpoints[i+1].y);

      bezierVertex(drawX + midcontrols[i].x, drawY + midcontrols[i].y,
      drawX + midcontrols[i+1].x, drawY + midcontrols[i+1].y,
      drawX + midpoints[i+1].x, drawY + midpoints[i+1].y);

      bezierVertex(middleX, middleY,middleX, middleY,middleX, middleY);

      bezierVertex(drawX + controls[i].x, drawY + controls[i].y,
      drawX + controls[i+1].x, drawY + controls[i+1].y,
      drawX + endpoints[i+1].x, drawY + endpoints[i+1].y);

      endShape();
    }
  }

  PVector vectorAtRect(float w, float h, float t) {
    // allow time to wrap around the duration 
    t = t % (w*2+h*2);

    PVector tmp = new PVector();
    if ( t < w ) {
      tmp.x = t;
      tmp.y = 0; 
    }
    else if ( t < w+h ) {
      tmp.x = w;
      tmp.y = t - w;
    }
    else if ( t < w*2+h ) {
      tmp.x = w - (t-w-h);
      tmp.y = h;
    }
    else {
      tmp.x = 0;
      tmp.y = w*2+h*2 - t;
    }
    return tmp;
  }

}



