
/*
 * A random digital flame animation thing. Inspired by
 * some speakers. (http://www.youtube.com/watch?v=8asnz3E4n4o)
 * I can't believe I watched a random Ashens video at
 * 6 AM, couldn't bloody sleep, so I thought "dammit, I'm
 * going to bash out some Processing code".
 * Well, here is it anyway!
 *
 * v.1 - 2012-01-04
 *
 * (c) Urpo Lankinen 2012. Dual-licensed under GNU
 * General Public License 3 and Creative Commons
 * Attribution-Share Alike 3.0 Unported.
 */

class Spark {
  /// Location of the spark (stored in x and y fields)
  PVector loc;
  /// Velocity vector.
  PVector v;
  /// Remaining life of the particle. Set to maximum in init,
  /// considered dead if hits <=0.
  int life;
  public Spark() {
    loc = new PVector();
    loc.x = (int)random(width);
    loc.y = height;
    v = new PVector();
    float tinyUnit = (float)height/100.0;
    v.x = random(tinyUnit*0.8);
    v.x -= v.x/2.0;
    v.y = -random(tinyUnit*1.2);
    life = (int)random((float)height/20.0);
  }
  /// Update a particle's location.
  public void update() {
    // Less life.
    life--;
    if(life <= 0)
      return; // Optomatisation!
    // Move the bastard
    loc.add(v);
    // Fudge the velocity a little bit.
    float tinyUnit = (float)height/400.0;
    PVector fudge = new PVector();
    fudge.x = random(tinyUnit*0.2);
    fudge.x -= fudge.x / 2.0;
    fudge.y = random(tinyUnit*0.7);
    fudge.y -= fudge.y / 2.0;
    fudge.y = -fudge.y;
    v.add(fudge);
  }
  public boolean isDead() {
    return (life <= 0);
  }
}

int colourMode = 0;
int maxColourModes = 2;
int numberOfSparks = 200;
Spark[] sparks;

void draw() {
  // Update spark locations.
  for(int i = 0; i < numberOfSparks; i++) {
    sparks[i].update();
    if(sparks[i].isDead()) {
      sparks[i] = new Spark();
    }
  }

  background(0);
  int gridRows = height/20;
  int gridColumns = width/20;
  int gutter = 3;
  int sqW = (width/gridColumns)-(gutter*2);
  int sqH = (height/gridRows)-(gutter*2);
  for(int gridY = 0; gridY < gridRows; gridY++) {
    for(int gridX = 0; gridX < gridColumns; gridX++) {
      // Pick a colour mode.
      switch(colourMode) {
        case 0:
        default:
          // Gradient
          color a = color(20,0,0);
          color b = color(200,10,10);
          fill(lerpColor(a,b,
            (float)gridY / (float)gridRows));
          break;
        case 1:
          // Rainbow
          colorMode(HSB,100);
          //color rainA = color(0,100,100);
          //color rainB = color(100,100,100);
          color graysA = color(0,0,0);
          color graysB = color(0,0,60);
          // Ugly hack version
          color rain = color(
            (int)(((float)gridX / (float)gridColumns) * 100.0),
            100,100);
          // Derp derp, this lerp won't work.
          /*color rain = lerpColor(rainA,rainB,
            (float)gridX / (float)gridColumns);*/
          color grays = lerpColor(graysA,graysB,
            (float)gridY / (float)gridRows);
          fill(blendColor(rain,grays,SUBTRACT));
          colorMode(RGB);
          break;
        case 2:
          // Random colour
          fill((int)random(255),
            (int)random(255),
            int(random(255)));
          break;
      }
      // Square's coordinates.
      int ax = (width/gridColumns*gridX)+gutter;
      int ay = (height/gridRows*gridY)+gutter;
      int bx = ax + sqW;
      int by = ay + sqH;
      
      // Check all sparks if they happen to be in this square.
      boolean lit = true;
      for(int s = 0; s < numberOfSparks; s++) {
        if(sparks[s].loc.x >= ax &&
          sparks[s].loc.x <= bx &&
          sparks[s].loc.y >= ay &&
          sparks[s].loc.y <= by) {
          lit = false;
          continue;
        }
      }
      // Finally, if so inclined, draw a rectangle.
      if(lit)
        rect(ax,ay,sqW,sqH);
    }
  }
  return;
}

// Mouse clicks just change the colour mode.
void mouseClicked() {
  colourMode++;
  if(colourMode > maxColourModes)
    colourMode = 0;
}

void setup() {
  frameRate(25);
  size(640,480,JAVA2D);
  sparks = new Spark[numberOfSparks];
  for(int i = 0; i < numberOfSparks; i++) {
    sparks[i] = new Spark();
  }
}


