
void setup(){
    size(300,200);
    background(255);
    smooth();
    
    rectMode(CENTER);
}

void draw(){
        rect(random(width),random(height),20,20);
}
