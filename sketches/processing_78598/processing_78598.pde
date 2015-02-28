
PGraphics pg;

int mode = 1;
int offset = 2;

void setup() {
  size(720, 480);
  background(0);
  pg = createGraphics(100, 100);
  smooth();
  frameRate(50);
  text("[Drücke] 1 = Kreis | 2 = Quadrat | 3 = Dreieck", 50, height-50);
}

void draw() {
  drawCanvas();
  noLoop();
}

void drawCanvas() {
  pushMatrix();
  translate(50, 60);

  for (int i = 0; i <= ceil((width/100) - offset); i++) { 
    drawKreis(random(10), random(10));
    translate(100 + offset, 0);
  }

  translate(-612, 102);

  for (int i = 0; i <= ceil((width/100) - offset); i++) { 
    drawKreis(random(10), random(10));
    translate(100+offset, 0);
  }

  translate(-612, 102);

  for (int i = 0; i <= ceil((width/100) - offset); i++) { 
    drawKreis(random(10), random(10));
    translate(100+offset, 0);
  }

  popMatrix();
}

void drawKreis(float dx, float dy) {
  float diameter;
  diameter = random(100, 200)*noise(dx);
  pg.beginDraw();

  pg.fill(255);
  pg.stroke(0);
  pg.strokeWeight(2);
  pg.rectMode(CORNER);
  pg.rect(0, 0, 100, 100);

  pg.fill(0);
  pg.ellipseMode(CORNER);
  pg.smooth(); 


  if (mode == 1) {
    pg.ellipse(random(-20, 80), random(-20, 80), diameter, diameter);
  }


  if (mode == 2) {
    pg.rotate(random(0, 90));
    pg.translate(-100, -100);

    pg.rect(random(-20, 120), random(-20, 120), diameter, diameter);
  }

  if (mode == 3) {
    int xpos = 0;
    int ypos = 0;
    pg.translate(diameter/3, diameter/3);
    pg.rotate(random(0, 45));

    pg.triangle(
    xpos, ypos+diameter, 
    xpos+diameter, ypos+diameter, 
    xpos+diameter/2, ypos + (cos(radians(90))*diameter)
      );
  }


  pg.endDraw();

  image(pg, 0, 0);
}

void keyPressed() {
  
  if (keyCode == ENTER) {
    saveFrame("line-######.png");
  }

  if (keyCode==ESC) {
    key='1';  //disabiling ESC so to not end sketch
  }

  if (key == '1' || key == '2' || key == '3')
  {
    mode = key - 48;
    redraw();
  }
  println(mode);
}
