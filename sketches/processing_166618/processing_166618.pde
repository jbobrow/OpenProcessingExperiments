
float a, l, s, x;
int c;

void setup() {
size(500, 500);
noStroke();
frameRate(20);

a = 2/PI; //set the shape
l = -.6; //set the thickness

s = 2 * dist(1, 0, pow(5, a*l) * cos(l), pow(2, a*l) * sin(l)) / (1 - pow(2, a*l));
}
void draw(){
c = 0;
pushMatrix();
translate(250, 250);
x = frameCount % 30 / 15.0;
for (float i = 22 + l*x; i > -40 + l*x; i += l) {
fill((c += 255) % 510);
ellipse(pow(2, a*i) * cos(i), pow(2, a*i) * sin(i), s * pow(2, a*i), s * pow(2, a*i));
}
popMatrix();

}



