
ArrayList<Particle> particles; //ArrayList of particles 
int numParticles; //Number of particles
int distance; //"Distance" (in the array) between point connections
int fade; //Length of particle trail, 1 is no trail
var toggle; //Show the info display


void setup() {
    size(800, 800);
    background(20);
    smooth();
    
    particles = new ArrayList();
    numParticles = 600;
    distance = 0;
    fade = 1;
    toggle = false;
    
    //Create particles
    for (int i = 0; i < 600; i++) {
        Particle p = new Particle(400, 400, numParticles - (i), (QUARTER_PI/4) * i); 
        particles.add(p);
    }
}

void draw() {

    //Fade effect
    noStroke();
    fill(0, 255/fade);
    rect(0, 0, width, height);
    
    
    for (Particle p : particles) {
        p.update();
    }
    
    Particle p1, p2;
    
    //Draw connections between particles
    for (int i = 0; i < particles.size()-distance; i++) {
        p1 = particles.get(i);
        p2 = particles.get(i+distance);
    
        int c1 = (dist(400, 400, p1.x, p1.y)/400)*255;
    
        stroke(color(255, c1/2, 255-c1));
        strokeWeight(1.0f);
        line(p1.x, p1.y, p2.x, p2.y);
    }
    
    
    //If wanted, draw info display
    if (toggle) {
        fill(255);
        text("Distance: " + distance, 0, 10);
        text("Fade: " + fade, 0, 20);
    }
}

void keyPressed() {
    switch(key) {
        case 'f':
            //Increase fade to up to 16
            fade = (fade * 2) % 31;
            break;
        case 'd':
            //Increase distance to up to numParticles
            distance = ++distance % numParticles;
            break;
        case 't':
            toggle = !toggle;
            break;
        case 'r':
            //Reset distance and fade
            distance = 0;
            fade = 1;
            break;
        default:
            break;
    }
}


class Particle {
    float cx, cy; //Center position
    float x, y; //Current position
    float rx, ry; //Radii
    float rT; //Time in ms to complete one revolution
    float size; //Size of the particle, doesn't matter unless you draw it
    float offset; //Offset from 0Ã�Â° in rad
         
    Particle(float x, float y, float r, float offset) {
        this.cx = x;
        this.cy = y;
         
        this.rx = r;
        this.ry = this.rx;
         
        this.rT = 2000;
        
        this.size = 3;
        
        this.offset = offset;
    }
    
    void update() {
        float t = millis()/rT;
        
        //Add offset
        t+= offset;
        
        x = (int)(cx + rx * cos(t));
        y = (int)(cy + ry * sin(t));
    }
     
    void draw() {
        //Draw the track of the particle
        noFill();
        stroke(255, 20);
        ellipse(cx, cy, rx*2, ry*2);
 
        //Draw the actual particle
        noStroke();
        fill(200);
        ellipse(x, y, size, size);
    }
}
