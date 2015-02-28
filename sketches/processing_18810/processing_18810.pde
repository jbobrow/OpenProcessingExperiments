
float y=50.0;
float speed = 3.0;
float radius = 20.0;
int direction=1;

void setup(){
size(200,200);
smooth();
noStroke();
ellipseMode(RADIUS);
}

void draw(){
fill(0,30);
rect(0,0,width,height);
fill(255);
y+=speed*direction;

ellipse(75,y,radius, radius);
if((y>height-radius) ||(y<radius)) {
direction = -direction;
}
}

