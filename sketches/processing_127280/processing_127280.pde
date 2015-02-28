
//Name: Daniel
//Date: 08-01-14
//Project: Traffic Light 2.0
void setup () {
size(200,200)
}
void draw () {
    rectMode(CENTER);
    fill(7,7,7);
    rect(100,100,100,200);
    fill(40,15,15);
    ellipse(100,40,50,50);
    fill(40,40,15);
    ellipse(100,105,50,50);
    fill(15,40,15);
    if (mousePressed == true) //When mouse-click detected, makes the elipse bright green
        fill(0,255,0)
    ellipse(100,170,50,50);
} 

