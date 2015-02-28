
void setup(){
    size(640,480);
    fill(255,128,128);
    d = dist(0,0,width,height);
}

float th1, th2, d;

void draw(){
    background(255);
    th1 = map(mouseX,0,width,0,TWO_PI);
    th2 = map(mouseY,0,height,0,TWO_PI) + th1;
    arc(.5*width,.5*height,d,d,th1,th2);
}
