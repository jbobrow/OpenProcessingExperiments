
int b, d;
var selected, p;
ArrayList<Particle> particles;

void setup() {
    size(800, 800);
    b = 100;
    d = 20;
    particles = new ArrayList<Particles>();
    for (int i = 0; i < 25; i++) {
        particles.add(new Particle(randPos(b), randPos(b)));
    }
    noStroke();
    fill(0);
}

void mousePressed() {
    for (int i = particles.size()-1; i >= 0; i--) {
        p = particles.get(i);
        if (dist(p.x, p.y, mouseX, mouseY) < (d/2)+1) {
            if (mouseButton == LEFT) {
                selected = p;
                particles.remove(i);
                particles.add(p);
                return;
            } else if (mouseButton == RIGHT) {
                particles.remove(p);
                return;
            }
        }
    }
    
    if (mouseButton == RIGHT) {
        particles.add(new Particle(mouseX, mouseY));
    }
}

int randPos(int b) {
    return b + random(width-2*b);
}

void mouseReleased() {
    selected = false;
}

void draw() {
    background(255);
    for (Particle p : particles) {
        p.draw();
    }
    
    if (selected) {
        selected.x = mouseX;
        selected.y = mouseY;
    }
}

class Particle {
    int x;
    int y;
    
    color c;
    
    Particle(int x, int y) {
        this.x = x;
        this.y = y;
        
        c = color(random(255), random(255), random(255));
    }
    
    void draw() {
        fill(this.c);
        ellipse(this.x, this.y, d, d);
    }
}
