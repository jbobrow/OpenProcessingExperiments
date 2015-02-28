
//randomness assignment
color[] spring = {#000000, #F65195, #41C01D, #faaaab};

void setup() {
    size(600, 600);
    smooth();
    noFill();
    frameRate(0.7);
    background(spring[0]);
    
}

void draw() {
    float x= random(width);
    float y= random(height);
    float d= random(10, 500);
    float s= random (1, 15);
    
    stroke(spring[int(random(1,3))]);
    ellipse(x, y, d, d);
    strokeWeight(s);
    
    {stroke(spring[int(random(1,3))], 300);
    rectangle(x, y, d, d);
    strokeWeight(s);
    
}
