
float x = 60;
float y = 440;
int radius = 45;
int bodyHeight=160;
int neckHeight=70;
float easing = 0.09;

void setup(){
size(720,480);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);
}

void draw() {
int targetX=mouseX;
x += (targetX-x) * easing;

if (mousePressed){
neckHeight=16
bodyHeight=90;
}else{
neckHeight=70;
bodyHeight=160;
}

float ny=y - bodyHeight - neckHeight - radius;
if (mousePressed){
background(0,230,50);
}else{
background(204);
}
stroke(102);
line(x+12, y-bodyHeight, pmouseX+12, ny);


stroke(255,0,0);
line(x+12, ny, pmouseX-18, pmouseY-43);
line(x+12, ny, pmouseX+42, pmouseY-99);
line(x+12, ny, pmouseX+78, pmouseY+15);



noStroke();
fill(255,0,0);
ellipse(x, y-33, 33, 33);
fill(0);
rect(pmouseX-45, y-bodyHeight, 90, bodyHeight-33);


fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(pmouseX+24, pmouseY-14);
fill(0);
ellipse(pmouseX+24, pmouseY-6, 3, 3);
}
