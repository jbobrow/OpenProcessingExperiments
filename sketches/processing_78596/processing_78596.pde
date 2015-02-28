
ArrayList Kreise;
ArrayList Quadrate;
ArrayList Dreiecke;

ArrayList DesKreise;
ArrayList DesDreiecke;
ArrayList DesQuads;

int bSize = 100;
int life = 300;

void setup() {
  size(720, 480);
  background(255);
  fill(0);
  noStroke();
  randomSeed(100);
  frameRate(30);

  Kreise = new ArrayList();
  Quadrate = new ArrayList();
  Dreiecke = new ArrayList();

  DesKreise = new ArrayList();
  DesDreiecke = new ArrayList();
  DesQuads = new ArrayList();


  Kreise.add( new Kreis(width/8, height/3, bSize));
  Dreiecke.add ( new Dreieck((width/8)*4-bSize/2, height/3, bSize, -1));
  Quadrate.add( new Quadrat((width/8)*6, height/3, bSize));

  //DesKreise.add( new DesKreis(width/8+bSize/2, height/3+bSize/2, 10, 10));

  smooth();
}

void draw() {
  background(255);
  fill(0);

  for (int i = Kreise.size()-1; i >= 0; i--) {
    Kreis k = (Kreis) Kreise.get(i); 
    k.display();
    k.shakeDist(mouseX, mouseY);

    if (mousePressed && k.rollOverKreis(mouseX, mouseY)) {
      Kreise.remove(i);
      for (int j = 0; j < 200; j++) {
        DesKreise.add(new DesKreis (width/8+bSize/2+sin(radians(norm(Kreise.size(),0,360)))*bSize, height/3+bSize/2+sin(radians(norm(Kreise.size(),0,360)))*bSize, random(bSize/8, bSize/4), random(-5, 5)*noise(frameCount)*3, random(-10, 10)*noise(frameCount)*3));
      }
    }
  }

  for (int i = Dreiecke.size()-1; i >= 0; i--) {
    Dreieck d = (Dreieck) Dreiecke.get(i); 
    d.display();
    d.shakeDist(mouseX, mouseY);
    if (mousePressed && d.rollOverDrei(mouseX, mouseY)) {
      Dreiecke.remove(i);
      for (int j = 0; j < 200; j++) {
        DesDreiecke.add(new DesDreieck ((width/8)*4, height/3+bSize/2, random(bSize/8, bSize/4), -1, random(-5, 5)*noise(frameCount)*3, random(-10, 10)*noise(frameCount)*3));
      }
    }
  }  

  for (int i = Quadrate.size()-1; i >= 0; i--) {
    Quadrat q = (Quadrat) Quadrate.get(i); 
    q.display();
    q.shakeDist(mouseX, mouseY);
    if (mousePressed && q.rollOverQuad(mouseX, mouseY)) {
      Quadrate.remove(i);
      for (int j = 0; j < 200; j++) {
        DesQuads.add(new DesQuad ((width/8)*6+bSize/2, height/3+bSize/2, random(bSize/8, bSize/4), random(-5, 5)*noise(frameCount)*3, random(-10, 10)*noise(frameCount)*3));
      }
    }
  }

  for (int i = DesKreise.size()-1; i >= 0; i--) {
    DesKreis dk = (DesKreis) DesKreise.get(i);
    dk.display();
    dk.update();
    if (dk.finished()) {
      DesKreise.remove(i);
    }
    if (DesKreise.size() == 0) {
      Kreise.add( new Kreis(width/8, height/3, bSize));
    }
    //println(sin(radians(frameCount % 360)));
  }

  for (int i = DesDreiecke.size()-1; i >= 0; i--) {
    DesDreieck dd = (DesDreieck) DesDreiecke.get(i);
    dd.display();
    dd.update();
    if (dd.finished()) {
      DesDreiecke.remove(i);
    }
    if (DesDreiecke.size() == 0) {
      Dreiecke.add( new Dreieck((width/8)*4-bSize/2, height/3, bSize, -1));
    }
  }

  for (int i = DesQuads.size()-1; i >= 0; i--) {
    DesQuad dq = (DesQuad) DesQuads.get(i);
    dq.display();
    dq.update();
    if (dq.finished()) {
      DesQuads.remove(i);
    }
    if (DesQuads.size() == 0) {
      Quadrate.add( new Quadrat((width/8)*6, height/3, bSize));
    }
  }

}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("line-######.png");
  }
}



class Dreieck {
  float xpos;
  float ypos;
  float richtung;
  float breite;
  float hoehe;

  Dreieck(float _xpos, float _ypos, float _breite, float _richtung ) {
    xpos = _xpos;
    ypos = _ypos;
    breite = _breite;
    hoehe = _breite;
    richtung = _richtung;

    //println(breite = ceil(sqrt(3)/2*hoehe));  //gleichseitiges triangle
  }

  void display() {
    triangle(
    xpos, ypos+hoehe, 
    xpos+breite, ypos+hoehe, 
    xpos+breite/2, ypos + (cos(radians(90))*hoehe)
      );
    float test = xpos+ceil(breite/2)*this.richtung;
  }

  void shakeDist(int mx, int my) {
    float thisDist = dist(mx, my, xpos+bSize/2, ypos-bSize/2);
    float randX = xpos;
    float amp = norm(thisDist, 0.001, 25);

    xpos = (width/8)*4-bSize/2 + int(random(-1*noise(frameCount), 1*noise(frameCount)) / amp * 80);
    ypos = height/3 + int(random(-1*noise(frameCount), 1*noise(frameCount)) / amp * 80);
  }

  boolean rollOverDrei(int mx, int my) {
    if (dist(mx, my, xpos, ypos) < breite) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class DesDreieck extends Dreieck {
  float life;
  float xspeed, yspeed;

  DesDreieck(float xpos, float ypos, float breite, float richtung, float _xspeed, float _yspeed) {
    super(xpos, ypos, breite, richtung);
    xspeed = _xspeed;
    yspeed = _yspeed;
    life = 300 + random(50);
  }

  boolean finished() {
    life -= 2;

    if (life < 0) return true;
    else 
      return false;
  }

  void display() {
    fill(0,life);
    triangle(
    xpos, ypos+hoehe, 
    xpos+breite, ypos+hoehe, 
    xpos+breite/2, ypos + (cos(radians(90))*hoehe)
    );

  }

  void update() {
    xpos += xspeed;
    ypos += yspeed;
    //zpos += zspeed;
    //println ("zpos: "+ zpos);
  }
}

class Kreis {

  float xpos;
  float ypos;
  float radius;
  float speed;
  boolean rollOver;

  Kreis(float _xpos, float _ypos, float _radius) {
    xpos = _xpos;
    ypos = _ypos;
    radius = _radius;
    ellipseMode(CORNER);
  }

  void display() {
    fill(0);
    ellipse(xpos, ypos, radius, radius);
  }

  void shakeDist(int mx, int my) {
    float thisDist = dist(mx, my, xpos+radius/2, ypos+radius/2);
    float randX = xpos;
    float amp = norm(thisDist, 0.001, 10);

    xpos = width/8 + random(-1*noise(frameCount), 1*noise(frameCount)) / amp * 50 + noise(frameCount)/10;
    ypos = height/3 + random(-1*noise(frameCount), 1*noise(frameCount)) / amp * 50 + noise(frameCount)/10;
  }

  boolean rollOverKreis(int mx, int my) {
    if (dist(mx, my, xpos, ypos) < radius) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class DesKreis extends Kreis {

  float life;
  float xspeed, yspeed;

  DesKreis(float xpos, float ypos, float radius, float _xspeed, float _yspeed) {
    super(xpos, ypos, radius);
    xspeed = _xspeed;
    yspeed = _yspeed;
    life = 300 + random(50);
  } 

  boolean finished() {
    life -= 2;
    if (life < 0) return true;
    else 
      return false;
  }

  void display() {
    fill(0, life);
    ellipse(xpos, ypos, radius, radius);
  }

  void update() {
    xpos += xspeed;
    ypos += yspeed;
  }
}

class Quadrat {

  float xpos;
  float ypos;
  float breite;
  float hoehe;

  Quadrat(float _xpos, float _ypos, float _breite) {
    xpos = _xpos;
    ypos = _ypos;
    breite = _breite;
    hoehe = _breite;
    rectMode(CORNER);
  }

  void display() {
    fill(0);
    rect(xpos, ypos, breite, hoehe);
  }

  void shakeDist(int mx, int my) {
    float thisDist = dist(mx, my, xpos+breite/2, ypos+hoehe/2);
    float randX = xpos;
    float amp = norm(thisDist, 0.001, 10);

    xpos = (width/8)*6 + random(-1*noise(frameCount), 1*noise(frameCount)) / amp * 50 + noise(frameCount)/10;
    ypos = height/3 + random(-1*noise(frameCount), 1*noise(frameCount)) / amp * 50 + noise(frameCount)/10;
  }

  boolean rollOverQuad(int mx, int my) {
    if (dist(mx, my, xpos, ypos) < breite) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class DesQuad extends Quadrat {

  float life;
  float xspeed, yspeed;

  DesQuad(float xpos, float ypos, float radius, float _xspeed, float _yspeed) {
    super(xpos, ypos, radius);
    xspeed = _xspeed;
    yspeed = _yspeed;
    life = 300 + random(50);
  } 

  boolean finished() {
    life -= 2;
    if (life < 0) return true;
    else 
      return false;
  }

  void display() {
    fill(0, life);
    rect(xpos, ypos, breite, hoehe);
  }

  void update() {


    xpos += xspeed;
    ypos += yspeed;
  }
}
