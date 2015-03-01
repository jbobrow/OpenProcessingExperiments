
    float speed;
    float x;
    float y;
    float angle, vx, vy;
    float ay;
     
    void setup() {
    size(600,600);
    speed = 5;
    x = 0;
    y = 300;
    angle = radians(-45);
    vx = speed * cos(angle);
    vy = speed * sin(angle);
    ay = 0.05;
 }
     
    void draw() {
    //background(255);
    fill(255, 255, 255, 50);
    rect(0, 0, width, height);
    fill(255, 255, 255, 255);
    x = x + vx;
    y = y + vy;
    vy = vy + ay;
    ellipse(x, y, 10, 10);
     
    translate(0, 300);
    rotate(angle);
    rect(0, -5, 40, 10);
    rotate(-angle);
    translate(0, -300);
 }
 //void keyPressed() {
 //if (key == ' ') {
// x = 0;
// y = 300;
// vx = speed * cos(angle);
// vy = speed * sin(angle);
// }
// }
    void mouseMoved() {
    angle = atan2(mouseY-300, mouseX);
    }
    
    void mousePressed() {
    if (mouseButton == LEFT) {
    x =0;
    y = 300;
    vx = speed * cos(angle);
    vy = speed * sin(angle);
    }
    }
