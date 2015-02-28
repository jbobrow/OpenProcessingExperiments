
void setup(){
    size(300,200);
    background(255);
    smooth();
}
    
void draw(){
    noStroke();
    fill(random(255),random(255),random(255));
    ellipse(random(width),random(height),50,50);
 
    filter(BLUR,1);
}

