
void setup() {
    size(400,400);
    background(0);
}    

void draw() {
    float x = random(width);
    float y = random(height);
    fill(30,50,150);
    strokeWeight(15);
    stroke(255,0,10);
    line(x,0,y,height);
    fill(255);
    stroke(15);
    stroke(0);
    line(y,0,x,width);
}     
