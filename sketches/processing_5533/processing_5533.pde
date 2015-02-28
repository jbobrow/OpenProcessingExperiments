
final int NUM_PARTICLES = 10;
final int HEIGHT = 700, WIDTH = 700;
final float GRAV = 900;
final boolean MOUSE = false;
final boolean CONSTRAIN = true;
final float DAMPING = 0.01;
final float RINGMASS = 3;

class Particle {
    public PVector x, x2, f; // pos, old pos, force
    public float m; // mass (m/2 is the radius)

    public Particle(PVector x_, float m_) {
        x = x_; m = m_; f = new PVector();
        x2 = x.get();
    }

    public void resetForce() { f.x = 0; f.y = 0; }
    public void addForce(PVector f_) { f.add(f_); }
    public void subForce(PVector f_) { f.sub(f_); }

    // verlet integration
    public void step(float dt) {
        PVector tmp = x.get();
        x.add(PVector.mult(x, 1.-DAMPING));
        x.sub(PVector.mult(x2, 1.-DAMPING));
        x.add(f.x*dt*dt, f.y*dt*dt, 0);
        x2 = tmp;
        if (CONSTRAIN) {
            x.x = constrain(x.x, 0, WIDTH);
            x.y = constrain(x.y, 0, HEIGHT);
        }
    }

    public void draw() { 
        stroke(0); fill(240); strokeWeight(1);
        ellipse(x.x, x.y, m, m);
    }
}

class Ring {
    public PVector x;
    public float r, m;
    public Ring(PVector x_, float r_, float m_) { x = x_; r = r_; m = m_; }

    public PVector calcForce(Particle p) {
        // force exerted on p by the ring
        PVector f = PVector.sub(x, p.x); f.normalize();
        float k = GRAV * p.m * m;
        float l = r - sqrt(sq(p.x.x-x.x) + sq(p.x.y-x.y)), l2 = 2.*r - sqrt(l);
        f.mult(k/l - k/sq(l2));
        return f;
    }

    public void draw() {
        stroke(0); fill(251); strokeWeight(5);
        ellipse(x.x, x.y, r*2, r*2);
    }
}

PVector calcForce(Particle a, Particle b) {
    PVector f = PVector.sub(b.x, a.x); f.normalize();
    f.mult(GRAV * a.m * b.m / (sq(a.x.x - b.x.x) + sq(a.x.y - b.x.y)));
    return f;
}

boolean collides(Particle a, Particle b) {
    return sq(a.x.x - b.x.x) + sq(a.x.y - b.x.y) <= sq(a.m/2. + b.m/2.);
}

ArrayList particles;
Ring ring;
int prev_t;

void setup() {
    size(WIDTH, HEIGHT);
    smooth();

    particles = new ArrayList();
    ring = new Ring(new PVector(WIDTH/2, HEIGHT/2), min(WIDTH, HEIGHT)/2. * 0.8, RINGMASS);
    prev_t = millis();
}

void mousePressed() {
    particles.add(new Particle(new PVector(mouseX, mouseY), 30));
}

void keyPressed() {
    switch (key) {
    case ' ':
        PVector f = new PVector();
        for (int i = 0; i < particles.size(); ++i) {
            Particle p = (Particle) particles.get(i);
            f.x = random(-1, 1)*GRAV*10; f.y = random(-1, 1)*GRAV*10;
            p.addForce(f);
        }
        break;
    case 'c':
        particles.clear();
        break;
    }
}

void draw() {
    int t = millis();
    background(255);

    for (int i = 0; i < particles.size() - 1; ++i) {
        for (int j = i + 1; j < particles.size(); ++j) {
            Particle p1 = (Particle) particles.get(i), p2 = (Particle) particles.get(j);
            PVector f = calcForce(p1, p2);
            p1.subForce(f); p2.addForce(f);
        }
    }

    for (int i = 0; i < particles.size(); ++i) {
        Particle p = (Particle) particles.get(i);
        p.addForce(ring.calcForce(p));
    }

    ring.draw();
    
    for (int i = 0; i < particles.size(); ++i) {
        Particle p = (Particle) particles.get(i);
        p.step((t - prev_t)/1000.);
        p.draw();
    }

    for (int i = 0; i < particles.size(); ++i)
        ((Particle) particles.get(i)).resetForce();
    
    prev_t = t;
}


