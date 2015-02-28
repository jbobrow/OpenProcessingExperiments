
class Brush {
  color c[];
  int colnum = 0;
  PVector pos, ppos;
  float pw, w, pd, d, theta, ptheta;
  float x1, y1, x2, y2, px1, px2, py2, py1;
  PVector one, two;
  boolean pencil = false;

  PImage pollockColors;

  PGraphics mapa;


  ArrayList vals;

  void changeColor() {

    colnum = (int)random(c.length);


    mapa = createGraphics(512, 512, JAVA2D);
    mapa.beginDraw();
    for (int i =0 ;i<1000;i++) {
      //mapa.rect(127, random(80, 125),10,10);
      mapa.stroke(127);
      mapa.line(random(10, mapa.width-10), random(10, mapa.height-10), random(10, mapa.width-10), random(10, mapa.height-10));
    }
    // mapa.filter(BLUR,1);
    mapa.endDraw();
  }

  Brush() {


    pollockColors = loadImage("pollocki.jpg");
    pollockColors.loadPixels();
    //src.filter(GRAY);
    c = new color[2000];
    for (int i = 0;i<c.length;i++) {
      c[i] = pollockColors.pixels[(int)random(pollockColors.pixels.length)];
    }

    changeColor();
    pos = new PVector(width/2, height/2, 0);
    ppos = new PVector(width/2, height/2, 0);
    w = random(2, 10);
    d = 0;






    theta = ptheta = 0;

    one = new PVector(0, 0);
    two = new PVector(0, 0);
  }

  void update() {

    pos.x += (mouseX-pos.x)/2.5;
    pos.y += (mouseY-pos.y)/2.5;
    ppos.x += (pmouseX-ppos.x)/2.5;
    ppos.y += (pmouseY-ppos.y)/2.5;


    d += (dist(pos.x, pos.y, ppos.x, ppos.y) - d) / 10.0;

    theta = atan2(ppos.y-pos.y, ppos.x-pos.x);


    pushMatrix();
    translate((pos.x+ppos.x) *.5, (pos.y+ppos.y) *.5);


    x1 = screenX(cos(theta+QUARTER_PI)*d, sin(theta+QUARTER_PI)*d);
    y1 = screenY(cos(theta+QUARTER_PI)*d, sin(theta+QUARTER_PI)*d);

    x2 = screenX(cos(theta-QUARTER_PI)*d, sin(theta-QUARTER_PI)*d);
    y2 = screenY(cos(theta-QUARTER_PI)*d, sin(theta-QUARTER_PI)*d);


    popMatrix();

    //postUpdate();

    //autobrush();
    // paint();
  }

  void postUpdate() {


    px1 = x1;
    py1 = y1;

    px2 = x2;
    py2 = y2;
  }

  void autobrush() {
    pos.x = noise(frameCount/30.0)*width*2-width/2;
    pos.y = noise(frameCount/32.0)*height*2-height/2;
    paint();
    ppos.x=pos.x;
    ppos.y=pos.y;
  }

  void paint() {

    if (pencil) {

      fill(0, 120);
      noStroke();
      quad(
      x2, y2, 
      px2, py2, 
      px1, py1, 
      x1, y1
        );
    }
    else {

      pushStyle();
      imageMode(CENTER);
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      tint(c[colnum], 10);
      image(mapa, 0, 0, d*3, d*3);
      popMatrix();
      popStyle();

      noStroke();
      fill(c[colnum], 120);

      quad(
      x2, y2, 
      px2, py2, 
      px1, py1, 
      x1, y1
        );



      stroke(c[colnum], 140);
      line(x2, y2, px2, py2);
      stroke(c[colnum], 40);
      line(x1, y1, px1, py1);
    }
  }
}


