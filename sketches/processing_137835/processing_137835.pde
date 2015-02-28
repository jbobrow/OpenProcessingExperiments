
float x=0;
float y=0;
float r=0;
float o=0;
void setup() {
size(500,500);
}
void draw() {
translate(250,250);
rotate(o);

ellipse(0,0,20,10);
translate(r*100,0);
ellipse(0,0,20,30);

r= cos(3*o);
o= o + (PI/180);
}
