
float t;

void setup() {  //setup function called initially, only once
    size(800, 800);
}

void draw() {  //draw function loops #
    background(#FFFFFF);
    t = millis()/4000;
    
    drawPattern(50, 400, 10, #D6753F);
    drawPattern(50, 500, 20, #753FD6);
    drawPattern(50, 600, 30, #3FD675);
}

void drawPattern(int n, int r, int d, int c) {
    strokeWeight(r);
    
    noStroke();
    fill(c);
    strokeWeight(10);
    
    for(int i = 0; i < n; i++) {
        float td = t+(i/n)*TWO_PI;
        ellipse((width/2)+sin(td)*(r/2), (height/2)+cos(td)*(r/2), d+d*cos(td*7+t), d+d*cos(td*7+t));
    }
    
    stroke(#FFFFFF);
    noFill();
    strokeWeight(500);
    ellipse(width/2, height/2, 500+r, 500+r);
}
