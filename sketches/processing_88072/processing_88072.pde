
float x;
float easing = 0.01;
float diameter = 5;
int a = 100;
int b = 300;
int radius = 20;
 
void setup() {
size(480, 480);
smooth();
 
}
void draw() {
background(50, 400, 50); //Lines
stroke(200);
 
 
 
strokeWeight(10);
if (mousePressed == true) {
stroke(255, 0, 44);
}
line(233, 400, width, 23);
line(400, 0, width, 60);
 
 
strokeWeight(30);
if (mousePressed == true) {
stroke(100, 200, 255);
}
line(225, 400, width, 400);
fill(200);
textSize(70); //TEXT
fill(255);
text ("Boy and Dog", 0, 75, 324);
if (mousePressed == true){
fill(25,34,125);
text ("Boy and Dog", 0, 50, 300);
}
fill(200, 100, 0);
textAlign(LEFT);
fill(50);
textSize(12);
text ("Connect the dots", 50, 470, 250);
textSize (25);
text("Transform", mouseX, 410, 250);
if (mousePressed == true){
fill(150);
text("Transform", mouseX, 410, 250);//TEXT END
 
 
 
arc(mouseX, mouseY, 30, 30,0, radians(180));
 
ellipseMode(RADIUS);
float d = dist(mouseX, mouseY, a, b);
float targetX = mouseX;//Circle start
a += (targetX - a) * easing;
 
 
if (d < radius+60) {
radius++;
fill(475,60,96);
} else {
fill(50);
}
ellipse(a-30, b, radius, radius);
 
}
}



