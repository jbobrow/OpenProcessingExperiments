
float a = 1;
float b = 1;
float c = 400;
float d = 400;

void setup() {
  size(400, 400);
  background(255);

}

//battle
void draw() {
    float r=random(0,a);
    float r2=random(0,b);
    float r3=random(d,400);
    float r4=random(c,400);
fill(0,0,255);
stroke(0);

ellipse(r,r2,5,5);
a = a +1;
b = b +1;

fill(255,0,0);
ellipse(r3,r4,5,5);
c = c -1;
d = d -1;

}



