
int numDudes = 20;
int numTargets = 2;
float speed = 10;
int fps = 60;

// a dude (or dudette)
class Dude {
  PVector pos = new PVector();  // position
  color col;  // color
  int[] targets = new int[numTargets];  // array of target indices
}

// array of dudes
Dude[] dudes = new Dude[numDudes];

void reset() {
  background(0);

  for (int i=0; i<numDudes; i++) {
    Dude d =  dudes[i] = new Dude();

    // random position
    d.pos.set( random(0, width), random(0, height), 0);

    // random color
    d.col = color(random(0, 255), random(0, 255), random(0, 255));

    // pick a bunch of random targets (which isn't it self)
    for (int j=0; j<numTargets; j++) {
      int ti = floor(random(0, numDudes-2));
      if (ti >= i) ti++;
      d.targets[j] = ti;
      println("Dude " + i + " Target " + j + " : " + ti);
    }
  }
}

void setup() {
  size(800, 800);
  frameRate(fps);
  reset();
}

void draw() {
  //background(0);
  for (int i=0; i<numDudes; i++) {
    Dude d = dudes[i];
    fill(d.col);
    stroke(d.col);

    // draw circle for dude
    strokeWeight(1);
    ellipse(d.pos.x, d.pos.y, 20, 20);

    // calculate average target position
    PVector avgTarget = new PVector();
    for (int j=0; j<numTargets; j++) {
      Dude target = dudes[ d.targets[j] ];

      if (d.pos.x < 0) d.pos.x = 0;
      else if (d.pos.x > width) d.pos.x = width;

      if (d.pos.y < 0) d.pos.y = 0;
      else if (d.pos.y > height) d.pos.y = height;

      // draw line to connect to targets
      line(d.pos.x, d.pos.y, target.pos.x, target.pos.y);
      avgTarget.x += target.pos.x;
      avgTarget.y += target.pos.y;
    }

    avgTarget.mult(1.0/numTargets);

    // draw average target
    strokeWeight(1);
    ellipse(avgTarget.x, avgTarget.y, 10, 10);

    // vector between targets
    PVector diff = PVector.sub(dudes[d.targets[0]].pos, dudes[d.targets[1]].pos);
    diff.normalize();

    // perpendicular vector (rotate 90 degrees)
    PVector perp = new PVector(diff.y, -diff.x);
    
    // distance to target0
    float d1 = PVector.dist(d.pos, dudes[d.targets[0]].pos);
    
    // distance to target1
    float d2 = PVector.dist(d.pos, dudes[d.targets[1]].pos);
    
    // calculate distance
    float targetDist = min(d1, d2);
    
    // scale perpendicular
    perp.mult(targetDist);

    // targetPos, add to target average
    PVector targetPos = PVector.add(avgTarget, perp);
    
    // distance to targetPos
    PVector distTarget = PVector.sub(targetPos, d.pos);
    distTarget.normalize();

    distTarget.mult(speed);
    d.pos.add(distTarget);
  }
}

void keyPressed() {
  reset();
}
