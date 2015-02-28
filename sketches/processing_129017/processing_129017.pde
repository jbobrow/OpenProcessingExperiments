
import controlP5.*;

float[][] stars = new float[1000][2];
float accel, V, vx, vy, vyF, dx, dy, d, range;
boolean l, a;
ControlP5 c;
Slider s;
Toggle r, m, e, mars, mark;
boolean reset, skyTex;
int ground, sky;

void setup() {
  size(800, 800);
  skyTex = false;
  sky = color(107, 186, 255);
  ground = color(22, 224, 0);
  textFont(loadFont("TimesNewRomanPSMT-48.vlw"), 12);
  c = new ControlP5(this);
  s = c.addSlider("accel")
    .setSize(20, 245)
      .setPosition(10, 10)
        .setRange(0, 9.8)
          .setValue(9.8)
            .setNumberOfTickMarks(5)
              .snapToTickMarks(false)
                ;

  r = c.addToggle("reset")
    .setSize(20, 20)
      .setPosition(10, 275)
        .setColorBackground(color(255, 0, 0))
          .setColorForeground(color(255, 255, 0))
            .setColorActive(color(0, 255, 0))
              ;
  e = c.addToggle("earth")
    .setSize(30, 30)
      .setPosition(70, 10)
        ;
  e.getCaptionLabel().align(c.CENTER, c.CENTER);

  m = c.addToggle("moon")
    .setSize(30, 30)
      .setPosition(120, 10)
        ;
  m.getCaptionLabel().align(c.CENTER, c.CENTER);

  mars = c.addToggle("mars")
    .setSize(30, 30)
      .setPosition(170, 10)
        ;
  mars.getCaptionLabel().align(c.CENTER, c.CENTER);

  mark = c.addToggle("")
    .setMode(c.SWITCH)
      .setSize(35, 15)
        .setPosition(220, 17)
          ;
  mark.getCaptionLabel().setText("ON").align(c.LEFT, c.BOTTOM_OUTSIDE);

  vx = 0;
  vy = 0;
  dx = 0;
  dy = 0;
}

void draw() {
  noStroke();
  d = Math.signum(mouseX-35-dx);
  background(sky);
  fill(ground);
  rect(0, 650, 800, 150);
  if (skyTex) {
    stroke(255);
    for (int i = 0; i < 1000; i++) {
      strokeWeight(random(1, 3));
      point(stars[i][0], stars[i][1]);
    }
  }
  stroke(0);
  strokeWeight(1);
  pushMatrix();
  translate(35, 625);
  fill(255);
  ellipse(dx, dy, 50, 50);
  popMatrix();
  if (mousePressed&&!l&&!s.isMouseOver()&&!r.isMouseOver()&&!e.isMouseOver()&&!m.isMouseOver()&&!mars.isMouseOver()&&!mark.isMouseOver()) {
    vx = (mouseX-35-dx)/10;
    vy = (625-mouseY)/10;
    V = dist(vx, 0, 0, vy);
    strokeWeight(4);
    stroke(150);
    noFill();
    line(35+dx, 625, mouseX, mouseY);
    stroke(200);
    strokeWeight(2);
    dashedLine(35+dx, 625, mouseX, 625, 'h');
    dashedLine(mouseX, mouseY, mouseX, 625, 'v');
    rectMode(CORNERS);
    rect(mouseX, 625, mouseX-d*10, 615);
    rectMode(CORNER);
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(mouseX+10, mouseY+5, textWidth(""+round(dist(35+dx, 625, mouseX, mouseY))/100.0)+10, 14);
    rect(70+dx, 620, textWidth(""+abs(round(degrees(atan((625-mouseY)/(mouseX-35-dx)))))+"\u00B0")+10, 14);
    fill(0);
    text(""+round(dist(35+dx, 625, mouseX, mouseY))/100.0, mouseX+15, mouseY+17);
    text(""+abs(round(degrees(atan((625-mouseY)/(mouseX-35-dx)))))+"\u00B0", 75+dx, 632);
    text("x="+round(dist(35+dx, 625, mouseX, mouseY)/100.0*cos(atan((625-mouseY)/(mouseX-35-dx)))*100)/100.0, width-40, 300);
    text("y="+round(dist(35+dx, 625, mouseX, mouseY)/100.0*sin(atan((625-mouseY)/(mouseX-35-dx)))*100)/100.0, width-40, 320);
    strokeWeight(14);
    stroke(100);
    if (!mark.getState()) point(range=35+dx+2*(sq(V)/accel*sin(2*atan((625-mouseY)/(mouseX-35-dx)))), 650);
  }
  if (l&&vy>vyF) {
    dx+=vx;
    dy-=vy;
    vy-=accel/2;
  }
  if (l&&vy<vyF) {
    l = false;
    dy = 0;
    vy = 0;
    vx = 0;
  }
  if (reset||(keyPressed&&key=='r')) {
    reset = false;
    r.setState(false);
    dx = 0;
    delay(150);
  }
  if (keyPressed&&key=='1') {
    accel = 9.8;
    s.setValue(9.8);
    e.setState(false);
    sky = color(107, 186, 255);
    ground = color(22, 224, 0);
    skyTex = false;
  }
  if (keyPressed&&key=='2') {
    accel = 1.62;
    s.setValue(1.62);
    m.setState(false);
    sky = color(5, 7, 12);
    ground = color(204);
    skyTex = true;
    for (int i = 0; i < 1000; i++)
    stars[i]=new float[] {
      random(0, 800), random(0, 650)
      };
    }
    if (keyPressed&&key=='3') {
      accel = 3.71;
      s.setValue(3.71);
      mars.setState(false);
      sky = color(5, 7, 12);
      ground = color(168, 24, 24);
      skyTex = true;
      for (int i = 0; i < 1000; i++)
      stars[i]=new float[] {
        random(0, 800), random(0, 650)
        };
      }
    if (!mark.getState()) mark.getCaptionLabel().setText("ON").align(c.LEFT, c.BOTTOM_OUTSIDE);
    else mark.getCaptionLabel().setText("OFF").align(c.RIGHT, c.BOTTOM_OUTSIDE);
  }

  void mouseDragged() {
    vx = (mouseX-35-dx)/10;
    vy = (625-mouseY)/10;
    V = dist(vx, 0, 0, vy);
    strokeWeight(4);
    stroke(150);
    noFill();
    if (!l&&!s.isMouseOver()&&!r.isMouseOver()&&!e.isMouseOver()&&!m.isMouseOver()&&!mars.isMouseOver()&&!mark.isMouseOver()) {
      line(35+dx, 625, mouseX, mouseY);
      stroke(200);
      strokeWeight(2);
      dashedLine(35+dx, 625, mouseX, 625, 'h');
      dashedLine(mouseX, mouseY, mouseX, 625, 'v');
      rectMode(CORNERS);
      rect(mouseX, 625, mouseX-d*10, 615);
      rectMode(CORNER);
    }
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(mouseX+10, mouseY+5, textWidth(""+round(dist(35+dx, 625, mouseX, mouseY))/100.0)+10, 14);
    rect(70+dx, 620, textWidth(""+abs(round(degrees(atan((625-mouseY)/(mouseX-35-dx)))))+"\u00B0")+10, 14);
    fill(0);
    text(""+round(dist(35+dx, 625, mouseX, mouseY))/100.0, mouseX+15, mouseY+17);
    text(""+abs(round(degrees(atan((625-mouseY)/(mouseX-35-dx)))))+"\u00B0", 75+dx, 632);
    stroke(0);
    strokeWeight(14);
    stroke(100);
    if (!mark.getState()) point(range=35+dx+2*(sq(V)/accel*sin(2*atan((625-mouseY)/(mouseX-35-dx)))), 650);
  }

  void mouseReleased() {
    if (!s.isMouseOver()&&!r.isMouseOver()&&!e.isMouseOver()&&!m.isMouseOver()&&!mars.isMouseOver()&&!mark.isMouseOver()) {
      mouseX = constrain(mouseX, 35, 800);
      mouseY = constrain(mouseY, 0, 625);
      vx = (mouseX-35-dx)/10;
      vy = (625-mouseY)/10;
      vyF = -vy;
      l = true;
    }
    if (e.getState()) {
      accel = 9.8;
      s.setValue(9.8);
      e.setState(false);
      sky = color(107, 186, 255);
      ground = color(22, 224, 0);
      skyTex = false;
    }
    if (m.getState()) {
      accel = 1.62;
      s.setValue(1.62);
      m.setState(false);
      sky = color(5, 7, 12);
      ground = color(204);
      skyTex = true;
      for (int i = 0; i < 1000; i++)
      stars[i]=new float[] {
        random(0, 800), random(0, 650)
        };
      }
      if (mars.getState()) {
        accel = 3.71;
      s.setValue(3.71);
      mars.setState(false);
      sky = color(5, 7, 12);
      ground = color(168, 24, 24);
      skyTex = true;
      for (int i = 0; i < 1000; i++)
      stars[i]=new float[] {
        random(0, 800), random(0, 650)
        };
      }
  }

  void mouseClicked() {
    if (e.getState()) {
      accel = 9.8;
      s.setValue(9.8);
      e.setState(false);
      sky = color(107, 186, 255);
      ground = color(22, 224, 0);
      skyTex = false;
    }
    if (m.getState()) {
      accel = 1.62;
      s.setValue(1.62);
      m.setState(false);
      sky = color(5, 7, 12);
      ground = color(204);
      skyTex = true;
      for (int i = 0; i < 1000; i++)
      stars[i]=new float[] {
        random(0, 800), random(0, 650)
        };
      }
      if (mars.getState()) {
        accel = 3.71;
      s.setValue(3.71);
      mars.setState(false);
      sky = color(5, 7, 12);
      ground = color(168, 24, 24);
      skyTex = true;
      for (int i = 0; i < 1000; i++)
      stars[i]=new float[] {
        random(0, 800), random(0, 650)
        };
      }
  }

  void mouseWheel(MouseEvent e) {
    accel-=Math.signum(e.getAmount())/20;
    s.setValue(accel);
  }

  void dashedLine(float x1, float y1, float x2, float y2, char o) {
    float sec = dist(x1, y1, x2, y2)/10;
    if (o=='h') {
      for (int i = 0; i < 12; i++) {
        line(x1+d*sec*i, y1, x1+d*sec*++i, y1);
        i++;
      }
    }
    else if (o=='v') {
      for (int i = 0; i < 12; i++) {
        line(x1, y1+sec*i, x1, y1+sec*++i);
        i++;
      }
    }
  }



