
int r, d;
var drawWaves;

void setup() {  //setup function called initially, only once
    size(800, 800);
    background(255);  //set background white
    r = 200;
    d = 5;
    strokeCap(SQUARE);
    
    drawWaves = false;
}

void mouseClicked() {
    drawWaves = !drawWaves;
}

void draw() {  //draw function loops 
    background(255);
    float t = millis()/2000;
    int x = (width/2)+sin(t)*r;
    int y = (height/2)+cos(t)*r;
    
    text("sin(t) = " + sin(t).toFixed(2), 10, 10);
    
    text("cos(t) = " + cos(t).toFixed(2), 10, 22);
    
    text("x = midX + sin(t) * r = " + x.toFixed(2), 10, 50);
    text("y = midY + cos(t) * r = " + y.toFixed(2), 10, 62);
    
    noFill();
    strokeWeight(d/2);
    stroke(255, 100, 0, 100);
    line(x, y, x, height/2);
    stroke(100, 255, 0, 100);
    line(x, y, width/2, y);
    
    stroke(200);
    ellipse(width/2, height/2, 2*r, 2*r);
    line((width/2)-r, height/2, (width/2)+r, height/2);
    line(width/2, (height/2)-r, width/2, (height/2)+r);
    
    noStroke();

    if (drawWaves) {
        fill(150);
    
        for(int i = 0; i < width; i+=d) {
            ellipse((width/2)+sin(t+(i-(width/2))/400)*r, i, d, d);
        }
    
    
        for(int i = 0; i < height; i+=d) {
            ellipse(i, (height/2)+cos(t+(i-(height/2))/400)*r, d, d);
        }
    }
    
    fill(255, 100, 0);
    ellipse(x, height/2, d, d);
    
    fill(100, 255, 0);
    ellipse(width/2, y, d, d);
    
    fill(0);
    ellipse(x, y, d, d);
}
