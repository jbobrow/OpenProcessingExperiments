
void setup() {
size(500,500);
}
void draw(){
int m = millis();
background(255*sin(3.14159265359*m/500),255*sin(3.14159265359*m/500),255*sin(3.14159265359*m/500));
noStroke();
fill(0);
ellipse(250,250,abs(500*sin(3.14159265359*m/1000)),abs(500*sin(3.14159265359*m/1000)));
}
