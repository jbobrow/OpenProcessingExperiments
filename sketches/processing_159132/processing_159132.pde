
void setup() {
  size(800, 800);
}


void draw() {
 background (mouseY, 200, mouseX);
  noStroke();
  noCursor();
  for (int x=0; x<800; x=x+10) {
    for (int y=0; y<800; y=y+10) {
      fill(x*0.5,y*0.5, random(1*1));
      float perro = dist(mouseX, mouseY, x, y);
     // if (perro<20) {
        ellipse(x+random (perro*0.01), y+random(perro*0.01), 5, 5);
      }
    //}
  }

}
