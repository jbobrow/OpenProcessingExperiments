
int n;

float t;

void setup() {
    size(400, 400);
    background(255);
    noFill();
    stroke(255);
    strokeWeight(5);
    smooth();
    n = 240;
}

void draw() {  //draw function loops 
    background(#1D0A24);
    t = millis()/400;
        
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < n; j++) {
            stroke(100, 255-(32*i), 100+i*25);
            drawLine(j, 50-(10*i));
        }
        t+=0.2+random(0.05);
    }
}

void drawLine(float i, int max) {
    float xOff = sin((i/n)*TWO_PI);
    float yOff = cos((i/n)*TWO_PI);
    float t2 = t+random(0, 0.1);
    int r = random(2);
    line((width/2), 
         (height/2),
         (width/2)+xOff*(max+(1+sin(t2))*20)+r, 
         (height/2)+yOff*(max+(1+sin(t2))*20))+r;
}
