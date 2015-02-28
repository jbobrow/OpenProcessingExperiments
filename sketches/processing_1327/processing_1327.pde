
// Using Geomerative library by Ricard Marxer:
// http://www.ricardmarxer.com/processing/geomerative/documentation/
// and Existence Light font: http://www.dafont.com/yeah-noah.d1062
import geomerative.*;
PFont font;
Particle[] particles;
int quantity = 600;
char[] lettres = {
  'L', 'O', 'V', 'E', 'Y', 'U', 'H', 'A', 'T', 'M'};
String txt;
// -----------———————————————————————————————————————————————-------
void setup() {
  font = loadFont("ExistenceA-60.vlw");
  textAlign(CENTER);
  size(900, 180, P2D);
  //size(900, 180, JAVA2D); <- it looks much better when not in a web browser but weird if it is
  smooth();
  colorMode(HSB, 1);
  background(0);
  strokeWeight(2);
  particles = new Particle[quantity];
  for (int i=0; i<quantity; i++) {
    particles[i] = new Particle();
  }
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}
// -----------———————————————————————————————————————————————-------
void draw() {
  txt = (20+random(860)>mouseX) ? "LOVE" : "HATE";
  txt = (20+random(140)>mouseY) ? txt + " YOU" : txt + " ME";
  RFont f;
  RGroup gr;
  RPoint[] points;
  f = new RFont(this,"ExistenceB.ttf",120,RFont.CENTER);
  gr = f.toGroup(txt);
  gr = gr.toPolygonGroup();
  gr.centerIn(g,30, 1, 1);
  points = gr.getPoints();
  for (int i=0;i<quantity;i++) {
    int num = int(float(i)/quantity*points.length);
    particles[i].setPos(points[num].x+width/2,points[num].y+height/2);
  }
  stroke(0);
  fill(0,.003);
  rect(0,0,width,height);
  fill(.9-random(.2)-float(mouseX)/1200,.5+random(.5),1);
  for (int i=0; i<quantity; i++) {
    particles[i].render();
  }
}
// -----------———————————————————————————————————————————————-------
class Particle {
  float x, y;
  Particle(){
  }
  void setPos(float hx, float hy) {
    x = hx;
    y = hy;
  }
  void render(){
    if (random(1)>.99) {
      textFont(font, int(random(9,18)));
      text(lettres[int(random(10))], x, y+random(12));
      if (random(1)>.99) {
        textFont(font, int(random(18,60)));
        text(lettres[int(random(10))], x, y+random(30));
      }
    }
  }
}

