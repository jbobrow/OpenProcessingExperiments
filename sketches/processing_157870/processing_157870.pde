
int n;

ArrayList<Particle> particles;

int oX;
int oY;

float v;

void setup() {
    size(800, 800);
    background(255);
    
    particles = new ArrayList();
    
    for (int i = 0; i < 500; i++) {
        particles.add(new Particle(random(250, 550), random(250, 550)));   
    }
    
    
    
    v = 2;
}

void draw() {
    background(255);
    
    oX = 0;
    oY = 0;
    for (Particle p : particles) {
        oX += p.x;
        oY += p.y
    }
    oX = ((oX/particles.size())+mouseX)/2;
    oY = ((oY/particles.size())+mouseY)/2;
    
    

    for (Particle p : particles) {
        p.move();
        p.draw();
    }
}

class Particle {
    float x;
    float y;
    
    float vX;
    float vY;
    
    float t;
    
    Particle(float x, float y) {
        this.x = x;
        this.y = y;
        this.t = random(TWO_PI);
    }
    
    void move() {
        if (x <= 0 || x >= 800 || y <= 0 || y >= 800) t += PI;
        
         //else t += 0.2-random(0.4);
        float dX = x - oX;
        float dY = y - oY;
        
        t = t%TWO_PI;
        
        float a = atan2(dX, dY)+PI;
        
        dA = abs(t-a);
        
        
        //text("t = " + t.toFixed(2) + " a = " + a.toFixed(2), x+10, y+10);
        
        
        if (abs(a-t) > 1) {
            t += random(v)/random(20, 40);
        }
        
        vX = sin(t);
        vY = cos(t);
    
        x += vX*v;
        y += vY*v;
    }
    
    void draw() {
        noStroke();
        fill(0);
        ellipse(x, y, 5, 5);
        stroke(0);
        line(x, y, x+vX*10, y+vY*10);
    }
}
