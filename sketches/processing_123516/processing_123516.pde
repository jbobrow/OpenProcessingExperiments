
PVector location = new PVector(100, 100);
PVector velocity = new PVector(1, 3.3);

void setup() {
    size(640, 360);
    background(255);
}

void draw() {
    background(255);
    
    location.add(velocity);
    
    if ((location.x > width) || (location.x < 0))
        velocity.x *= -1;
    
    if ((location.y > height) || (location.y < 0))
        velocity.y *= -1;
    
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
}
