
ArrayList<Bar> bars;
int space;

void setup() {  //setup function called initially, only once
    size(800, 300);
    background(color(18, 6, 16));
    
    bars = new ArrayList();
    space = 10;
    
    for (int i = -2 * space ; i <= width + 2 * space; i += space) {
        bars.add(new Bar(i, height));
    }
}

void draw() {  //draw function loops 
    fill(color(18, 6, 16), 255/4);
    rect(0, 0, width, height);

    for (Bar b : bars) {
        b.update();
        b.draw();
    }
}

class Bar {
    float bx, by;
    float w, h;
    float rT;
    
    Bar(float x, float y) {
        this.bx = x+5;
        this.by = y;
       
        this.w = 5;
        this.h = by;
        
        this.rT = 500;
    }
    
    void update() {
        float t = millis()/rT;
        
        h = -1 * ((cos(t + (((bx-800)/800) * PI * mouseX/50))*100)-150);
    }
    
    void draw() {
        int f = (abs(bx/width))*TWO_PI;
    
        int r = sin(f + 4) * 127 + 128;
        int g = sin(f + 2) * 127 + 128;
        int b = sin(f + 0) * 127 + 128;
        
        noStroke();
        fill(color(r, g, b));

        rect(bx, h-15, w, 30, 5, 5, 5, 5);
    }
}
