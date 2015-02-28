
float a,b;

float cx = -100, cy = -100;
int n = 0;

void setup(){
    size (600, 600);
    a=width/20;
    b=height/20;
    board();
}

void draw() {
    if (n >= 1) {
        PVector p = snap(cx, cy);
        int c = n%2 ==0 ? 255 : 0;   
        fill(c);
        ellipse (p.x, p.y, 25,25);
    }
}

void mouseClicked() {
    cx = mouseX ;
    cy = mouseY;
    n++;
}

PVector snap(float x, float y) {
    PVector p = new PVector();
    p.x = round(x/width * 20);
    p.y = round(y/height * 20);
    p.x = max(1, p.x);
    p.y = max(1, p.y);
    p.x = min(19, p.x);
    p.y = min(19,p.y);
    p.x *= a;
    p.y *= b;
    return p;
}

void board (){
    for(int i=1; i<20;i++){
        line(i * a, 0, i*a, height);
        line(0, i*b, width, i*b);
    }
}
