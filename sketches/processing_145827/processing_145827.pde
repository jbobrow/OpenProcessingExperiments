


void setup() {
    size(400, 400);
    
    background(0);
    
    textAlign(CENTER);
    textSize(18); 
}


void draw() {
    color textColor = color(255, 0, 0);
    fill(textColor);
    text("LOLOLOL WTF", 200, 30);
    
    color lineColor = color(0, 255, 0);
    stroke(lineColor);
    line(0, 0, 400, 400);
    
    noloop();
}


