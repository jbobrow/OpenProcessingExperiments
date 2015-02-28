
void setup() {
    size(480,480);
    background(0);
    noStroke();
    
}

int color = 0;
void draw() {

    for (int i = 480; i > 0; i-= 15) {
        color += 7.8;
        fill(color);        
        ellipse(240,240,i,i);
    }
}
