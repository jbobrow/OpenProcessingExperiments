
void setup(){
    size(300,200);
    background(255);
    smooth();
     
    rectMode(CENTER);
}
 
void draw(){
    noStroke();
    fill(random(200,255),random(200,255),random(200,255),100);
    rect(random(width),random(height),50,50);     
}
