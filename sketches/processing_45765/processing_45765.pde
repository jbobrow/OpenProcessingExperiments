
    tumbleWeed ball;

void setup() {
    size(800, 450);
    background(0);
    smooth();
    frameRate(120);
    ball = new tumbleWeed();
}

void draw() {
    strokeWeight(10);
    stroke(150,30,150);
    noCursor();
    fill(0,0,0,50);
    rectMode(CENTER);
    rect(width/2, height/2, width, height); //rect is background
    ball.update();
    ball.drawing();
    ellipse(mouseX, mouseY, 5, 5); //creates pointer
    
}

//creates gravity dependant on location of mouse and center of ball
void mouseDragged() {
    if (mouseButton == LEFT) {
    if (xpos < mouseX) {
    xvelocity = xvelocity - .002*xpos + .002*mouseX
    } 
    if (xpos > mouseX) {
    xvelocity = xvelocity - .002*xpos + .002*mouseX
    }
    if (ypos < mouseY) {
    yvelocity = yvelocity - .002*ypos + .002*mouseY
    } 
    if (ypos > mouseY) {
    yvelocity = yvelocity - .002*ypos + .002*mouseY
    }
    }
}

//Right mouse button stops ball
void mousePressed() {
    if (mouseButton == RIGHT) {
    xvelocity = 0;
    yvelocity = 0;
    }
    }

//allows use of arrow keys to accelerate ball
void keyPressed() {
    if (key == 32) {
    xvelocity = 0;
    yvelocity = 0;
    }
    if (key == 'a') {
    xvelocity -= 0.2
    }
    if (key == 'd') {
    xvelocity += 0.2
    } 
    if (key == 's') {
    yvelocity += 0.2
    }
    if (key == 'w') {
    yvelocity -= 0.2
    }
}

class tumbleWeed {
    float r, g, b;
    int d = random(1,20); // radii of ball, ensures a good distribution
    int e = random(20,40);
    int f = random(40,60);
    
    tumbleWeed() {
        xpos = width/2; //initial position
        ypos = height/2;
        yvelocity = 0; //initial velocity
        xvelocity = 0;
    }
    
    void update() {
        r = random(200);
        b = random(200);
        g = random(200);
        xpos += xvelocity; //velocity adds to the position
        ypos += yvelocity;
        //creates bumpers on side of walls
        if (xpos + f >= width || xpos - f <= 0) {
        xvelocity = -xvelocity
        }
        if (ypos + f >= height || ypos - f <= 0) {
        yvelocity = -yvelocity
        }
        //limits on ball speed
        if (xvelocity >= 10) {
        xvelocity = 10
        }
        if (yvelocity >=10) {
        yvelocity = 10
        }
        if (xvelocity <= -10) {
        xvelocity = -10
        }
        if (yvelocity <= -10) {
        yvelocity = -10
        }
        
    }
    
    void drawing() {
    noFill();
    //creates 4 colored regions
    if (ypos < height/2 && xpos < width/2) {
    stroke(r, 255,  b)
    }
    if (ypos < height/2 && xpos > width/2) {
    stroke(r, g, 255)
    }
    if (ypos > height/2 && xpos < width/2) {
    stroke(255, g, b)
    }
    if (ypos > height/2 && xpos > width/2) {
    stroke(255, 255, b)
    }
    if (ypos == height/2 || xpos == width/2) {
    stroke(255,255,255)
    }
    strokeWeight(random(1,5));
    //creates ball of arcs
    arc(xpos, ypos, d, d, random(0, PI/2), random(PI/2, PI));
    arc(xpos, ypos, d, d, random(PI, 3*PI/2), random(3*PI/2, 2*PI));
    arc(xpos, ypos, e, e, random(0, PI/2), random(PI/2, PI));
    arc(xpos, ypos, e, e, random(PI, 3*PI/2), random(3*PI/2, 2*PI));
    arc(xpos, ypos, f, f, random(0, PI/2), random(PI/2, PI));
    arc(xpos, ypos, f, f, random(PI, 3*PI/2), random(3*PI/2, 2*PI));
    }


}
                
                                                
                                                                                                                                                                                                                                                                    
