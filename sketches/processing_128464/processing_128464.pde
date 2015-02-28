
void setup () {
    size(500,500);
    background(255);
}
void draw () {
    rectMode(CENTER);
    if (mousePressed == true) {
        fill(250,40,40);
    }
    else { 
        fill(255,255,255);
    }
    rect(250,250,120,120);
    if (mousePressed == true) {
        fill(255);
    }
    else {
        fill(250,40,40);
    }
    rect(250,250,100,100);
}
