
int n;
int maxRand;

void setup() {
    size(800, 800);
    background(255); 
    n = 10;
    maxRand = 100;
    noFill();
    fill(0);

    background(255);
    beginShape();
    vertex(0, height/2);
    int y = height/2;
    int yBezPrev = random(100)-50;
    
    
    
    for (int i = 1; i <= n; i++) {
        int x = width*(i/n);
        int xBez = x+random(width/n);
        
        int yBez = random(100)-50;
        bezierVertex(x-(width/n/2), (height/2)+yBez, x-(width/n/2), (height/2)-yBezPrev, x, y);
        text(x-(width/n/2)+" "+(height/2)+yBez+" "+x-(width/n/2)+" "+(height/2)-yBezPrev+" "+x+" "+y, 100, i*10+20);
        yBezPrev = yBez;
    }
    endShape();
    
    beginShape();
    vertex(100, 600);
    bezierVertex(200, 800, 200, 700, 300, 600);
    bezierVertex(400, 500, 400, 200, 500, 600);
    bezierVertex(600, 1000, 600, 0, 700, 600);
    endShape();
    
}


void draw2() { 
    background(255);
    beginShape();
    vertex(0, height/2);
    int y = height/2;
    int yBezPrev = (height/2)+random(100)-50;
    
    
    
    for (int i = 1; i <= n; i++) {
        int x = width*(i/n);
        int xBez = x+random(width/n);
        
    int yBez = (height/2)+random(100)-50;
        bezierVertex(xBez, yBezPrev, xBez, yBez, x, y);
        yBezPrev = yBez;
    }
    endShape();
}

int rnd()Â {
    return random(maxRand)-(maxRand/2);
}
