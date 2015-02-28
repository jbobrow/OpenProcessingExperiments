
int count = 0;
int sz = 400;


void setup () {
    size(sz, sz);
    background (255, 255, 0);
    fill (25, 25, 112);
    textSize (sz*0.2);
    textAlign (CENTER, CENTER);
}
    
void mousePressed() {
    count = count + 1;
    
    if (count > 10) {
        count = 1;
        background(255, 255, 0);
    }
    
    noStroke();
    fill (255, 255, 0);
    rectMode(CENTER);
    rect(sz/2, sz/2, sz*0.12, sz*0.15); 
    fill (255, 0, 0);
    text(count, sz/2, sz/2);
    fill (0);
    ellipse (random(sz), random(sz), sz*0.1, sz*0.1);
    }
}
