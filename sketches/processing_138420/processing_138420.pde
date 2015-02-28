
int x = 0;
void setup(){
    size(500,500);
    noFill();
    noStroke();
    
}
void draw(){
    x++;
    background(0);
    stroke(255);
    fill(255);
    rectMode(CENTER);
    rect(x,random(500),random(5),random(5));
    rect(x,random(500),random(5),random(5));
    delay(1);
}

