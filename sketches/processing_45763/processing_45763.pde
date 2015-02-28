
tumbleWeed ball;

void setup() {
    size(800, 300);
    background(0);
    smooth();
    frameRate(120);
    ball = new tumbleWeed();
}

void draw() {
    noStroke();
    fill(0,0,0,50);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    ball.update();
    ball.drawing();
}

class tumbleWeed {
    float xpos, ypos, xveolcity, yvelocity, r, g, b;
    int d = random(1,20);
    int e = random(20,40);
    int f = random(40,60);
    
    tumbleWeed() {
        xpos = 0;
        ypos = height/2;
        xvelocity = 0.01;
        yvelocity = 0.01
    }
    
    void update() {
        r = random(200);
        b = 255;
        g = random(200);
        xvelocity += 0.01;
        yvelocity += 0.01;
        xpos = xpos + xvelocity;
        ypos = ypos + cos(yvelocity);
        if (xpos > width) {
        xpos = 0;
        }
        if (xvelocity > 10 || yvelocity > 10) {
        xvelocity = 5;
        yvelocity = 5;
        }
        if (ypos + f > height) {
        ypos = height - f
        }
    }
    
    void drawing() {
    noFill();
    stroke(r,g,b);
    strokeWeight(random(1,5));
    arc(xpos, ypos, d, d, random(0, PI/2), random(PI/2, PI));
    arc(xpos, ypos, d, d, random(PI, 3*PI/2), random(3*PI/2, 2*PI));
    arc(xpos, ypos, e, e, random(0, PI/2), random(PI/2, PI));
    arc(xpos, ypos, e, e, random(PI, 3*PI/2), random(3*PI/2, 2*PI));
    arc(xpos, ypos, f, f, random(0, PI/2), random(PI/2, PI));
    arc(xpos, ypos, f, f, random(PI, 3*PI/2), random(3*PI/2, 2*PI));
    }


}
                
                                
