
float px=1;

void setup(){
size(600,600);
colorMode(HSB);
}

void draw(){
px=px+1;
background(px,255,255);
ellipse(px,px,px,px);
}

