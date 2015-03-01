
int n, s, d, o;

void setup() { 
    size(800, 800);   
    stroke(255);
    smooth();
    
    
    n = 40;
    s = width/n; 
    d = 4;
    o = 3;
    background(#3B3A45);
    
    int i = 0;
    
    for(int y = 0; y <= n; y++) {
        for(int x = 0; x <= n; x++){
            if (i < 2) {
                noFill();
            } else fill(255);
            ellipse(s*x+o, s*y+o, d, d);
            ellipse(s*x+o, s*y-o, d, d);
            ellipse(s*x-o, s*y-o, d, d);
            ellipse(s*x-o, s*y+o, d, d);
            i = (i+1)%4;
        }
        if (y%4 < 2) {
                i = 0;
        } else i = 2;
    }
}

void draw() {
    
}
