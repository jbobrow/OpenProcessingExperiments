
//randomness assignment
color[] spring = {#000000, #F65195, #41C01D, #faaaab, #85db24, #4aee0b, #a4eb55, #fd00eb};

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
    float s1= random (1, 10);
    float s2= random (11, 20);
    
    stroke(spring[int(random(1,7))]);
    ellipse(x, y, d, d);
    strokeWeight(s1);
   
    
    stroke(spring[int(random(1,7))]);
    ellipse(x, y, d, d);
    strokeWeight(s2);
    
}
