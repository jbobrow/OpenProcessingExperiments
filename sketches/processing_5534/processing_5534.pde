
final int NUM_PARTICLES = 2;
final int HEIGHT = 700, WIDTH = 700;
final float GRAV = 300;
final boolean MOUSE = true;
final boolean CONSTRAIN = true;

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
        x.add(x);
        x.sub(x2);
        x.add(f.x*dt*dt, f.y*dt*dt, 0);
        x2 = tmp;
        if (CONSTRAIN) {
            x.x = constrain(x.x, 0, WIDTH);
            x.y = constrain(x.y, 0, HEIGHT);
        }
    }

    public void draw() {
      //if (x.x < Float.POSITIVE_INFINITY == false){ x.set(x2); }     
        stroke(0); fill(240);
        ellipse(x.x, x.y, m, m);
    }
}

class MouseParticle extends Particle {
    public MouseParticle(float m) { super(new PVector(mouseX, mouseY), m); }
    public void update() { x.x = mouseX; x.y = mouseY; }
    public void draw() {
        stroke(200); fill(250);
        ellipse(x.x, x.y, m, m);
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

Particle[] particles;
MouseParticle mouse;
int prev_t;

void setup() {
    size(WIDTH, HEIGHT);
    smooth();

    particles = new Particle[NUM_PARTICLES];
    for (int i = 0; i < NUM_PARTICLES; ++i)
        particles[i] = new Particle(new PVector(random(WIDTH), random(HEIGHT)), random(20, 60));
    if (MOUSE) mouse = new MouseParticle(40);
    prev_t = millis();
}

void draw() {
    int t = millis();
    background(255);

    for (int i = 0; i < NUM_PARTICLES; ++i)
        particles[i].resetForce();

    for (int i = 0; i < NUM_PARTICLES - 1; ++i) {
        for (int j = i + 1; j < NUM_PARTICLES; ++j) {
            PVector f = calcForce(particles[i], particles[j]);
            if (collides(particles[i], particles[j])) {
                particles[i].subForce(f);
                particles[j].addForce(f);
            } else {
                particles[i].addForce(f);
                particles[j].subForce(f);
            }
        }
    }

    if (MOUSE) {
        mouse.update();
        for (int i = 0; i < NUM_PARTICLES; ++i) {
            PVector f = calcForce(particles[i], mouse);
            if (collides(particles[i], mouse))
                particles[i].subForce(f);
            else
                particles[i].addForce(f);
        }
    }

    for (int i = 0; i < NUM_PARTICLES; ++i) {
        particles[i].step((t - prev_t)/1000.);

        particles[i].draw();
        if (MOUSE) mouse.draw();
    }

    prev_t = t;
}


