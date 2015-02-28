
float x;
float easing = 0.01;
float diameter = 10;
int a = 200;
int b = 400;
int radius = 15;

void setup() {
size(320, 480);
smooth();

}
void draw() {
background(140, 128, 200); //Lines
stroke(102);



strokeWeight(10);
if (mousePressed == true) {
stroke(10, 20, 255);
}
line(0, 40, width, 40);


strokeWeight(30);
if (mousePressed == true) {
stroke(100, 200, 255);
}
line(0, 400, width, 400);
fill(200);
textSize(50); //TEXT
fill(255);
text ("Welcome", 0, 50, 300);
if (mousePressed == true){
fill(250,164,96);
text ("Welcome", 0, 50, 300);
}
fill(200, 100, 0);
textAlign(LEFT);
fill(200);
textSize(12);
text ("To start left mouse click and connect the dots", 50, 470, 250);
textSize (25); 
text("Start", mouseX, 410, 250);
if (mousePressed == true){
fill(100); 
text("Start", mouseX, 410, 250);//TEXT END



ellipse(mouseX, mouseY, 10, 10);

ellipseMode(RADIUS);
float d = dist(mouseX, mouseY, a, b);
float targetX = mouseX;//Circle start
a += (targetX - a) * easing;


if (d < radius+40) {
radius++;
fill(250,164,96);
} else {
fill(255);
}
ellipse(a-30, b, radius, radius);

}
}


