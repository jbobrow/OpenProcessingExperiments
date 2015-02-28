
void setup() {
    size(400,400) ;
    frameRate(7) ;
    background(0) ;
}
void draw() {
    float r = random(255) ;
    float q = random(255) ;
    float w = random(255) ;
    float e = random(400) ;
    float f = random(400) ;
    float t = random(10,100);
    fill(r,q,w) ;
    ellipse(e,f,t,t) ;
}    
    
