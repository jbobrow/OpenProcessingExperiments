
int n;
float t;
void setup() {
    size(800, 800);
    background(255);
    smooth();
    
    n = 128;
}

void draw() {
    background(255);
    
    t = millis()/1000;
    
    stroke(0);
    noFill();
    for(int i = 0; i < n; i++) {
        int x = (width/2)+sin(t)*150*sin((i/n)*TWO_PI);
        int y = (height/2)+cos(t)*150*cos((i/n)*TWO_PI);
        
        ellipse(x, y, 100+sin(t)*50, 100+sin(t)*50);
    }
    
    noStroke();
    fill(255, 0, 0);
    ellipse(width/2, height/2, 3, 3);
}
