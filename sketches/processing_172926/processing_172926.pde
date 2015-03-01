
int n, b;
 
void setup() {
    size(800, 800);
     
    n = 6;
    b = 200;
    strokeWeight(350);
     
    rectMode(CENTER);
    redraw();
}
 
void mouseClicked() {
    redraw();
}
 
void redraw() {
    background(#3FD675);
    noStroke();
    for(int i = 0; i <= n; i++) {
        fill(214, (63/n)*i, (117/n)*i);
        pushMatrix();
         
        translate(width/2, b+(((height-(b*2))/n)*i));
        rotate(-0.5+(random(50)/50));
        rect(0, 0, width, (height)/n);
         
        popMatrix();
    }
    stroke(#3FD675);
    noFill();
    ellipse(width/2, height/2, 800, 800);
}

void noise() {
    loadPixels();
    for (int i = 0; i < width*height; i++) {
        int c = color(0, 0, 0, random(20));
        pixels[i] = pixels[i]-c;
    }
    updatePixels();
}
