
void setup(){
size(900,400);
frameRate(250);
background(0);
stroke(0,250);
ellipseMode(CENTER);
smooth();
}

float a,b,c;
void draw() {
stroke(255);

a=sqrt(b*b+c*c);
b=abs(pmouseX-mouseX);
c=abs(pmouseY-mouseY);
float d= noise(1)*mouseX;
float f= noise(2)*mouseY;

fill(f,d,a,25);

if (mousePressed) {
  fill(f,d,a); 
}
  
  
ellipse (mouseX, mouseY,a*a,a*a);
}
void keyPressed() {
background(255);
}
