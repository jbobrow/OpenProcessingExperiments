
int counter;
float tW, tH;
color c;
void setup() {
    size(800, 796);
    background(255);
    smooth();
    strokeWeight(2);
    noStroke();
    tW = 50;
    tH = (sqrt(3)/2)*tW;
    
    drawTriangles();
}

void mouseClicked() {
    drawTriangles();
}

void drawTriangles() {
    background(255);
    for(int j = 0; j < (width/tH)+(tH*2); j++) {
        beginShape(TRIANGLE_STRIP);
        for(int i = 0; i < (height/tW)+(tW*2); i++) {
            float shift = (j % 2) == 0 ? (tH/2)+3 : 0;
            
            c = getColor(j);
        
            fill(c-20);
            stroke(c-20);
            
            vertex(-tW+i*tW+shift, j*tH);
            
            c = getColor(2j);
        
            fill(c+10);
            stroke(c+10);
            
            vertex(-tW+i*tW+(tW/2)+shift, j*tH+tH);
        }
        endShape();
    }
}

color getColor(int j) {
    return color(random((j / ((width/tH) + (tH*2)))*255, 255), random(0, 150), 100-(j / ((width/tH) + (tH*2)))*100);
}
