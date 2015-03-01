
float a = 400;
float b = 1;

void setup() {
  size(400, 400);
  background(0);

}

//snow
void draw() {
    float r=random(0,a);
    float r2=random(b,0);
    
fill(255);
stroke(255);

ellipse(r,r2,5,5);
a = a +1;
b = b +1;
}



