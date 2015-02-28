
/*
 * Copyright (c) 2013 Thomas Sanchez Lengeling
 * 
 *  Codigo Generativo    codigenerativo.com
 * 
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */

Physics physics;
ChordsManger chords;

int numChords;
int numSteps;

void setup() {
  size(600, 600);
  smooth();

  physics = new Physics();
  chords = new ChordsManger();
  numChords = 23;
  numSteps  = 6;

  for (int i = 0; i < numChords; i++) {
    chords.add(new Chords(physics, numSteps));
  }
  //frameRate(30);
}

void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);

 // physics.update();
  // physics.drawPhysics();

  chords.drawAll();
  chords.update();

  fill(255);
  strokeWeight(1);
  text("frameRate: "+(int)frameRate, 10, 12);
  text("numChords: "+numChords, 10, 27);
  text("numSteps: "+numSteps, 10, 44);
}


/*
 * Copyright (c) 2013 Thomas Sanchez Lengeling
 * 
 *  Codigo Generativo    codigenerativo.com
 * 
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */
class Chords {
  Particle end;
  Particle start;

  int mSteps;
  float time;
  float timeStep;
  float amp;

  Physics physics;

  ArrayList p; //Particles
  ArrayList s; //Springs

  float angle;
  float dista;
  
  color c;
  float strokeW;
  float stepIter;

  Chords(Physics physics, int numSteps) {
    this.physics = physics;

    mSteps   = numSteps;
    time     = 0.0;
    timeStep = 0.041;//random(0.02, 0.05);
    amp      = random(3, 6);

    float x1 = 0;
    float y1 = height/2.0;
    float x2 = width;
    float y2 = height/2.0;

    start = new Particle(x1, y1);
    end   = new Particle(x2, y2);

    start.makeLocked();
    end.makeLocked();

    p  =  new ArrayList();
    s  =  new ArrayList();

    p.add(physics.makeParticle(start));
    for (int i = 1; i < (mSteps - 1); i++) {
      float px =  lerp(x1, x2, i/(float)(mSteps-1));
      float py =  lerp(y1, y2, i/(float)(mSteps - 1));
      p.add(physics.makeParticle( new Particle(px, py) ));
    }
    p.add(physics.makeParticle(end));

    dista  = dist(x1, y1, x2, y2)/(float)(mSteps-1);
    angle = PI+atan2(y2-y1, x2-x1 );

    for (int i = 0; i < (mSteps - 1); i++) {
      Particle p1 = (Particle)p.get(i);
      Particle p2 = (Particle)p.get(i+1);

      s.add( physics.makeSpring( new Spring(p1, p2, dista)));
    }
    
    c = getGoodColor();
    strokeW  = map(amp, 3, 6, 6, 1);
    stepIter = map(amp, 3, 6, 0.4, 0.7);
  }


  void display() {
    ArrayList handles = new ArrayList();
    for (int i = 0; i < mSteps; i++) {
      Particle pa = (Particle)p.get(i);

      handles.add( new PVector(pa.getX(), pa.getY()));
    }
    
    Spline2D spline=new Spline2D(handles);
    ArrayList vertices=spline.computeVertices(8);

    stroke(c);
    strokeWeight(strokeW);
    noFill();
    beginShape();
    for (int i=0; i < vertices.size();i++ ) {
      PVector v = (PVector)vertices.get(i);
      vertex(v.x, v.y);
    }
    endShape();

  }

  void update() {
    time += timeStep;

    for (int i = 1 ; i < (mSteps - 1); i++) {
      Particle p1 = (Particle)p.get(i);
      float x = amp*cos(i * stepIter + time)*sin(angle);
      float y = amp*sin(i * stepIter + time)*cos(angle);
      p1.position().add(x, y, 0.0);
    }
  }

  void setEndPos(float x, float y) {
    end.setPos(x, y);
  }
  
}


/*
 * Copyright (c) 2013 Thomas Sanchez Lengeling
 * 
 *  Codigo Generativo    codigenerativo.com
 * 
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */

class ChordsManger {
  ArrayList mChords;

  
  ChordsManger() {
    mChords = new ArrayList<Chords>();
  }

  void add(Chords c) {
    mChords.add(c);
  }

  void drawAll() {
    for (int i = 0; i < mChords.size(); i++) {
      Chords s = (Chords)mChords.get(i);
      s.display();
    }
  }


  void update() {
    for (int i = 0; i < mChords.size(); i++) {
      Chords s = (Chords)mChords.get(i);
      s.update();
    }
  }
}


/*
 * Copyright (c) 2013 Thomas Sanchez Lengeling
/* 
 *  Codigo Generativo    codigenerativo.com
 * 
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */

color[] colors = {
  #930000, #640505, #6F2C2C, #170000, #480909, #B9B9B9, #FFFAFA, #1A1818, #893E3E, 
  #FF0000, #4D4D4D, #A71414, #FF0303, #581616, #FAFAFA, #1A1818, #6F6868, #A01010, 
  #6F381C, #983934, #670500, #B4231B, #8B0A03, #B43F38, #E84E46, #D60B00, #FFA09B, 
  #5A2724, #AA2B24, #F5534A, #D1261E, #A50800, #B93029, #AA5D59, #A56D6B, #6A3C3A, 
  #A73D38, #7C110B, #9D120B, #D33129, #B43933, #AA5F5B, #816362, #796665, #4D4C4C
};

color getGoodColor() {
  return colors[(int)random(0, colors.length - 1)];
}

class Particle {
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float  mass;

  float damping;
  
  boolean free;

  Particle(float x, float y) {
    this.pos = new PVector(x, y);
    this.velocity = new PVector();
    this.acceleration = new PVector(0, 0.0);
    this.free = true;
    this.damping = 0.93;
    this.mass = 10;
  }

  void update() {
    if(free){
      velocity.add(acceleration);
      velocity.mult(damping);
      pos.add(velocity);
      acceleration.mult(0);
    }
  }
  
  void makeFree(){
    free = true;
  }
  
  void makeLocked(){
    free = false;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void drawParticle(){
    stroke(0);
    fill(100);
    ellipse(pos.x, pos.y, 10, 10);
  }
  
  float getX(){
    return pos.x;
  }
  
  float getY(){
    return pos.y;
  }
  
  PVector position(){
    return pos;
  }
  
  void setPos(float x, float y){
    pos.set(x, y);
  }
  
}

/*
 * Copyright (c) 2013 Thomas Sanchez Lengeling
 * 
 *  Codigo Generativo    codigenerativo.com
 * 
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */
 
class ParticleManager {
  ArrayList mParticles;

  ParticleManager() {
    this.mParticles = new ArrayList<Particle>();
  }

  void add(Particle p ) {
    mParticles.add(p);
  }

  void update() {
    for (int i = 0; i < mParticles.size(); i++) {
      Particle p =  (Particle)mParticles.get(i);
      p.update();
    }
  }

  void drawParticles() {
    for (int i = 0; i < mParticles.size(); i++) {
      Particle p =  (Particle)mParticles.get(i);
      p.drawParticle();
    }
  }
  
}

class Physics {
  ParticleManager particles;
  SpringManager   springs;

  Physics() {
    this.particles = new ParticleManager();
    this.springs   = new SpringManager();
  }

  void update() {
    particles.update();
    springs.update();
  }

  void drawPhysics() {
    particles.drawParticles();
    springs.drawSprings();
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  void addSpring(Spring s) {
    springs.add(s);
  }

  Particle makeParticle(Particle p) {
    particles.add(p);
    return p;
  }

  Spring makeSpring(Spring s) {
    springs.add(s); 
    return s;
  }
}


/*
 * Copyright (c) 2007 Karsten Schmidt
 * 
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */

class Spline2D {

  PVector[] vpoints;

  ArrayList<PVector> pointList = new ArrayList<PVector>();

  ArrayList<PVector> vertices;

  BernsteinPolynomial bernstein;

  PVector[] delta;

  PVector[] coeffA;

  float[] bi;

  float tightness;

  float invTightness;

  int numP;

  /**
   * @param rawPoints
   *            list of control point vectors
   */
  public Spline2D(ArrayList<PVector> rawPoints) {
    this( rawPoints, null, 0.25);
  }

  /**
   * @param rawPoints
   *            list of control point vectors
   * @param b
   *            predefined Bernstein polynomial (good for reusing)
   * @param tightness
   *            default curve tightness used for the interpolated vertices
   *            {@linkplain #setTightness(float)}
   */
  public Spline2D(ArrayList<PVector> rawPoints, BernsteinPolynomial b, 
  float tightness) {
    pointList.addAll(rawPoints);
    bernstein = b;
    setTightness(tightness);
  }

  public Spline2D add(float px, float py) {
    return add(new PVector(px, py));
  }

  /**
   * Adds the given point to the list of control points.
   * 
   * @param p
   * @return itself
   */
  public Spline2D add(PVector p) {
    pointList.add(p);
    return this;
  }

  /**
   * <p>
   * Computes all curve vertices based on the resolution/number of
   * subdivisions requested. The higher, the more vertices are computed:
   * </p>
   * <p>
   * <strong>(number of control points - 1) * resolution + 1</strong>
   * </p>
   * <p>
   * Since version 0014 the automatic placement of the curve handles can also
   * be manipulated via the {@linkplain #setTightness(float)} method.
   * </p>
   * 
   * @param res
   *            the number of vertices to be computed per segment between
   *            original control points (incl. control point always at the
   *            start of each segment)
   * @return list of Vec2D vertices along the curve
   */
  public ArrayList<PVector> computeVertices(int res) {
    updateCoefficients();

    res++;
    if (bernstein == null || bernstein.resolution != res) {
      bernstein = new BernsteinPolynomial(res);
    }
    if (vertices == null) {
      vertices = new ArrayList<PVector>();
    } 
    else {
      vertices.clear();
    }
    findCPoints();
    PVector deltaP = new PVector();
    PVector deltaQ = new PVector();
    res--;
    for (int i = 0; i < numP - 1; i++) {
      PVector p = vpoints[i];
      PVector q = vpoints[i + 1];
      deltaP.set(delta[i]);
      deltaP.add(p);
      deltaQ.set(q);
      deltaQ.sub(delta[i + 1]);
      for (int k = 0; k < res; k++) {
        float px =
          p.x * bernstein.b0[k] + deltaP.x * bernstein.b1[k]
          + deltaQ.x * bernstein.b2[k] + q.x
          * bernstein.b3[k];
        float py =
          p.y * bernstein.b0[k] + deltaP.y * bernstein.b1[k]
          + deltaQ.y * bernstein.b2[k] + q.y
          * bernstein.b3[k];
        vertices.add(new PVector(px, py));
      }
    }
    vertices.add(vpoints[vpoints.length - 1]);
    return vertices;
  }

  protected void findCPoints() {
    bi[1] = -tightness;
    coeffA[1].set( (vpoints[2].x - vpoints[0].x - delta[0].x) * tightness,
                    (vpoints[2].y - vpoints[0].y - delta[0].y) * tightness);

    for (int i = 2; i < numP - 1; i++) {
      bi[i] = -1 / (invTightness + bi[i - 1]);
      coeffA[i].set(-(vpoints[i + 1].x - vpoints[i - 1].x - coeffA[i - 1].x)* bi[i], 
          -1*(vpoints[i + 1].y - vpoints[i - 1].y - coeffA[i - 1].y)* bi[i]);
    }
    for (int i = numP - 2; i > 0; i--) {
      delta[i].set(coeffA[i].x + delta[i + 1].x * bi[i], 
          coeffA[i].y + delta[i + 1].y * bi[i]);
    }

  }

  /**
   * Sets the tightness for future curve interpolation calls. Default value is
   * 0.25. A value of 0.0 equals linear interpolation between the given curve
   * input points. Curve behaviour for values outside the 0.0 .. 0.5 interval
   * is unspecified and becomes increasingly less intuitive. Negative values
   * are possible too and create interesting results (in some cases).
   * 
   * @param tightness
   *            the tightness value used for the next call to
   *            {@link #computeVertices(int)}
   * @since 0014 (rev. 216)
   */
  void setTightness(float tightness) {
    this.tightness = tightness;
    this.invTightness = 1f / tightness;
    // return this;
  }

  public void updateCoefficients() {
    numP = pointList.size();
    if (vpoints == null || (vpoints != null && vpoints.length != numP)) {
      coeffA = new PVector[numP];
      delta = new PVector[numP];
      bi = new float[numP];
      for (int i = 0; i < numP; i++) {
        coeffA[i] = new PVector();
        delta[i] = new PVector();
      }
      setTightness(tightness);
    }
    vpoints =  ((ArrayList<PVector>)pointList).toArray(new PVector[0]);
  }
}

//BernsteinPolynomial
class BernsteinPolynomial {
  public float[] b0, b1, b2, b3;
  public int resolution;

  public BernsteinPolynomial(int res) {
    resolution = res;
    b0 = new float[res];
    b1 = new float[res];
    b2 = new float[res];
    b3 = new float[res];
    float t = 0;
    float dt = 1.0f / (resolution - 1);
    for (int i = 0; i < resolution; i++) {
      float t1  =  1 - t;
      float t12 = t1 * t1;
      float t2  =  t * t;
      b0[i] = t1 * t12;
      b1[i] = 3 * t * t12;
      b2[i] = 3 * t2 * t1;
      b3[i] = t * t2;
      t += dt;
    }
  }
}

class Spring {
  PVector anchor;

  float len;
  float k;

  Particle p1;
  Particle p2;

  Spring(Particle p1, Particle p2, float len) {
    this.p1 = p1;
    this.p2 = p2;
    this.len = len;
    k = 0.2;
  }

  void update() {
    PVector force = PVector.sub(p1.pos, p2.pos);
    float d  = force.mag();
    float strech  = d - len;
    force.normalize();
    force.mult(-1 * k * strech);
    p1.applyForce(force);
    force.mult(-1);
    p2.applyForce(force);
  }
  
  void setRestLength(float len){
   this.len = len; 
  }
  
  
  void drawSpring() {
    strokeWeight(2);
    stroke(0);
    line(p1.getX(), p1.getY(), p2.getX(), p2.getY());
  }

}

class SpringManager {
  ArrayList mSpring;

  SpringManager() {
    mSpring = new ArrayList<Spring>();
  }

  void add(Spring s ) {
    mSpring.add(s);
  }

  void update() {
    for (int i = 0; i < mSpring.size(); i++) {
      Spring s =  (Spring)mSpring.get(i);
      s.update();
    }
  }

  void drawSprings() {
    for (int i = 0; i < mSpring.size(); i++) {
      Spring s =  (Spring)mSpring.get(i);
      s.drawSpring();
    }
  }
}



