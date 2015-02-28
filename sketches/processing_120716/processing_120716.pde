

void setup() {
    size(500, 500);
    frameRate(1);
}
void draw() {
    background(204); 
    x = random (0,500);
    y = random (0,500);
        fill(255,0,0,90);
    ellipse(x,y,20,20);
    println("x="+x+" y="+y);
}
