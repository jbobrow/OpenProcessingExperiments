
float x = 100;
int y = 0;

void setup() {
    size(x*1.3, x);
    background(random(255), random(255),random(255),random(255));
    fill(random(255), random(255),random(255),random(255));
    noStroke();
    
}

void draw() {
    
    frameRate(60);
    y = y + 1;
    if (y > height) {
        y = 0;
    background(random(255), random(255),random(255),random(255));
    fill(random(255), random(255),random(255),random(255));
        
    }
    rectMode(CENTER);
    rect(width/2, height/2, y*1.33, y);
}
