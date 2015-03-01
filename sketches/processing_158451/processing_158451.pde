
ArrayList<Insect> poop = new ArrayList();
void setup() {
  size(2024, 1768);
  addInsect();
}
 
void draw() {
  background(0);
  translate(width>>1, height>>1);
  scale(2);
  for (Insect I : poop) {
    I.show();
    I.move();
  }
}
 
class Insect {
  float theta=0f, x, y, l=300f, angle, dx;
  boolean forward=false;
  int xl=30, yl=25, speed;
  Insect() {
    speed=int(random(4, 10));
    angle = random(-PI, PI);
    dx=random(-50, 50);
    y=0;
  }
 
  void show() {
    pushMatrix();
    rotate(angle);
    translate(x+dx, y);
    //stroke(255, 0, 0);
    //line(0, 0, -yl*sin(radians(theta)), 0);
    //------LEFT LEG-----------
    pushMatrix();
    rotate(radians(theta));
    stroke(-1);
    line(0, 0, 0, yl);
    noStroke();
    fill(#A603FF);
    ellipse(0, yl, 5, 5);
    popMatrix();
    //-------RIGHT LEG------------
    pushMatrix();
    rotate(PI-radians(theta));
    stroke(-1);
    line(0, 0, 0, yl);
    fill(#A603FF);
    noStroke();
    ellipse(0, yl, 5, 5);
    popMatrix();
    
        pushMatrix();
       translate(18, 0);
      //------LEFT ARM-----------
   pushMatrix();
    rotate(radians(theta-35));
    stroke(-1);
    line(0, 0, 0, yl*.8f);
    noStroke();
    fill(#A603FF);
    ellipse(0, yl*.8f, 5, 5);
    popMatrix();
    //-------RIGHT ARM------------
    pushMatrix();
    rotate(PI-radians(theta-35));
    stroke(-1);
    line(0, 0, 0, yl*.8f);
    fill(#A603FF);
    noStroke();
    ellipse(0, yl*.8f, 5, 5);
    popMatrix();
    popMatrix();
    

    
    
    //-------TUMMY-----------
    stroke(-1);
    line(0, 0, xl, 0);
    noStroke();
    fill(#FF0346);
    ellipse(xl, 0, 8, 8);
    fill(-1, 90);
    ellipse(8, 0, 15, 10);
    //--------------------
    popMatrix();
  }
 
  void move() {
    l=yl*sin(radians(3));
    if (!forward) {
      x+=l;
      theta+=speed;
    } else {
      theta-=1;
            x-=l*.1f;

      if (theta<0)forward=false;
    }
    if (theta>90) {
      forward=true;
    }
  }
}
 
void mousePressed() {
  poop.clear();
  addInsect();
}
 
void addInsect() {
  for (int i=0; i<10; i++) {
    Insect I = new Insect();
    poop.add(I);
  }
}
