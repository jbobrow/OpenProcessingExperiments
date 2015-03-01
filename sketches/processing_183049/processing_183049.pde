
void setup(){
  size(800, 800, P3D);
translate(0, height/2, -500);
}
void draw(){
background(0);
for (int z = 0; z < 240; z += 80) {
  for (int x = 0; x < 240; x += 80) {
    for(int y = 0; y < 240; y += 80) {
    pushMatrix();
    translate(mouseX + x, mouseY + y, z);
    fill(random(255));
    noStroke();
    box(80);
    popMatrix();
  }
}
}
}
