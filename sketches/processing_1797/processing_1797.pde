
import megamu.shapetween.*;
import java.util.*;

Tween tweener;
BezierTile[] bt;
BezierTile[] bt2;

float tile_size;
float tile_size2;

void setup() {
  size(800,800);
  frameRate(30);
  background(0);

  // build two sets of tiles, one with smaller size  
  tile_size = width / 10;
  tile_size2 = width / 5;

  // 5-second cycle
  tweener = new Tween(this, 5, Tween.SECONDS);
  tweener.repeat();
  tweener.start();

  // 
  // init the tiles
  //
  bt = new BezierTile[100];
  bt2 = new BezierTile[25];
  
  for ( int y = 0; y < 10; y++ ) {
    for ( int x = 0; x < 10; x++ ) {
      bt[y*10 + x] = new BezierTile(tweener, x*tile_size, y*tile_size, tile_size, tile_size);
      bt[y*10 + x].fade_rate = 10;
    }
  }

  for ( int y = 0; y < 5; y++ ) {
    for ( int x = 0; x < 5; x++ ) {
      bt2[y*5 + x] = new BezierTile(tweener, x*tile_size2, y*tile_size2, tile_size2, tile_size2);
      bt2[y*5 + x].fade_rate = 10;
    }
  }
}

void draw() {
  // use black with low alpha to slowly fade out previous render
  fill(0, 5);
  rect(0, 0, width, height);

  for ( int x = 0; x < 100; x++ ) {
    bt[x].draw();
  }
  for ( int x = 0; x < 25; x++ ) {
    bt2[x].draw();
  }
}

class BezierTile {
  float anchorStart;
  float anchorEnd;
  float[] points;
  float[] radii;
  Tween tweener;

  float tile_width, tile_height;
  float drawX, drawY;
  float offset;
  int direction = 1;
  float fade_rate = 0;

  public BezierTile(Tween t) {
    this(t, 0, 0, width, height);
  }
  
  public BezierTile(Tween t, float x, float y, float w, float h) {
    tweener = t;
    tile_width = w;
    tile_height = h;
    drawX = x;
    drawY = y;
      anchorStart = random(0, 1);
    anchorEnd = anchorStart + 0.5;
    init();
  }

  public BezierTile(Tween t, float x, float y, float w, float h, float s, float e) {
    tweener = t;
    tile_width = w;
    tile_height = h;
    drawX = x;
    drawY = y;
    anchorStart = s;
    anchorEnd = e;
    init();
  } 
  
  void init() {
    points = randomArray(12, tile_width/5, tile_height*4/5);
    radii = randomArray(12, tile_height/-10, tile_height/10);
    offset = random(0, 10);
    if ( random(0, 1) < 0.5 ) {
     direction = -1; 
    }
  }

  void draw() {
    noFill();
    beginShape();

    PVector start = vectorAtRect(tile_width, tile_height, 1, anchorStart);
    PVector anchor = vectorAtEllipse(tile_width, tile_height, 1, tweener.position() * direction + offset);
    PVector end = vectorAtRect(tile_width, tile_height, 1, anchorEnd);

    stroke(noise(drawX + start.x, drawY + start.y) * 255,
        noise(drawX + anchor.x, drawY + anchor.y) * 255,
        noise(drawX + end.x, drawY + end.y) * 255
      );

    vertex(drawX + start.x, drawY + start.y);

    bezierVertex(
            drawX + points[0]+radii[0] + anchor.x,
            drawY + points[0]+radii[1] + anchor.y,

            drawX + (points[0]+radii[2]) + anchor.x,
            drawY + (points[0]+radii[3]) + anchor.y,

            points[0] + drawX + anchor.x,
            points[0] + drawY + anchor.y
             );

    vertex(drawX + end.x, drawY + end.y);
    endShape();
  }

    public PVector vectorAtEllipse(float w, float h, float d, float t) {
    	// allow time to wrap around the duration 
    	t = t % d;

    	// figure out what portion of the ellipse has been traversed so far
    	float angle = processing.core.PApplet.lerp(0, processing.core.PApplet.PI * 2, t / d );

    	float x = w * processing.core.PApplet.cos(angle) / 2;
    	float y = h * processing.core.PApplet.sin(angle) / 2;
    	float z = 0;

    	return new PVector(x, y, z);
  }

  PVector vectorAtRect(float w, float h, float d, float t) {
    // allow time to wrap around the duration 
    t = t % d;

    // then figure out what percentage of the rect we've traversed
    t = t * (w*2+h*2);

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

  public float[] randomArray(int count, float low, float high) {
    float tmp[] = new float[count];
    for(int i = 0; i< count; i++ ) {
      tmp[i] = random(low, high);
    }
    return tmp;
  }
  
}


