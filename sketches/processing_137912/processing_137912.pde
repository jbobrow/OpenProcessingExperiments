
Ring rollRing1;
Ring rollRing2;
Ring rollRing3;

void setup(){
size(700,250);
rollRing1 = new Ring(color(150), 0, 40, 3);
rollRing2 = new Ring(color(250, 250, 0),0, 130, 2);
rollRing3 = new Ring(color(0), 0, 210, 4);
}
void draw(){
  background(100);
  line(675, 0, 675, 675); //finish line
  line(0, 85, 675, 85);
  line(0, 170, 675, 170);
  rollRing1.roll();
  rollRing1.display();
  rollRing2.roll();
  rollRing2.display();
  rollRing3.roll();
  rollRing3.display();
}
class Ring {
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
  Ring (color RingC, float ringxpos, float ringypos, float ringxspeed) {
    c = RingC;
    xpos = ringxpos;
    ypos = ringypos;
    xspeed = ringxspeed;
  }
    void display() {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 40, 40);
    fill(100);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 30, 30);
  }
 
  void roll() {
    xpos = xpos + xspeed;
    if (mousePressed) {
      xpos = 0;    
    }
  }
}
