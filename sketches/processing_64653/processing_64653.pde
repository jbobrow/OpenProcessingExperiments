
//Custom circle class
class BreakCircle {
  ArrayList <Polygon2D> polygons = new ArrayList <Polygon2D> ();
  Voronoi voronoi; //Breaking function from toxiclibs library
  FloatRange xpos, ypos;
  PolygonClipper2D clip;
  float[] moveSpeeds;
  Vec2D pos, impact;
  float radius;
  int transparency;
  int start;
  float weight;
  float initial;
  VerletParticle2D vp;
  AttractionBehavior abh;
  boolean broken;

  BreakCircle(Vec2D pos, float radius, float weight, float initial) {
    this.pos = pos;
    this.radius = radius;
    this.weight = weight;
    this.initial = initial;
    //Loading toxiclibs particles and behaviors
    vp = new VerletParticle2D(pos);
    abh = new AttractionBehavior(vp, radius*2.5 + max(0,50-radius), -1.2f, 0.01f);
    physics.addParticle(vp);
    physics.addBehavior(abh);
  }

  void run() {
    //Regular (not broken) circles
    if (!broken) {
      moveVerlet();
      displayVerlet();
      checkBreak();
    //If the circle is broken
    } else {
      moveBreak();
      displayBreak();
    }
  }

  //Sets position based on the particle in the toxiclibs physics system
  void moveVerlet() {
    pos = vp;
  }

  //Display circle
  void displayVerlet() {
    fill(255);
    stroke(0);
    strokeWeight(weight);
    gfx.circle(pos,radius*2);
    strokeWeight(2);
    noStroke();
  }

  //If the mouse is pressed on a circle, it will be broken
  void checkBreak() {
    if (mouse.isInCircle(pos,radius) && mousePressed || frameCount - initial > 1000 && random(1000.0) < 0.5) {
      //Remove particle + behavior in the physics system
      physics.removeParticle(vp);
      physics.removeBehavior(abh);
      //Sets the point of impact...
      if (mousePressed){impact = mouse;} //to the mouse
      else{impact = pos;} //to the center
      initiateBreak();
    }
  }

  void initiateBreak() {
    broken = true;
    transparency = 255;
    start = frameCount;
    //Create a voronoi shape from the toxiclibs library
    //All "voronoi code" is NOT my own. Obtained from toxiclibs.org API and tutorials
    voronoi = new Voronoi();
    xpos = new BiasedFloatRange(pos.x-radius, pos.x+radius, impact.x, 0.333f);
    ypos = new BiasedFloatRange(pos.y-radius, pos.y+radius, impact.y, 0.5f);
    clip = new SutherlandHodgemanClipper(new Rect(pos.x-radius, pos.y-radius, radius*2, radius*2));
    addPolygons();
    addSpeeds();
  }

  void addPolygons() {
    //Adds random points (more towards point of impact) to the voronoi shape
    for (int i=0; i<numPoints; i++) {
      voronoi.addPoint(new Vec2D(xpos.pickRandom(), ypos.pickRandom()));
    }
    //Creates polygons from voronoi points
    for (Polygon2D poly : voronoi.getRegions()) {
      poly = clip.clipPolygon(poly);
      for (Vec2D v : poly.vertices) {
        if (!v.isInCircle(pos,radius)) {
          clipPoint(v);
        }
      }
      polygons.add(new Polygon2D(poly.vertices));
    }
  }

  void addSpeeds() {
    //Creates random speeds for all polygons
    moveSpeeds = new float[polygons.size()];
    for (int i=0; i<moveSpeeds.length; i++) {
      moveSpeeds[i] = random(minSpeed,maxSpeed);
    }
  }

  //Moves polygons away from the point of impact
  void moveBreak() {
    for (int i=0; i<polygons.size(); i++) {
      Polygon2D poly = polygons.get(i);
      Vec2D centroid = poly.getCentroid();
      Vec2D targetDir = centroid.sub(impact).normalize();
      targetDir.scaleSelf(moveSpeeds[i]);
      for (Vec2D v : poly.vertices) {
        v.set(v.addSelf(targetDir));
      }
    }
  }

  //Draw the polygons (breaks)
  void displayBreak() {
    // after 12 frames, start decreasing the transparency
    if (frameCount-start > 12) { transparency -= 7; }
    fill(255,transparency);
    for (Polygon2D poly : polygons) {
      gfx.polygon2D(poly);
    }
  }

  void clipPoint(Vec2D v) {
    v.subSelf(pos);
    v.normalize();
    v.scaleSelf(radius);
    v.addSelf(pos);
  }
}


