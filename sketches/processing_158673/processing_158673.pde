
float y = 0.0;
float = 2.5;

void setup() {
size(400, 200);
smooth();
noStroke();
fill(0);
frameRate(80); 
}
void draw() {
background(204);
fill(88,567,90)
println(frameRate);
ellipse(random (width), random(height),40,40);


y += 0.5;
if (y > 150) {
y = 50.0;


}
}
