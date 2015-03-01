
int count = 0;
int step = 0;
int wincount = 0;
int ss = 0;
boolean reset = false;
boolean addArrow = false;
boolean onoff = true;
boolean set = false;

ArrayList<Arrow> arrows;
Target tar   = new Target(250, 25);
ArrayList<Wind> winds;

void setup() {
  size(500, 500);
  arrows = new ArrayList<Arrow>();
  winds  = new ArrayList<Wind>();
}

void draw() {
  background(#00CCFF);
  
  if(ss == 3){
    tar.setX(); 
  }
  tar.tarDis();

  if (winds.size () < count + 1) {
    for (int i=winds.size (); i < count+1; i++) {

      if (wincount%3 == 0 || wincount%3 == 2 ) {
        Wind e = new Wind(width-10, 100+100*(wincount%3), new PVector (random(-3, -5),0));
        winds.add(e);
      } else if (wincount%3 == 1) {
        Wind e = new Wind(10, 200, new PVector (random(3, 5),0));
        winds.add(e);
      }
      wincount++;
      //println(wincount%3);
    }
  }
    for (int i = winds.size ()-1; i >= 0; i--) {
      Wind ee = winds.get(i);
      ee.move();
      ee.windDis();
      if (ee.loc.x < -30 || ee.loc.x > width+30) {
        winds.remove(i);
      }
    }

  if (addArrow && count != 3) {
    Arrow e = new Arrow(width/2, height-50);
    arrows.add(e);
    addArrow = false;
    step++;
  }
  ss = 0;
  for (int i = arrows.size ()-1; i >= 0; i--) {
    Arrow ee = arrows.get(i);
    ee.move();
    ee.arrowDis();
    if(count == 3 && ee.hit){
      ss++;
    } 
    for (int k = winds.size ()-1; k >= 0; k--) {
      Wind ww = winds.get(k);
      ee.hitWin(ww.loc, ww.vec);
    }
    if (i == count) {
      ee.fireArrow();
    }
    if (reset) {
      arrows.remove(i);
    }
  }

  if (arrows.size () == 0) {
    count = 0;
    reset = false;
    tar.resetX();
  }
}

void mousePressed() {
  if (onoff) {
    if (!set) {
      if (count == 3) {
        reset = true;
      } else {
        switch(step) {
        case 0:
          addArrow = true;
          break;
        case 1:
          step++;
          set = true;
          break;
        case 3:
          step = 0;
          count++;
          break;
        }
        onoff = false;
      }
    }
  }
}

void mouseReleased() {
  onoff = true;
}

class Arrow {
  PVector vec;
  PVector loc;
  float px, py;
  boolean hit = false;

  Arrow(float x_, float y_) {
    vec = new PVector(0, 0);
    loc = new PVector(x_, y_);
  }

  void move() {
    hitTar();
    loc.add(vec);
  }

  void fireArrow() {
    if (step == 2) {
      PVector pow = PVector.sub(tar.loc, loc);
      pow.limit(5);
      apforce(pow);
      step++;
    }
  }
  
  void hitWin(PVector arr_, PVector vec_ ) {
    PVector len = PVector.sub(arr_, loc);
    float lenm  = len.mag();
    if (lenm <= 20) {
      PVector win =  vec_.get();
      win.normalize();
      win.mult(1);
      
      apforce(win);
    }
  }

  void hitTar() {
    PVector len = PVector.sub(tar.loc, loc);
    float lenm  = len.mag();
    if (lenm <= 25) {
      float ma = map(lenm, 20, 25, 0, 5);
      len.normalize();
      len.mult(ma);
      len.sub(vec);
      apforce(len);
      if(py == loc.y){
        set = false;
        hit = true;
      }
      //println(step + "  :  " + ss + " : " + hit);
       
      px = loc.x;
      py = loc.y;
    }
    if(loc.y <= -10){
        set = false;
      }
  }

  void apforce(PVector force) {
    vec.add(force);
  }

  void arrowDis() {
    stroke(0);
    pushMatrix();
    strokeWeight(1);
    translate(loc.x, loc.y);
    fill(100);
    triangle(0, 0, 5, 20, -5, 20);
    fill(#AA3300);
    rect(-2, 20, 4, 50);
    fill(#CCFF00);
    quad(-2, 50, -7, 55, -7, 75, -2, 70);
    quad(2, 50, 7, 55, 7, 75, 2, 70);
    popMatrix();
  }
}

class Target {
  PVector vec;
  PVector loc;
  float x1, x2;

  Target(float x_, float y_) {
    vec = new PVector(0, 0);
    loc = new PVector(x_, y_);
    x1 = 0;
    x2 = 0;
  }
  
  void setX(){
    if(x1 <= 10){
    x1++;
    x2--;
    }
  }
  
  void resetX(){
    x1 = 0;
    x2 = 0;
  }

  void tarDis() {
    noStroke();
    pushMatrix();
    translate(loc.x+x1, loc.y);
    fill(#FF0055);
    beginShape();
    vertex(0.0, 50.0);
    bezierVertex(0.0, 50.0, 29.0, 34.0, 35.0, 20.0);
    bezierVertex(44.0, 7.0, 46.0, -10.0, 32.0, -18.0);
    bezierVertex(18.0, -25.0, 0.0, 0.0, 0.0, 0.0);
    endShape(CLOSE);
    popMatrix();
    pushMatrix();
    translate(loc.x+x2, loc.y);
    beginShape();
    vertex(0.0, 50.0);
    bezierVertex(0.0, 50.0, 0.0, 0.0, 0.0, 0.0);
    bezierVertex(0.0, 0.0, -18.0, -25.0, -32.0, -18.0);
    bezierVertex(-46.0, -10.0, -44.0, 7.0, -35.0, 20.0);
    bezierVertex(-29.0, 34.0, 0.0, 50.0, 0.0, 50.0);
    endShape(CLOSE);
    popMatrix();
  }
}

class Wind {
  PVector vec;
  PVector loc;

  Wind(float x_, float y_, PVector vec_) {
    vec = new PVector(0, 0);
    loc = new PVector(x_, y_);
    apforce(vec_);
  }
  
  void move(){
    loc.add(vec);
  }
  
  
  void apforce(PVector force){
    vec.add(force);  
  }

  void windDis() {
    pushMatrix();
    stroke(2);
    strokeWeight(3);
    translate(loc.x, loc.y);
    beginShape();
    noFill();
    vertex(-82, 14.0);
    bezierVertex(-82.0, 14.0, -82.0, 14.0, -82.0, 14.0);
    bezierVertex(-41.0, 18.0, -21.0, 20.0, 9.0, 15.0);
    bezierVertex(39.0, 10.0, 47.0, -36.0, -5.0, -33.0);
    bezierVertex(-57.0, -30.0, -31.0, 17.0, -2.0, 20.0);
    bezierVertex(27.0, 23.0, 91.0, 17.0, 91.0, 17.0);
    endShape();

    beginShape();
    vertex(-81.0, 29.0);
    bezierVertex(-81.0, 29.0, -81.0, 29.0, -81.0, 29.0);
    bezierVertex(-81.0, 29.0, 84.0, 36.0, 84.0, 36.0);
    endShape();
    popMatrix();
  }
}
