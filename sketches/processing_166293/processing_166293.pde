
void setup() {
 background(255);
 size(600,600); 
}

void draw() {
    for(int i = 0; i < width; i += 10) {
     noFill();
     beginShape();
     curveVertex(0, 600);
     curveVertex(0, 600);
     curveVertex(1.25*i, 1.25*i);
     curveVertex(600, 600);
     endShape();
    }
    
    for(int i = width; i > 0; i -= 10) {
     noFill();
     beginShape();
     curveVertex(600,0);
     curveVertex(600,0);
     curveVertex(1.25*i, 1.25*i);
     curveVertex(0,0);
     endShape();
    }
 }
