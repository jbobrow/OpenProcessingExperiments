
/*
Arches
Dan Olson 2012
*/

//import processing.pdf.*;

int timer;
float x, y;

float s;
float s2;

void setup() {
frameRate(40);
size(200,200);

background(155,255,random(255));
//background(0);
//beginRecord(PDF, "filename.pdf");
}

void draw() {
arches();
screenResetTimer(300);
}

void screenResetTimer(float amount) {

if(millis() - timer >= amount) {
timer = millis();
setup();
}
}

void arches() {
  
x = random(width*.25,width*.75);
y = random(height*.25,height*.75);

s = width*.10;
s2 = height*.10;

for (float i = width*.10, j = height*.10; i < width && j < height; i+=s, j+=s2) {

line(x,y,i,j);

colorMode(HSB);
stroke(random(255),random(255),255);

}

}

void mousePressed(){
if (mouseButton == RIGHT){
noLoop();
//endRecord();
}
if (mouseButton == LEFT) {
loop();
setup();
}
}


