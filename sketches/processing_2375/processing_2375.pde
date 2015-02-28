
class Cube {
  color c;
  float xpos;
  float ypos;
  
  Cube(color C, float Xpos, float Ypos) {
    c = C;
    xpos = Xpos;
    ypos = Ypos;
  }
  
  void display() {
    noStroke();
    fill(c);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
    translate(66,0);
    box(random(60,64),60,2);
  }
}

