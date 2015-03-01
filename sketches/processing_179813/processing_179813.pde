
ArrayList grass = new ArrayList();
 
void setup() {
  size(640, 640);
  stroke(255, 150, 0, 10);
  for (int i = 0; i <= 360; i+=2) {
    if(i < 10){
      grass.add(new Grass(new PVector(width/2+sin(radians(i))*100, height/2+cos(radians(i))*100), 180));
    }
    if(i > 90 && i < 270){
      grass.add(new Grass(new PVector(width/2+sin(radians(i))*100, height/2+cos(radians(i))*100), 0));
    }
    
    if(i > 350){
      grass.add(new Grass(new PVector(width/2+sin(radians(i))*100, height/2+cos(radians(i))*100), 180)); 
    }
  }
}
 
void draw() {
  background(0);
  for (int i = 0; i < grass.size (); i++) {
    Grass g = (Grass) grass.get(i);
    g.draw();
  }
}
 
class Grass {
  ArrayList blades = new ArrayList();
  PVector loc;
  int am = (int)random(12, 36), a;
 
  Grass(PVector loc, int a) {
    this.loc = loc;
    this.a = a;
    for (int i = 0; i < am; i++) {
      blades.add(new Blade(random(10, 50)));
    }
  }
 
  void draw() {
    for (int i = 0; i < blades.size (); i++) {
      Blade b = (Blade) blades.get(i);
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(radians(a + b.angle));
      b.branch(b.segments);
      popMatrix();
    }
  }
}
 
class Blade {
  float segments, angle;
  float num;
 
  Blade(float segments) {
    this.segments = segments;
    angle = random(-20, 20);
  }
 
  void branch(float len) {
    len *= map(mouseX, 0, width, 0.3, 0.7);
    strokeWeight(map(len, 1, segments, 0.1, 4));
    line(0, 0, 0, -len);
    translate(0, -len);
    if (len > 5) {
      pushMatrix();
      rotate(radians(angle+sin(len+num)));
      branch(len);
      popMatrix();
    }
    /* Movement effectivle works on the computer, not on the web. */
    //num+=0.01;
  }
}



