
void setup() {
size(500, 500);
smooth();
float clouds = 7;
float cloudsWeight = calculateClouds(clouds);
println(cloudsWeight);
}
float calculateClouds(float t) {
float newNumber = t * 13.8;
return newNumber;
}
 
void draw() {
background(86, 255, 255);
cloud(0,0);
cloud(75,0);
cloud(150,0);
cloud(225, 0);
cloud(300, 0);
cloud(375,0);
cloud(450, 0);
 
}
void cloud(int x, int y) {
pushMatrix();
translate(x, y);
stroke(139, 221, 221); 
fill (214, 252, 252);
ellipse(40, 120, 100, 80);
fill (214, 252, 252);
ellipse(80, 160, 100, 80);
fill (214, 252, 252);
ellipse(40, 200, 100, 80);
fill (214, 252, 252);
ellipse(80, 240, 100, 80);

popMatrix();
}



