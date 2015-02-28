
float[] baba = new float[60];

 
void setup() {
  size(500, 500);
  smooth();
  frameRate(15);
}
 
 
void draw() {
  background(#ED0505);
 
  for (int i=0; i < 60; i++) {
    baba[i] = random(width);

 
 
    fill (0, random(255), random(255));
  ellipse ( mouseX, mouseY, random(500), random(500));

}

}

