
int n, s, f1, f2, f3;

void setup() { 
    size(800, 800);
    background(20);
    smooth();
    noStroke();
    fill(255);
    
    n = 500;   //number of ellipse per circle
    m = 10;    //magnitude of waves
    f1 = 2000; //f general
    f2 = 2;    //f of rotation
    f3 = 5;    //f of waves
}

void draw() {
    background(20);
    float t = millis()/f1;

    paintCircle(t, 0);
    paintCircle(t, PI);
}

void paintCircle(float t, int o) {
    for(int i = 0; i < n; i++) {
        float p = (i/n)*TWO_PI;
        
        int x = (width/2) + sin(p+t) * (200+sin((t*f2+p)*f3+o)*m*(1-sin(p)));   
        int y = (height/2) + cos(p+t) * (200+sin((t*f2+p)*f3+o)*m*(1-sin(p)));
    
        ellipse(x, y, 5, 5);
    }
}
