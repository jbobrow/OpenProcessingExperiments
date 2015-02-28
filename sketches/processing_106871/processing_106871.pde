
void setup() {
    size(250,250);
}
 
x = 20;
y = 20;
dx = 0;
dy = 1;
 

void draw() {
    background(255,155,0)

    ellipse(x,y,20,20);
     
    y += dy;
     
    if (y > 250) dy = -dy;
    if (y < 0) dy = -dy;
     
    if (mousePressed) {
        x = mouseX;
        y = mouseY;
    }
}
