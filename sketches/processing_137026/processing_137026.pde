
ArrayList pajaritos;
Point[] resolution;

void setup() {
  defineResolutions();
  int res = 2;
  size(1024, 768);
  smooth();
  pajaritos = new ArrayList();
  noLoop();
}

void draw() {
  createPajaritos();
  removeSome();
  removeSome();
  background(#0F3B67);
  fill(#0C3055);
  noStroke();
  rect(0, 0, width, 100);
  for (int i = 0; i < pajaritos.size(); i++) {
    Pajarito p = (Pajarito)pajaritos.get(i);
    p.render();
  }
}


void createPajaritos() {
  float off = 5;
  for (float y = 100; y < height - height*.15; y *= 1.006) {
    for (float x = -100; x < width + 100; x += random(y*0.5)) {
      Pajarito p = new Pajarito (x + random(-off * y*.1, off * y*.1), y + random(-off,off), y * 0.1);
      pajaritos.add(p);
    }
  }
}


void keyPressed() {
  if (key == ' ') {
    pajaritos.clear();
    createPajaritos();
    redraw();
  }
  if (key == 's') {
    saveFrame("TwittPals-"+width+"x"+height+".png");
    println("Saved file: TwittPals-"+width+"x"+height+".png");
  }
}

void removeSome() {
  for (int i = 0; i < pajaritos.size(); i++) {
    Pajarito p = (Pajarito)pajaritos.get(i);
    float a = map(p.y, 100, height, 0, width*.25);
    if(abs(p.x - (width/3)) <= a){
      pajaritos.remove(i);
      
      /* (45 + inc,  75 + inc, 126 + inc); */
    }
    if((p.x < width/3) && (random(1) > 0.5)){
       float inc = random(5, 20); 
       color col = color(50 + inc,  70 + inc, 131 + inc);
       p.col = col;
       p.ala.col = col;
    }
    
     if((p.x > width/3) && (random(1) > 0.5)){
       float inc = random(5, 20); 
       color col = color(55 + inc,  85 + inc, 121 + inc);
       p.col = col;
       p.ala.col = col;
    }
  }
}

void defineResolutions(){
  resolution = new Point[8];
  resolution[0] = new Point(320, 480);
  resolution[1] = new Point(1024, 768);
  resolution[2] = new Point(1280, 800);
  resolution[3] = new Point(1280, 1024);
  resolution[4] = new Point(1440, 900);
  resolution[5] = new Point(1600, 1024);
  resolution[6] = new Point(1680, 1050);
  resolution[7] = new Point(1920, 1200);
}



class Ala {
  float x, y, big;
  color col;
  /*
   a
   
   
   
   
   
   j    i
              h
             g
          f
             e
           d 
   b          c
   
   */
  Point a, b, c, d, e, f, g, h, i, j;

  Ala(float _x, float _y, float _big, color _col) {

    x = _x;
    y = _y;
    big = _big;
    col = _col;
    
    a = new Point(big*.25, -big*.25);
    b = new Point(big*.25, big*.4);
    c = new Point(big*.6, big*.63);
    d = new Point(big*.8, big*.54);
    e = new Point(big*.6, big*.45);
    f = new Point(big*.8, big*.36);
    g = new Point(big*.6, big*.27);
    h = new Point(big*.8, big*.18);
    i = new Point(big*.6, big*.09);
    j = new Point(big*.5, 0);

    a.ofuscate(big * 0.03);
    b.ofuscate(big * 0.03);
    c.ofuscate(big * 0.03);
    c.ofuscate(big * 0.03);
    e.ofuscate(big * 0.03);
    f.ofuscate(big * 0.03);
    g.ofuscate(big * 0.03);
    h.ofuscate(big * 0.03);
    i.ofuscate(big * 0.03);
  }

  void render() {
    fill(col);
    beginShape();
    curveVertex(a.x, a.y);
    curveVertex(a.x, a.y);
    curveVertex(b.x, b.y);
    curveVertex(c.x, c.y);
    curveVertex(d.x, d.y);
    curveVertex(e.x, e.y);
    curveVertex(f.x, f.y);
    curveVertex(g.x, g.y);
    curveVertex(h.x, h.y);
    curveVertex(i.x, i.y);
    curveVertex(j.x, j.y);
    curveVertex(j.x, j.y);
    endShape();
  }
}

class Ojo {
  Point p;
  float big, r1, r2; 

  Ojo(float x, float y, float _big) {
    p = new Point(0, 0);
    big = _big;
    p.x = -(big *.35);
    p.y = -(big *.25);
   
    p.ofuscate(big * 0.1);
    
    r1 = random(big*.2, big*.3);
    r2 = random(big*.1, big *.15);
  }
  
  void render(){
    fill(250, 255, 201, 100);
    ellipse(p.x, p.y, r1, r1);
    noStroke();
    fill(0);
    ellipse(p.x, p.y, r2, r2);
  }
}

class Pajarito{

  float x, y, big, inc;
  boolean left;
  Point a, b, c, d;
  Ala ala;
  Ojo ojo;
  Pico pico;
  Pata p1, p2;
  color col;
  
  Pajarito(float _x, float _y, float _big){
    x = _x;
    y = _y;
    big = _big;
   
    inc = random(5, 20); 
    col = color(45 + inc,  75 + inc, 126 + inc); 
    
    ala = new Ala(x, y, big, col);
    ojo = new Ojo(x, y, big);
    pico = new Pico(x, y, big);
    p1 = new Pata(-big*.25, big/2, big);
    p2 = new Pata(big*.25, big/2, big);
    
    if(random(1) > .5){ 
      left = true;
    }
    else{
      left = false;
    }
    genPoints();
  }

  void genPoints(){ 
    /*
     a     b
     
     d     c
     */
    a = new Point(-big/2, - big/2);
    b = new Point(big/2, - big/2);
    c = new Point(big/2, big/2);
    d = new Point(-big/2, big/2);
    
    a.ofuscate(big * 0.1);
    b.ofuscate(big * 0.1);
    c.ofuscate(big * 0.1);
    d.ofuscate(big * 0.1);
  }

  void render(){
    strokeWeight(big * 0.03);
    stroke(red(col) - inc*3.5,  green(col) - inc*3.5, blue(col) - inc*3.5);
    fill(col);
    pushMatrix();
    translate(x,y);
    if(!left) scale(-1,1);
    
    beginShape();
    curveVertex(c.x, c.y);
    curveVertex(c.x, c.y);
    curveVertex(d.x, d.y);
    curveVertex(a.x, a.y);
    curveVertex(b.x, b.y);
    curveVertex(c.x, c.y);
    curveVertex(c.x, c.y);
    endShape(CLOSE);
   
    ala.render();
    p1.render();
    p2.render();
    ojo.render();
    pico.render();
    
    popMatrix();
  }


}

class Point{
  float x, y;

  Point(){
    x = random(width);
    y = random(height);
  }

  Point(float _x, float _y){
    x = _x;
    y = _y; 
  }

  void ofuscate(float q){
    x += random(-q, q);
    y += random(-q, q); 
  }
}




class Pata {
  float x, y, big;
  Point a, b, c, d, e; 
  Pata(float _x, float _y, float _big) {
    x = _x;
    y = _y;
    big = _big;

    a = new Point(x, y);
    b = new Point(x, y + big*.25);
    c = new Point(x - big*.2, y+big*.2);
    d = new Point(x - big*.25, y+big*.25);
    e = new Point(x - big*.2, y+big*.3);

    a.ofuscate(big * 0.05);
    b.ofuscate(big * 0.05);
    c.ofuscate(big * 0.05);
    d.ofuscate(big * 0.05);
    e.ofuscate(big * 0.05);
  }

  void render() {
    strokeWeight(big * 0.02);
    stroke(0);
    line(a.x, a.y, b.x, b.y);
    line(c.x, c.y, b.x, b.y);
    line(d.x, d.y, b.x, b.y);
    line(e.x, e.y, b.x, b.y);
  }
}

class Pico {
  float x, y, big;
  Point a, b, c, d, e, f;
  Pico(float _x, float _y, float _big){   
    x = _x;
    y = _y;
    big = _big;
    
    a = new Point(-big*.6, -big*.25);
    b = new Point(-big*.5, -big*.18);
    c = new Point(-big*.6, -big*.07);
    d = new Point(-big*.7, - big*.11);
    e = new Point(-big*.6, -big*.14);
    f = new Point(-big*.9, -big*.15);
    
    a.ofuscate(big * 0.05);
    b.ofuscate(big * 0.05);
    c.ofuscate(big * 0.05);
    d.ofuscate(big * 0.05);
    e.ofuscate(big * 0.05);
    f.ofuscate(big * 0.05);
  }

  void render() {
    noStroke();
    fill(0);
    beginShape();
    vertex(a.x,a.y);
    vertex(b.x,b.y);
    vertex(c.x,c.y);
    vertex(d.x,d.y);
    vertex(e.x,e.y);
    vertex(f.x,f.y);
    endShape();
  }
}



