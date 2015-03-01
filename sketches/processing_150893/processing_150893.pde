
float er = 15;
float x = 0;
float a = 0;
void setup() {
    size(400, 400);
    smooth();
    noStroke();
}
void draw() {
    background(0);
    
    float x1 = map(sin(a), -1, 1, 0, width/2);
    float y1 = map(sin(a), -1, 1, 0, height/2);
    
    float x2 = map(sin(a), 1, -1, width/2, width);
    float y2 = map(sin(a), 1, -1, height/2, height);
    
    fill(255, 200, 210);
    ellipse(x1, y1, er * 2, er * 2);
    ellipse(x1 + er, y1, er * 2, er * 2);
    
    ellipse(x2, y2, er * 2, er * 2);
    ellipse(x2 + er, y2, er *2, er * 2);
    
    a += 0.03;
}

