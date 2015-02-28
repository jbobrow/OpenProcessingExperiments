
int a = 0;
int d = random(0.9,2.8);
int f = random(0.9,2.8);
int e = 10;
void setup() {
    size(400,400)
    }
    
void draw() {
    a+=PI/50;
    noCursor();
    int b = mouseX+80*sin(a)*d;
    int c = mouseY+80*cos(a)*f;
    while ((b > 192) && (b < 208) && (c > 192) && (c < 208)) {
    int b = 200;
    int c = 200;
    delay(5000);
    }
    if (c > 400) {
    c = c-400
    }
    if (c < 0) {
    c = 400+c
    }
    if (b > 400) {
    b = b - 400
    }
    if (b < 0) {
    b = 400 + b
    }
    
    background(50,150,130);
    fill(100,120,130);
    ellipse(b, c, e, e);
    rect(192, 192, 20, 20);
}

void keyPressed() {
    if (key == 'w') {
    d+=0.1
    }
    if (key == 's') {
    d-=0.1
    }
    if (key == 'd') {
    e+=5
    }
    if (key == 'a') {
    e-=5
    }
    }
                
                                                                                
