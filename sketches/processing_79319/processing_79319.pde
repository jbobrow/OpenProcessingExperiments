
void setup(){
    size(500,500);
    background(0,0,0);
    frameRate(8);
}

int radius = 500;

void draw(){
    fill(255,0,0);
    ellipse(250,250,radius,radius);
    radius-=100;
    fill(0,0,0);
    ellipse(250,250,radius,radius);
    radius-=10
    fill(255,255,255);
    ellipse(250,250,radius,radius);
    radius-=100;
    fill(255,255,0);
    ellipse(250,250,20,20);

}
