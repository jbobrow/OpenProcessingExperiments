
float c = 5;
float b = 0;
float a = 0.001;

void setup() {
  size(500, 500);
  background(0);
}
 
void draw() {
translate(width/2, height/2);
rotate(1*PI/a);
fill(255, 50);
ellipse(b, b, c, c);
a += 0.001;
b += 1.45;
c += 3.55;

}


