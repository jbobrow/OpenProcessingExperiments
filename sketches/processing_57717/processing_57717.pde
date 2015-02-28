
//24 - 360
//x  - y
float angle = 0;
int segundoanterior = 0;
float increment = 0;

void setup() {
    size(225, 225);
    smooth();
    noFill();
    
    frameRate(30);
}

void draw() {
    background(10, 30, 40);
    stroke(255);
    ellipse(width/2, height/2, 2, 2);
    
    strokeWeight(0.5);
    for(int i = 0; i < 12; i++) {
        angle = i * 360 / 12;
        drawHandle(48, 53);
        drawHandle(83, 88);
        drawHandle(98, 103);
    }
    strokeWeight(0.3);
    for(int i = 0; i < 60; i++) {
        angle = i * 360 / 60;
        drawHandle(48, 50);
        drawHandle(83, 85);
    }
    strokeWeight(0.1);
    ellipse(width/2, height/2, 100, 100);
    ellipse(width/2, height/2, 170, 170);
    ellipse(width/2, height/2, 200, 200);
    
    strokeWeight(2);
    if(second() != segundoanterior) {
        increment = 0;
        segundoanterior = second();
    }
    angle = (second() + increment) * 360 / 60;
    drawHandle(1, 50);
    angle = minute() * 360 / 60;
    drawHandle(50, 85);
    angle = hour() * 360 / 12;
    drawHandle(85, 100);
    increment += 0.033;
}

void drawHandle(int inside, int outside) {
    float xin  = width/2  + sin(radians(-angle - 180)) * inside;
    float yin  = height/2 + cos(radians(-angle - 180)) * inside;
    float xout = width/2  + sin(radians(-angle - 180)) * outside;
    float yout = height/2 + cos(radians(-angle - 180)) * outside;
    
    line(xin, yin, xout, yout);
}

