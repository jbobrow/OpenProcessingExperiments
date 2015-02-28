
int i;
float radius;
int degLong=0;
int deg=0;


void setup() {
    size(800,600);
    colorMode(HSB,360,100,100);
    noStroke();
    smooth();
    background(0,0,0);
    frameRate(30);
}

void draw() {
    background(0,0,0);
    radius=0.0;
    fill(random(150,220),100,100,100);
    for (deg=0; deg<360*20; deg+=11) {
        float angle=radians(deg);
        float x=400+(cos(angle+radians(frameCount/2))*radius);
        float y=300+(sin(angle+radians(frameCount/2))*radius);
        ellipse(x,y,10,10);
        radius+=0.60;     
    }
}
