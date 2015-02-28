

float a;
float b;

void setup() {
size(450, 450);
background(random(0,255),random(0,255),random(0,255));
smooth();
}
void draw() {
a=random(0,width);
b=random(0,height);

fill(random(0,255),random(0,255),random(0,255));
ellipse( a, b, random(0,40), random(0,40));

}
                
                
