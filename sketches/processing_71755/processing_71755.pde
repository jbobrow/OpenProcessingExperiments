
int t = 0;

void setup(){
size(640,480);
frameRate(30);
}

void draw(){
smooth();
strokeWeight(t);
line(pmouseX,pmouseY,mouseX,mouseY);
// calculate the absolute distance between previous mouse Postion and current mouse Position
t = abs(pmouseX - mouseX);
}

void keyPressed(){ // You can replace "keypressed" to "mousePressed"
background(255);
stroke(random(0,255), random(0,255), random(0,255));
}
