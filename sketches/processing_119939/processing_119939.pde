
void setup(){
size(640,480);
}
void draw(){
background(64);
fill(31,127,255);
float diameter = sin(frameCount/10.0) *400;
ellipse(width/2, height/2, diameter, diameter);
}


