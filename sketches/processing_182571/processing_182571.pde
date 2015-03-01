
ArrayList<Circle> circles;
int space;

void setup() {  //setup function called initially, only once
    size(800, 800);
    background(color(18, 6, 16));
  
    
    circles = new ArrayList();
    space = 50;
    
    
    for (int i = -2 * space ; i <= (width) + space; i += space) {
        for (int j = -2 * space ; j <= (height) + space; j += space) {
            circles.add(new Circle(i, j));
        }
    }
}

void draw() {  //draw function loops 
    fill(color(36, 12, 32), 255);
    rect(0, 0, width, height);

    for (Circle c : circles) {
        c.update();
        c.draw();
    }
}

class Circle {
    float cx, cy;
    float rx, ry;
    float rT;
    float offset;
    float size;
    
    Circle(float x, float y) {
        this.cx = x;
        this.cy = y;
        
        this.rT = 500;
        this.offset = random(-PI/8, PI/8);
        this.size = 50;
    }
    
    void update() {
        float t = millis()/rT;
        
        //t += (cx/400)*PI;
        //t += (cy/400)*PI;
        
        t += cos(abs(1-(cx/(width/2))))*TWO_PI;
        t += cos(abs(1-(cy/(height/2))))*TWO_PI;
        t += offset;
        
        //rx = abs((cos(t))*(((cx)/25)+10))-4;
        rx = sin(t)*size;
        ry = rx;
    }
    
    void draw() {
        if (rx > 0 && ry > 0) {
            noStroke();
            fill(color(227, 223, 210));
            ellipse(cx, cy, rx, ry);
        }
    }
}
