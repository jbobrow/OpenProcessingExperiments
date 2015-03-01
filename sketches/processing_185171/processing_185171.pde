
PGraphics pg;
PFont f;
int num=8000, frames = 20;
//color[] palette = { #FE4365, #FC9D9A, #F9CDAD, #C8C8A9, #83AF9B};
color[] palette = { #A3A948, #EDB92E, #F85931, #CE1836, #009989};

void setup() {
  size(800, 400);
  colorMode(HSB, 360, 100, 100);

  pg = createGraphics(width, height);
  //smooth(8);
  f = createFont("Arial", 250, true);

  pg.beginDraw();
  pg.background(#ffffff);
  pg.fill(#000000);
  pg.textSize(200);
  pg.textAlign(CENTER, CENTER);
  //pg.textFont(f,150);
  pg.text("L O V E", pg.width/2, pg.height*.45);
  pg.endDraw();

  drawStuff();
}

void draw() {
}

void mouseReleased() {
  drawStuff();
}

void keyPressed() {
  save(random(23232)+".jpg");

}

void drawStuff() {
  background(#202020);

  for (int i=0; i<num; i++) {
    float x = random(width);
    float y = random(height);
    color col = pg.get(int(x), int(y));
    stroke(#FE4365, 200);
    noStroke();
    if (brightness(col)<20) {    
      for (int j=0; j<5; j++) {
        fill(palette[4-j],220);
        float sz = 40-j*7;
        ellipse(x, y, sz, sz);
      }
    }
  }
}

