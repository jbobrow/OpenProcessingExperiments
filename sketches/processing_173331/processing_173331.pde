
PImage back;

void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  noFill();
  smooth();
  strokeWeight(2);
  background(0);
  back = loadImage("profile.jpg");
  image(back, 0, 0);
}
void draw_circ_grad(int x, int y, int maxd) {
  color c1 = color(random(100), 100, 100);
  color c2 = color(random(100), 100, 30);
  for(int d = 0; d < maxd; d++) {
    float n = map(d, 0, maxd, 0, 1);
    color newc = lerpColor(c1, c2, n);
    stroke(newc);
    ellipse(x, y, d, d);
    background (back);
  }
}
void draw(){
  filter(GRAY);
  color (#FFFF00);
  triangle (322,116,292,192,264,118);
  triangle (264,118,292,192,226,163);
  triangle (226,163,264,118,202,161);
  triangle (202,161,226,163,224,187);
  triangle (226,163,224,187,292,192);
  triangle (224,187,202,161,211,217);
  triangle (211,217,224,187,255,243);
  triangle (255,243,217,260,212,218);
  triangle (255,243,292,192,224,187);
  triangle (292,192,255,243,273,258);
  triangle (273,258,292,192,297,259);
  triangle (255,243,217,260,233,294);
  triangle (255,243,233,294,273,263);
  triangle (297,284,258,296,298,306);
}
void mousePressed() {
  draw_circ_grad(mouseX, mouseY, int(random(50, 300)));
}


























