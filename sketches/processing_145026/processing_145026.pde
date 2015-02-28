
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:1px solid black;");// we call parent.document 'cause canvas are displayed in an ifram



ArrayList<Charge> poop = new ArrayList<Charge>();
void setup() {
  size(600, 200);
}

float k =  1; // 8.98E+9; //  8.9875517873681764Ã�ï¿½10^9
void draw() {
  background(-1,10);
  for (int i=0;i<poop.size();i++) {
    Charge q = poop.get(i);
    q.show();
    q.update();
    q.applyForce(poop);
    q.bounce();
  }
}

void mousePressed() {
  int t=1;
  if (mouseButton == RIGHT) t = 1;
  if (mouseButton == LEFT) t = -1;
  Charge C = new Charge(t, mouseX, mouseY);
  poop.add(C);
}

boolean flag=false;
void keyPressed() {
  flag = !flag;
}

class Charge {
  PVector loc;
  PVector vel;
  PVector acc;
  float k =  1;
  float state = 1;//1.60E-19; //  1.602176487Ã�ï¿½10Ã¢ï¿½ï¿½19
  color c;

  Charge(int t, int x, int y) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    //acc = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    state*=t;
    if (state<0)c = color(0,255, 0);
    else c=color(255, 0, 0);
  }

  void show() {
    noFill();
    strokeWeight(2);
    stroke(c);
    ellipse(loc.x, loc.y, 20, 20);
    setCharge();
  }

  void update() {
    vel.add(acc);
    vel.limit(4);
    loc.add(vel);
  }

  void applyForce(ArrayList<Charge> allCharges) {  
    acc.mult(0);
    for (int i=0;i<allCharges.size();i++) {
      Charge c = poop.get(i);
      if (this != c) {
        PVector dir = PVector.sub(loc, c.loc);
        float d = dir.mag();
        float force = (k*state*c.state)/d*d;
        dir.normalize();
        dir.mult(force);
        acc.add(dir);
        if (flag) {
          stroke(-1);
          strokeWeight(0.5);
          line(c.loc.x, c.loc.y, c.loc.x + dir.x *20, c.loc.y + dir.y * 20);
        }
      }
    }
  }

  void setCharge() {
    pushMatrix();
    translate(loc.x, loc.y);
    if (state<0)line(-5, 0, 5, 0);
    else {
      line(0, -5, 0, 5);
      line(-5, 0, 5, 0);
    }
    popMatrix();
  }

  void bounce() {
    if (loc.x < 0 || loc.x >width ) vel.x = vel.x*-1;
    if (loc.y < 0 || loc.y >height) vel.y = vel.y*-1;
  }
}
