
float r = 0;
float theta = 0;

void setup() {
size(400,400);
background(100);
frameRate(400);
smooth();
}

void draw() {

float x = r * cos(theta);
float y = r * sin(theta);
noStroke();
fill(0);
rect(x + width/2, y + height/2, 3, 3); 
theta = theta + .01;
r = sqrt(theta) * 30;

}



