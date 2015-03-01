
var reflection;

void setup() {
    size(800, 400);
    background(255);
    smooth();
    strokeWeight(10);
    strokeCap(SQUARE);
    
    reflection = false;
}

void keyPressed() {
    reflection = !reflection;
}

void draw() {
    background(255);
    
    stroke(100);
    noFill();
    drawArcs(300, #FF3619); 
    drawArcs(225, #FF8919);
    drawArcs(150, #00FF87); 
    drawArcs(75, #00C9FF);
    
    noStroke();
    if (reflection) 
        fill(255, 200);
    else fill(255, 255);
    rect(0, height/2, width, height);
    
//    float t = (frameCount%75)/75;
//    
//    if (frameCount%225 < 75) {
//        fill(100, 230-t*255);
//        noStroke();
//        ellipse(width/2-(300*t), (height/2), t*300, t*300);
//    }

}

void drawArcs(int r, color c) {
    stroke(c);
    float t = (frameCount%(r/4))/(r/4);
    x = width/2-r*t+2*r;
    y = (height/2);
    arc(x, y, r, r, PI, PI+PI*t);
    arc(x, y, r, r, PI-PI*t, PI);
    for (int i = 0; i < 1+(width/2)/r; i++) {
        ellipse(x-r*(i+1), y, r, r);
      // arc(x-r*(i+1), y, r, r, PI, TWO_PI);
    }
}
