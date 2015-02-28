
color c1,c2,c3; // FÃ�Â¼llfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  defineColors();
  background(c2);
  size(400,400);
  strokeWeight(4); 
}
 
void draw() {
defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
   
void defineColors() {
//135
g1 = (int)random(105,165);
   c2 = color(74, 102, 71);    //hintergrund
   c1 = color(171, g1, 83);    //füllfarbe
   c3 = color(255, 87, 81);      //kreis
}

