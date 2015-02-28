
void setup() {  //setup function called initially, only once
size(500,500)
}
void draw() {  //draw function loops 
    ellipseMode(CENTER);
    rectMode(CENTER);
    fill(0,0,0);
    rect(250,250,300,500);
    fill(255,0,0);
    ellipse(250,100,100,100);
    fill(255,255,0);
    ellipse(250,250,100,100);
    fill(0,255,0);
    ellipse(250,410,100,100);
}
