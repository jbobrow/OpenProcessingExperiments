
float a, b, m, n1, n2, n3;

int n;

void setup() {  //setup function called initially, only once
    size(800, 800);
    background(255);  //set background white
    smooth();
    stroke(0);
    fill(0);
    n = 100;
    a = 1;
    b = 1;
    m = 7;
    n1 = 3;
    n2 = 4;
    n3 = 17;

    int x2 = (width/2);
    int y2 = (height/2)+sf2d(0)*100;

    for (int i = 0; i <= n; i++) {
        float p = (i/n)*TWO_PI;
        int r = sf2d(p)*100;
        int x1 = (width/2)+sin(p)*r;
        int y1 = (height/2)+cos(p)*r;
        
        line(x1, y1, x2, y2);
        
        x2 = x1;
        y2 = y1;
    }
}

float sf2d(float p) {
    return pow(pow(abs((cos((m*p)/4))/a), n2)+pow(abs((sin((m*p)/4))/b), n3), -1*(1/n1));
}
