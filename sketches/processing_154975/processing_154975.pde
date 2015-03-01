
ArrayList<Particle> particles;
int numParticles;
int minDistance;

public void setup() {
    size(800, 800);
    background(20);
    smooth();
    
    int min = 100;
    
    particles = new ArrayList();
    numParticles = 50;
    minDistance = 150;

    for (int i = 0; i < numParticles; i++) {
        Particle p = new Particle(random(min, width - min), random(min, height - min), 5); 
        particles.add(p);
        p.update();
    }
}

void mouseClicked() {
    setup();
}

void draw() {
    background(20);

    for (Particle p1 : particles) {
        for (Particle p2 : particles) {
            if (p1 != p2) {
                float distance = dist(p1.x, p1.y, p2.x, p2.y);
              
                if (distance < minDistance) {
                    stroke(color(255, 0, 0), 255-((distance/minDistance)*255));
                    strokeWeight(1);
                    line(p1.x, p1.y, p2.x, p2.y);
                }
            }
        }
    }
    
    for (Particle p : particles) {
        p.draw();
        p.update();
    }
}
class Particle {
    float px, py;
    float x, y;
    float rx, ry;
    float rT;
    float size;
    
    Particle(float x, float y, float size) {
        this.px = x;
        this.py = y;
        this.size = size;
        this.rx = random(20, 100);
        this.ry = this.rx;
        if (random(100) < 50) {
            rx *= -1;
        }
        this.rT = random(500, 5000);
    }
    
    void update() {
        float t = millis()/rT;
        x = (int)(px + rx * cos(t));
        y = (int)(py + ry * sin(t));
    }
    
    void draw() {
        noStroke();
        fill(200);
        ellipse(x, y, size, size);
    }
}


