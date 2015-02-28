

ArrayList fires;
ArrayList particles;

void setup() {
    size(600, 800);
    colorMode(HSB);
    noStroke();
    smooth();
    fires = new ArrayList();
    particles = new ArrayList();
}

void draw() {
    fill(color(0, 0, 0), 25);    //Transparent black (25%  opacity)
    rect(0, 0, width, height);    //Erases background, automaticaly drawing tails  

    for (int i = fires.size()-1; i >=0; i--) {
        Fire fire = (Fire) fires.get(i);
        if (fire.draw()==false) {
            fires.remove(i);
        }
    }

    for (int i = particles.size()-1; i >=0; i--) {
        Particle particle = (Particle) particles.get(i);
        if (particle.draw()==false) {
            particles.remove(i);
        }
    }

}

void mousePressed() {
    int type;
    if (mouseButton == LEFT) type=BOMB;    
    else type=ROCKET;
    fires.add(new Fire(mouseX, 0, type, color(10,255,255), random(0, 255), random(.5, 3), 180, random(1,4)));
}

//Fire Types
final int BOMB = 0;
final int ROCKET = 1;

final float gravity = .02;


class Fire {
    PVector pos, vel;
    color col;
    int fireType;
    boolean active = true;
    int myLife;
    float myH;
    float mySpeed;
    float myRandomness;

    Fire(float x, float y, int type, color tailColor, float particleHue, float speed, int life, float randomness) {

        pos = new PVector(x, height - y);
        myLife = life;
        col = tailColor;
        fireType = type;
        myH=particleHue;
        mySpeed=speed;
        myRandomness = randomness;

        switch (fireType) {
        case BOMB:
            vel = new PVector(0, -5 + random(-1, 1));
            break;
        case ROCKET:
            vel = new PVector(0, -3 + random(-1, 1));
            break;
        }
    }

    boolean draw() {
        if (pos.x > height + 200 || 
            pos.x < 0 ||
            pos.y > width + 200 ||
            pos.y < -200) active = false;    //if out of the screen
        switch (fireType) {
        case BOMB:
            myLife--;
            if (myLife <0) {
                for (int i=0; i<150; i++) {
                    particles.add(new Particle(pos, vel, myH, 200, mySpeed, 4, myRandomness));
                }
                active = false;
            }
            pos.y+=random(-1, 1);
            pos.x+=random(-1, 1);
            vel.y+=gravity;
            pos.add(vel);
            drawEllipse();
            break;
        case ROCKET:
            myLife--;
            if (myLife <0) active = false;
            pos.add(vel);
            particles.add(new Particle(pos, vel, myH, 150, random(0.0, 0.2), 2, 2));
            break;
        }
        return active;
    }

    void drawEllipse() {
        fill(col, myLife);
        pushMatrix();
        translate(pos.x, pos.y);
        ellipse(0, 0, 4, 4);
        fill(62, 100, 100);
        if (random(0, 100) < 5) ellipse(random(-2, 2), random(5, 20), 2, 2);    //sparkles
        popMatrix();
    }
}

class Particle {
    PVector pos, vel;
    float speed;
    float myLife;
    int mySize;
    int col;
    boolean active = true;

    Particle(PVector p, PVector vl, float particleHue, int life, float speed, int pSize, float randomness) {
        pos = new PVector(p.x, p.y);
        myLife = life * random(.5, 1.5);
        col = color((random(-10, 10)+particleHue)%5, 255, 255);
        float v = random(randomness)/2 * speed;
        vel = new PVector(v, v);
       
        //vel.rotate(random(0, 2*PI));
        float angle = random(0, 2*PI);  //I don't know why rotate is freezing the program in Javascript
        vel.x*=cos(angle);
        vel.y*=sin(angle);
        
        vel.add(vl);
        mySize=pSize;
    }

    boolean draw() {
        vel.mult(.98);
        vel.y+=gravity;
        pos.add(vel);
        myLife--;
        if (myLife <1) {
            active = false;
        }
        drawEllipse();
        return active;
    }

    void drawEllipse() {  
        if (random(0, 100) < 3 && myLife < 40) fill(255); 
        else fill(col, myLife);    //flashes at the end of life
        pushMatrix();
        translate(pos.x, pos.y);
        ellipse(0, 0, mySize, mySize);
        fill(90, 100, 100);
        if (random(0, 100) < 5) ellipse(random(-2, 2), random(5, 20), 2, 2);    //sparkles
        popMatrix();
    }
}


