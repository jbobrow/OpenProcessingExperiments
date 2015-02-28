
/*
 * Oops! A circle is actually a Word Shape. Sorry! =p
 */

WordShaper wordShaper = new WordShaper();
PFont font = createFont("sans", 1);
BBTreeBuilder bbTreeBuilder = new BBTreeBuilder();

int numNulls = 0;

class Circle {
  PVector loc;
  float rad;
  Shape wordShape;
  BBTree bbTree;
  color col;
  PVector target = new PVector(width/2, height/2);

  Circle(float x, float y, float rad) {
    this.loc = new PVector(x, y);
    this.rad = rad;
    
    float randomSize = 5 + random(60);
    float randomAngle = random(TWO_PI);
    int minShapeSize = 2;
    
    this.wordShape = wordShaper.getShapeFor("hello", font, randomSize, randomAngle, minShapeSize);
    
    this.bbTree = bbTreeBuilder.makeTree(this.wordShape, 1); // last arg = swelling
    this.col = color(220);
  }

  void draw() {
    
    Shape placedShape = AffineTransform.getTranslateInstance(loc.x, loc.y).createTransformedShape(wordShape);
    
    GeneralPath path2d = new GeneralPath(placedShape);

    Graphics2D g2 = ((PGraphicsJava2D)g).g2;

    g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
    g2.setPaint(new Color(col, true));
    g2.fill(path2d);
  }

  // returns: how many tries did I take this turn?
  int nudge(float temperature) {
    
    float maxDistanceForPointMass = 300.0 * distanceFromTarget();

    PVector origLoc = loc.get();
    int maxTries = ceil(100 * temperature * temperature);
    int tries = 0;
    while (tries < maxTries) {
      tries += 1;
      
      PVector nudge = getNudgeVector(temperature);
      float dist = maxDistanceForPointMass * random(temperature) / (rad * rad);
      nudge.mult(dist);

      loc.x = constrain(origLoc.x + nudge.x, 0, width);
      loc.y = constrain(origLoc.y + nudge.y, 0, height);

      if (!anyOverlaps(this, circles)) {
        return tries;
      }
      else {
        loc = origLoc.get();
      }
    }
    return tries;
  }

  PVector getNudgeVector(float temperature) {
    PVector dir = PVector.sub(target, loc);
    float angle = atan2(dir.y, dir.x);

    float dAngle = 1.2 * PI * temperature * (random(1) - 0.5);
    angle += dAngle;

    return new PVector(cos(angle), sin(angle));
  }

  PVector getRandomNudgeVector(float temperature) {
    // Random vector
    float dist = 300;
    float dir = random(TWO_PI);
    float dx = dist * cos(dir);
    float dy = dist * sin(dir);
    return new PVector(dx, dy);
  }

  boolean overlaps(Circle c) {
    wordcram.Timer setLoc = wordcram.Timer.start("setLocation");
    //return PVector.dist(loc, c.loc) < (rad + c.rad) * 0.5;
    this.bbTree.setLocation(round(loc.x), round(loc.y));
    c.bbTree.setLocation(round(c.loc.x), round(c.loc.y));  // TODO ick. for now, whatever.
    setLoc.stop();
    
    wordcram.Timer anyOverlaps = wordcram.Timer.start("overlaps");
    boolean thisOverlapsOther = this.bbTree.overlaps(c.bbTree);
    anyOverlaps.stop();
    
    return thisOverlapsOther;
  }

  float distanceFromTarget() {
    return PVector.dist(loc, target);
  }
}


