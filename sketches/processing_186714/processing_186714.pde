
int d;
float t;

ArrayList particles;

void setup() {  //setup function called initially, only once
    size(800, 800);
    noStroke();
    d = 400;
    particles = new ArrayList();
    //particles.add(new Particle(400, 400, 250, 10, 0));
    
    for (int i = 0; i < 5000; i++) {
        particles.add(new Particle(400-20+random(20), 400-20+random(20), random(20)+200-10, random()+0.2, random()*TWO_PI));
        //particles.add(new Particle(400-50+(20*((int)random(5))), 400-50+(20*((int)random(5))), random(20)+200-10, random()+0.2, random()*TWO_PI));
    }
    
}

void draw() {
    t = millis()/1000;
    
    fill(255, 255, 255, 64);
    rect(0, 0, width, height);
    
    
    fill(0);
    for (Particle p : particles) {
        p.draw();
    }
    fill(255);
    ellipse(width/2, height/2, d, d);
}

class Particle {
    int x;
    int y;
    int r;
    float v;
    float o;
    
    Particle(int x, int y, int r, float v, float o) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.v = v;
        this.o = o;
    }
    
    void draw() {
        rect(sin(t+cos(t/100)*o)*20+sin((v*t)+o)*r+x, cos(t+sin(t/1000)*o)*20+cos((v*t)+o)*r+y, 1, 1);
        //ellipse(700, 700, 3, 3);
    }
}
