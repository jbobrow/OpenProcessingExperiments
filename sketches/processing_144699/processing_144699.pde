
void setup() {
size(500,500);
}
void draw(){
int m = millis();
background(255*cos(tan(sin(PI*m/1000))),255*cos(tan(sin(PI*m/1000))),255*cos(tan(sin(PI*m/1000))));
noStroke();
fill(0);
ellipse(250,250,abs(500*cos(tan(sin(PI*m/1000)))),abs(500*cos(tan(sin(PI*m/1000)))));
}
