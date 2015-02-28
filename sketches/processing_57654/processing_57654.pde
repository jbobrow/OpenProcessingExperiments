
ArrayList stars = new ArrayList();
int lifetime = 255;

void setup() {
  size(400,400);
  smooth();
  colorMode(HSB);
}

void draw(){
  background(255);
  
  if (mouseX!=pmouseX || mouseY!=pmouseY){
    PVector pos = new PVector(mouseX,mouseY);
    stars.add(new Star(pos));
  }
  
  for (int i=0; i<stars.size(); i++) {
    Star stari = (Star) stars.get(i);
    stari.life+=2;
    if(stari.life>=lifetime) {
      stars.remove(i);
    }
    stari.display();
  }
}

class Star {
  PVector pos;
  int life;
  float rad;
  
  Star(PVector posin) {
    pos=posin;
    life=0;
    rad=random(10,50);
  }
  
  void display() {
    noFill();
    stroke(life,123-life/2,255,255-life);
    strokeWeight(life);
    ellipse(pos.x,pos.y,rad,rad);
 }
}

