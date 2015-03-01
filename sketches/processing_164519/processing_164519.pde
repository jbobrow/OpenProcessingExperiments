
int col = 150

void setup(){
    size(300,300);
    smooth();
    colorMode(HSB);
}
void draw() {
    background(255);
    strokeWeight(3);
    
    color c = color(map(col, 0, 1020, 0, 255), 255, 255);
    fill(c);
    ellipse(150, 150, 250, 250);
}


