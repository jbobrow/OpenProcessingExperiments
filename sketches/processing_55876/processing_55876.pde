
ArrayList al;
float lastOne;

void setup() {
  size(750,440);
  al = new ArrayList();
  lastOne = millis();
}

void draw() {
  background(202);
  stroke(0,20);
  line(0,height*.5,width,height*.5);
  
   for(int i=al.size(); i>0; i--) {
    Paseante p =(Paseante)al.get(i-1);
    p.update();
    if (p.outOfBonds()) al.remove(i-1);
  }
  
  for(int i=0; i<al.size(); i++) {
    Paseante p =(Paseante)al.get(i);
    p.display();
  }
  
  if (millis()-lastOne>1000) addPeople();
}

void mouseClicked() {
 addPeople();
 int tio = floor(random(al.size()));
  Paseante p = (Paseante)al.get(tio);
  p.patina();
}

void addPeople() {
  if (al.size()<120) {
   al.add(new Paseante());
  lastOne = millis();
  }
  
}

class Paseante {
  
  PVector pos;
  PVector vel;
  PVector velScale;
  
  Paseante() {
    pos = new PVector();
    pos.x = random(width);
    pos.y = height*.5+random(height*.5);
    vel = new PVector();
    velScale = new PVector();
  }
  
  void update() {
    velScale.x = vel.x;
    velScale.y=vel.y;
    velScale.mult(far());
    pos.add(velScale);
    
    vel.mult(.95);    
  }
  
  boolean outOfBonds() {
   return ((pos.y<height*.5)||(pos.y>height)||(pos.x>width)||(pos.x<0));
  }
  
  float alfa() {
    return map(pos.y,height*.5,height,20,255);
  }
  
  float far() {
    return map(pos.y,height*.5,height,.1,1.2);
  }
  
  void display() {
    pushMatrix();
    translate(pos.x,pos.y);
    //stroke(0, alfa);
    noStroke();
    fill(0,alfa());
    scale(far());
    rect(0,0,width/50,height/15);
    popMatrix();
  }
  
  void patina() {
    vel.x = random(-10,10);
    vel.y = random(-10,10);
    vel.limit(width/100);
  }
}
